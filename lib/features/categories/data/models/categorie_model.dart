import 'package:store/features/categories/domain/entities/categorie.dart';
import 'package:meta/meta.dart';

class CategorieModel extends Categorie {
  CategorieModel({
    required int id_categorie,
    required String description,
    required String created_by,
    required String updated_by,
  }) : super(
            id_categorie: id_categorie,
            description: description,
            created_by: created_by,
            updated_by: updated_by);

  factory CategorieModel.fromJson(Map<String, dynamic> jsonMap) {
    return CategorieModel(
        id_categorie: jsonMap['id_categorie'],
        description: jsonMap['description'],
        created_by: jsonMap['created_by'],
        updated_by: jsonMap['updated_by']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id_categorie': id_categorie,
      'description': description,
      'created_by': created_by,
      'updated_by': updated_by
    };
  }
}
