import 'package:flutter/material.dart';
import 'package:tst/banco/usuario_dao.dart';
import 'package:tst/tela_login.dart';
import 'tela_home.dart';

class TelaCadastro extends StatelessWidget{
  TelaCadastro({super.key});

  final TextEditingController nomeController = TextEditingController();
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
            decoration: const InputDecoration(labelText: 'Usuario'),
            controller: nomeController,
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
          ElevatedButton(onPressed: ()async{
            await UsuarioDAO.imprimir();
            final sucesso = await UsuarioDAO.cadastrarUsuario(
                nomeController.text,
                loginController.text,
                senhaController.text
            );
          if (sucesso > 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('"${nomeController.text}" cadastrado com sucesso! ID: $sucesso'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaHome()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Erro ao cadastrar usuário."),
                backgroundColor: Colors.red,
              ),
            );
          }
          await UsuarioDAO.imprimir();
          }, child: Text('Cadastrar'),
          ),

          ElevatedButton(onPressed: () async{
            await UsuarioDAO.imprimir();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLogin()),
                );


          }, child: Text("Login")),



        ],
      ),
      ),
    );
  }
}