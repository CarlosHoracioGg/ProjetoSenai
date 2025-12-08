import 'package:flutter/material.dart';
import 'package:tst/Telas/tela_cad_nactipo.dart';
import 'package:tst/Telas/tela_cad_produto.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // desativa o modo banner ( que exibe conteudo).
      debugShowCheckedModeBanner: false,
      home: TelaCadNT(),

    );
  }
}
