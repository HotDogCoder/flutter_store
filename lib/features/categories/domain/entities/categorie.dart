import 'package:equatable/equatable.dart';

class Categorie extends Equatable {
  final int id_categorie;
  final String description;
  final String created_by;
  final String updated_by;

  Categorie({
    required this.id_categorie,
    required this.description,
    required this.created_by,
    required this.updated_by
  });

  @override
  List<Object?> get props => [id_categorie,description,created_by,updated_by];

  @override
  bool get stringify => true;
}