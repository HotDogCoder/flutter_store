import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/features/categories/domain/entities/categorie.dart';
import 'package:store/features/categories/domain/repositories/abstract_categorie_repository.dart';
import 'package:store/features/categories/domain/usecases/show_categorie.dart';
import 'package:dartz/dartz.dart';

class MockCategorieRepository extends Mock
    implements AbstractCategorieRepository {}

void main() {
  late ShowCategorieUseCase usecase;
  late MockCategorieRepository mockCategorieRepository;
  setUp(() {
    mockCategorieRepository = MockCategorieRepository();
    usecase = ShowCategorieUseCase(mockCategorieRepository);
  });

  const int id_categorie = 1;
  final Categorie categorie = Categorie(
      id_categorie: 1,
      description: 'Panes',
      created_by: '2022-02-21',
      updated_by: '2022-02-21');

  test('should show a specific categorie data : ', () async {
    // expect(mockShowCategorie.showCategorie(any()), []);
    when(() => mockCategorieRepository.showCategorie(any()))
        .thenAnswer((_) async => Right(categorie));

    final result = await usecase(Params(id_categorie: id_categorie));
    expect(result, Right(categorie));
    verify(() => mockCategorieRepository.showCategorie(id_categorie));
    verifyNoMoreInteractions(mockCategorieRepository);
  });
}
