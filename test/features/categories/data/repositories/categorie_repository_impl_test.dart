import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/core/plataform/network_info.dart';
import 'package:store/features/categories/data/datasources/categorie_local_data_source.dart';
import 'package:store/features/categories/data/datasources/categorie_remote_data_source.dart';
import 'package:store/features/categories/data/models/categorie_model.dart';
import 'package:store/features/categories/data/repositories/categorie_repository_impl.dart';
import 'package:store/features/categories/domain/entities/categorie.dart';

class MockRemoteDataSource extends Mock implements CategorieRemoteDataSource {}

class MockLocalDataSource extends Mock implements CategorieLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late CategorieRepositoryImpl repositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CategorieRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('showCategorie', () {
    final int id_categorie = 1;
    final categorieModel = CategorieModel(
        id_categorie: id_categorie,
        description: 'test categorie',
        created_by: '2022-02-21',
        updated_by: '2022-02-21');
    final Categorie categorie = categorieModel;
    test('should check if the device is online', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repositoryImpl.showCategorie(id_categorie);
      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data is successful',
          () async {
        when(() => mockRemoteDataSource.showCategorie(any()))
            .thenAnswer((_) async => categorieModel);

        final result = await repositoryImpl.showCategorie(id_categorie);

        verify(() => mockRemoteDataSource.showCategorie(id_categorie));
        expect(result, equals(Right(id_categorie)));
      });
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  });
}
