import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget{
  TelaHome({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Home"),

      ),

      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 24),
                ))
          ],
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(0),


        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //logo
              Container(
                height: 90,
                width: double.infinity,
                color: Color(0xFF590F0F),

                child: Image.asset(
                  'assets/img/Paraisoa.png',
                  fit: BoxFit.contain,
                  // ou cover, fill, etc.
                ),
              ),
              Container(
                height: 360,
                width: double.infinity,
                color: Colors.green,
              ),

              Container(
                width: double.infinity,
                height: 20,
                color: Color(0xFF590F0F),
              ),
              Container(
                height: 364,
                width: double.infinity,
                color: Colors.green,
              ),
            ]
        ),
      ),
    );
  }


}
