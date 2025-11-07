import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override

  Widget build(BuildContext){
    return Scaffold(
      backgroundColor:  Color(0xFF400F0F),
      appBar: AppBar(title: const Text('Login'),
      backgroundColor:  Color(0xFF590F0F),
      ),
        body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              decoration: const InputDecoration(labelText: 'Login'),
              controller: loginController
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              controller: senhaController,
            ),
            const SizedBox(height: 20),

            ElevatedButton(onPressed: ()async{


            }, child: Text('Realizar Login'))


          ],
        ),
      ),
    );
  }
}