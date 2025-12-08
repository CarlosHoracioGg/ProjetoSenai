import 'package:flutter/material.dart';

class TelaSuporte extends StatelessWidget {
  TelaSuporte({super.key});

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBC2A6),
      appBar: AppBar(
        title: const Text('Suporte'),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18,
        ),
        backgroundColor: const Color(0xFF414A37),
      ),

      body: SingleChildScrollView(   // <<< IMPORTANTE: PERMITE ROLAR SE FICAR GRANDE
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Title(
                color: Colors.white,
                child: const Text(
                  "Fale Conosco",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 30,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// CONTAINER MAIOR (AQUI AUMENTEI)
              Container(
                width: double.infinity,
                height: 550, // <<< AQUI DEIXA A TELA MAIS COMPRIDA
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF414A37),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10),

                    // CAMPO NOME
                    TextField(
                      controller: nomeController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // CAMPO EMAIL
                    TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // CAMPO MENSAGEM
                    Expanded(       // <<< isso ajuda a esticar sem quebrar
                      child: TextField(
                        controller: mensagemController,
                        maxLines: 10,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Mensagem",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // BOTÃO ENVIAR
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDBC2A6),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        final nome = nomeController.text;
                        final email = emailController.text;
                        final msg = mensagemController.text;

                        if (nome.isEmpty || email.isEmpty || msg.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Preencha todos os campos!"),
                            ),
                          );
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Mensagem enviada com sucesso!"),
                          ),
                        );
                      },
                      child: const Text("Enviar"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50), // só pra não grudar no final
            ],
          ),
        ),
      ),
    );
  }
}

