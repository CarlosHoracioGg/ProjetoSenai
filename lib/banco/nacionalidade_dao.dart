import 'database_helper.dart';
import 'package:tst/nacionalidade.dart';
class NacionalidadeDAO {

  static Future<int> cadastroNacionalidade(String nome, String desc) async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.rawQuery(
        'SELECT MAX(id_nacionalidade) as maxId FROM tb_nacionalidade');
    int proximoId = (resultado.first['maxId'] ??
        0) as int; // se não tiver, começa do 0
    proximoId++;

    final dados = {
      'id_nacionalidade': proximoId,
      'nm_nacionalidade': nome,
      'desc_nacionalidade': desc
    };

    try {
      await db.insert('tb_nacionalidade', dados);
      return proximoId;
    } catch (e) {
      print("Erro ao cadastrar: $e");
      return -1;
    }
  }

  static Future<Nacionalidade> listar(int? id) async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
      'tb_nacionalidade',
      where: 'id_nacionalidade = ?',
      whereArgs: [id]
    );

    return Nacionalidade(
      id: resultado.first['id_nacionalidade'] as int,
      nome: resultado.first['nm_nacionalidade'] as String,
      descricao: resultado.first['desc_nacionalidade'] as String
    );
  }

  static Future<void> excluir(int? id) async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query(
      'tb_nacionalidade',
      where: 'id_nacionalidade = ?',
      whereArgs: [id]
    );
  }

  static Future<List<Nacionalidade>> listarTodos() async{

    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_nacionalidade');

    return resultado.map((mapa){
      return Nacionalidade(
        id: mapa['id_nacionalidade'] as int,
        nome: mapa['nm_nacionalidade'] as String,
        descricao: mapa['desc_nacionalidade'] as String
      );
    }).toList();
  }
}