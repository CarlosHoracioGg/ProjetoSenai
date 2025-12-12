import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  double temperatura = 20; // valor inicial
  String recomendacao = "";

  // 🔥 Lógica de recomendação SEM API (só if / else)
  String recomendarProduto(double temp) {
    if (temp <= 15) {
      return "Está frio! Recomendamos um cappuccino quente ☕";
    } else if (temp > 15 && temp <= 25) {
      return "Tempo agradável! Que tal um café latte? ☕😊";
    } else {
      return "Está calor! Recomendamos um café gelado ou frappé ❄️☕";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Home"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Temperatura atual: ${temperatura.toStringAsFixed(1)}°C",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              onPressed: () {
                setState(() {
                  recomendacao = recomendarProduto(temperatura);
                });
              },
              child: const Text("Ver recomendação"),
            ),

            const SizedBox(height: 20),

            Text(
              recomendacao,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 40),

            const Text(
              "Alterar temperatura:",
              style: TextStyle(fontSize: 18),
            ),

            Slider(
              value: temperatura,
              min: -5,
              max: 40,
              divisions: 45,
              label: "${temperatura.toStringAsFixed(1)} °C",
              onChanged: (value) {
                setState(() {
                  temperatura = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
