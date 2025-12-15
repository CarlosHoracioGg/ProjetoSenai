import 'package:flutter/material.dart';
import '../model/cafe.dart';
import '../dao/cafe_dao.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final TextEditingController _tempController = TextEditingController();
  List<Cafe> cafesRecomendados = [];
  String mensagem = "";

  // 
  String definirClima(double temp) {
    if (temp <= 15) {
      return "frio";
    } else if (temp <= 25) {
      return "ameno";
    } else {
      return "calor";
    }
  }

  // Busca cafés do banco e recomenda
  Future<void> buscarRecomendacoes() async {
    double? temperatura = double.tryParse(_tempController.text);

    if (temperatura == null) {
      setState(() {
        mensagem = "Digite uma temperatura válida.";
        cafesRecomendados = [];
      });
      return;
    }

    String clima = definirClima(temperatura);

    CafeDao dao = CafeDao();
    List<Cafe> todosCafes = await dao.listarCafes();

    List<Cafe> recomendados = [];

    // 
    if (clima == "frio") {
      recomendados = todosCafes.take(3).toList();
    } else if (clima == "ameno") {
      recomendados = todosCafes.skip(1).take(3).toList();
    } else {
      recomendados = todosCafes.reversed.take(3).toList();
    }

    setState(() {
      cafesRecomendados = recomendados;
      mensagem =
          "Cafés recomendados para $temperatura°C (${clima.toUpperCase()}):";
    });
  }

  @override
  void dispose() {
    _tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recomendação de Cafés"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Informe a temperatura (°C):",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ex: 22",
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: buscarRecomendacoes,
                child: const Text(
                  "Ver recomendações",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              mensagem,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: cafesRecomendados.length,
                itemBuilder: (context, index) {
                  Cafe cafe = cafesRecomendados[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.local_cafe),
                      title: Text(cafe.nome ?? ""),
                      subtitle: Text(cafe.descricao ?? ""),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
