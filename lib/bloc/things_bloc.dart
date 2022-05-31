import 'dart:async';

const Things = ['Algo interesante','Lorem ipsum cartadara','Mangekyu sharingan','bankai Baka boku materu'];

class ThingsBloc {
  Stream<List<String>> get getThings async* {
    final List<String> things = [];
    for( String thing in Things){
      await Future.delayed(Duration(seconds: 1));
      things.add(thing);
      yield things;
    }
  }

  StreamController<int> _thingsController = new StreamController<int>();
  Stream<int> get thingsCount => _thingsController.stream ;

  ThingsBloc() {
    this.getThings.listen(
      (event) {
        this._thingsController.add(event.length);
      }
    );
  }

  dispose() {
    _thingsController.close();
  }
}