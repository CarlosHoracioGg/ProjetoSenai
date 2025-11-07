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
            Container(
                height: 60,
                width: double.infinity,
              color: Color(0xFF590F0F),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),

          ]
        ),
      ),
    );
  }

}
