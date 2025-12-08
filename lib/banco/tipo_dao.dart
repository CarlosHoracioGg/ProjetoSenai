import 'package:tst/tipo.dart';

import 'database_helper.dart';
class TipoDAO{
  static Future<int> cadastrarTipo(String nome, String desc) async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.rawQuery(
        'SELECT MAX(id_tipo) as maxId FROM tb_tipo');
    int proximoId = (resultado.first['maxId'] ??
        0) as int; // se não tiver, começa do 0
    proximoId++;

    final dados = {
      'id_tipo': proximoId,
      'nm_tipo': nome,
      'desc_tipo': desc
    };

    try {
      await db.insert('tb_tipo', dados);
      return proximoId;
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }

  static Future<Tipo> listar(int? id) async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
        'tb_tipo',
        where: 'id_tipo = ?',
        whereArgs: [id]
    );

    return Tipo(
        id: resultado.first['id_nacionalidade'] as int,
        nome: resultado.first['nm_nacionalidade'] as String,
        descricao: resultado.first['desc_nacionalidade'] as String
    );
  }

  static Future<void> excluir(int? id) async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
        'tb_tipo',
        where: 'id_tipo = ?',
        whereArgs: [id]
    );
  }

  static Future<List<Tipo>> listarTodos() async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_tipo');

    return resultado.map((mapa){
      return Tipo(
          id: mapa['id_tipo'] as int,
          nome: mapa['nm_tipo'] as String,
          descricao: mapa['desc_tipo'] as String
      );
    }).toList();
  }

}