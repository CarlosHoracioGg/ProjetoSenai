import 'package:flutter/material.dart';

class TelaSobrenos extends StatelessWidget {
  TelaSobrenos({super.key});

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Color(0xFF400F0F),
      appBar: AppBar(title: const Text('Sobre Nós'),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF590F0F),

      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
                "Sobre Nós: somos a paraíso café, empresa especialista em servir o melhor café que você pode provar\n levando em pauta aromas e qualidades sobre cada estereotipos de café"

            , style: TextStyle(color: Color(0xFFFFFFFF)),),
            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}

