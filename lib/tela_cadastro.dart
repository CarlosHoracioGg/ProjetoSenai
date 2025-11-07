import 'package:flutter/material.dart';

class TelaCadastro extends StatelessWidget{
  TelaCadastro({super.key});

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Padding(padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Uuario'),
            controller: usuarioController,
          ),

          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: 'Login'),
            controller: loginController,
          ),

          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: 'Senha'),
            obscureText: true,
            controller: senhaController,
          ),

          const SizedBox(height: 40),
          /*ElevatedButton(onPressed: ()async{


          }, child: Text('Cadastrar'))*/



        ],
      ),
      ),
    );
  }
}