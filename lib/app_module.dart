import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/features/currencies/presentation/pages/categorie_index.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => CategorieIndex()),
        // ChildRoute('/', child: (context, args) => Picture()),
      ];
}
