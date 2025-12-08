import 'package:flutter/material.dart';

class TelaSobrenos extends StatelessWidget {
  TelaSobrenos({super.key});

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Color(0xFFDBC2A6),
      appBar: AppBar(title: const Text('Sobre Nós'),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18, ),
        backgroundColor: Color(0xFF414A37),

      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Title(color: Colors.white, child: Text("Sobre Nós", style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),)),
            const SizedBox(height: 20),
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  color: Color(0xFF414A37),
                  borderRadius: BorderRadius.circular(20)),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Somos a Paraíso do Café, uma empresa especialista em servir o melhor café que você pode provar, levando em conta aromas e qualidades sobre cada bebida, sobremesa ou pratos elabordos com café, claro, isso tudo de acordo com o clima para a melhor experiencia possivel."
                    , style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),),
                  const SizedBox(height: 20),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}

