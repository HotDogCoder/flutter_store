import 'package:flutter/material.dart';
import 'package:store/bloc/things_bloc.dart';
import 'package:store/screens/custom_screen.dart';
import 'package:store/screens/stream_listview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current_index = 0;
  final PageController pageController = new PageController();
  final ThingsBloc thingsBloc = new ThingsBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: StreamBuilder(
          stream: thingsBloc.thingsCount,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('Things count ${snapshot.data}');
          }
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          StreamListViewScreen(),
          CustomScreen(color: Colors.blue), 
          CustomScreen(color: Colors.red)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          current_index = index; 
          print('${index.toString()}');
          pageController.animateToPage(index, duration: Duration(milliseconds: 3000), curve: Curves.bounceOut);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(label: 'Platos',icon: Icon(Icons.food_bank)),
          BottomNavigationBarItem(label: 'Categorias',icon: Icon(Icons.category)),
          BottomNavigationBarItem(label: 'Ingredientes',icon: Icon(Icons.apple))
        ]
      ),
    );
  }
}