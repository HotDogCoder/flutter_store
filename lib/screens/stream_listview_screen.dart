import 'package:flutter/material.dart';
import 'package:store/bloc/things_bloc.dart';

class StreamListViewScreen extends StatelessWidget {
  
  final ThingsBloc thingsBloc = new ThingsBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: thingsBloc.getThings,
      builder: ( _ , AsyncSnapshot<dynamic> snapshot) {
        final things = snapshot.data ?? [];
        return ListView.builder(
          itemCount: things.length,
          itemBuilder: ( _ , i ){
            return ListTile(
              title: Text(things[i]),
            );
          }
        );
      },
    );
  }
}