import 'package:rv_crud_challenger/app/data/database/sqlite/connection.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/data/domain/interfaces/product_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductDAOImplement implements ProductDAO {
  Database? _db;

  @override
  Future<List<Product>> find() async {
    _db = await Connection.getProduct();
    List<Map<String, dynamic>> result = await _db!.query('product');
    List<Product> list = List.generate(result.length, (index) {
      var linha = result[index];
      return Product.fromMap(linha);
    });
    return list;
  }

  @override
  remove(int id) async {
    _db = await Connection.getProduct();
    String sql = 'DELETE FROM product WHERE id = ?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Product product) async {
    _db = await Connection.getProduct();
    String sql;
    if (product.id == null) {
      sql = 'INSERT INTO product (name,details,url_photo) VALUES (?,?,?)';
      _db!.rawInsert(sql,[product.name,product.details,product.urlPhoto]);

    }else {
      sql = 'UPDATE product SET name = ?, details = ?, url_photo = ? WHERE id = ?';
      _db!.rawInsert(sql,[product.name,product.details,product.urlPhoto,product.id]);
    }
  }
}
