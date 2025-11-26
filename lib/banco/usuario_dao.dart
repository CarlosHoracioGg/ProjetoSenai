import 'database_helper.dart';
import '../usuario.dart';

class UsuarioDAO{
  static Usuario usuarioLogado = Usuario();

  static Future<int> cadastrarUsuario(String nome, String login, String senha) async {
    final db = await DatabaseHelper.getDatabase();

    // Pega o maior ID existente na tabela
    final resultado = await db.rawQuery('SELECT MAX(id_usuario) as maxId FROM tb_usuario');
    int proximoId = (resultado.first['maxId'] ?? 0) as int; // se não tiver, começa do 0
    proximoId++; // incrementa para o novo cadastro

    final dadosUsuario = {
      'id_usuario': proximoId,
      'nm_usuario': nome,
      'nm_login': login,
      'ds_senha': senha
    };

    try {
      await db.insert('tb_usuario', dadosUsuario);
      return proximoId; // retorna o ID do novo usuário
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }


  static Future<bool> autenticar(String login, String senha) async{

    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query(
        'tb_usuario',
        where: 'nm_login = ? and ds_senha = ?',
        whereArgs: [login, senha]
    );

    //comentar sobre:
    usuarioLogado.id = resultado.first['id_usuario'] as int;
    usuarioLogado.nome = resultado.first['nm_usuario'] as String;
    usuarioLogado.login = resultado.first['nm_login'] as String;
    usuarioLogado.senha = resultado.first['ds_senha'] as String;
    //retorna o resultado que nao esta vazio
    return resultado.isNotEmpty;
  }

  static Future imprimir() async{

    final db = await DatabaseHelper.getDatabase();

    final resultado = await db.query( 'tb_usuario');

    if (resultado.isEmpty) {
      print("A tabela tb_usuario está vazia.");
    } else {
      print("📌 Usuários cadastrados:");
      for (var usuario in resultado) {
        print(usuario);
      }
    }
  }





}