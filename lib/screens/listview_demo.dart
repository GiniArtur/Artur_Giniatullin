
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyStatefulWidgetState()
       ),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, required this.number}) : super(key: key);
  // final String text
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all()
      ),
      child: Text('Элемент #$number', style: Theme.of(context).textTheme.headline6),
          );
  }
}



class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        MyListItem(number: 1),
        MyListItem(number: 2),
        MyListItem(number: 3),
        MyListItem(number: 4),
        MyListItem(number: 5),
        MyListItem(number: 6),
        MyListItem(number: 7),
        MyListItem(number: 8),
        MyListItem(number: 9),
        MyListItem(number: 10),
        MyListItem(number: 11), ],


            //const<Widget>[
            //ListTile(
            //leading: Icon(Icons.map),
      //title: Text('Map'),
        );
    //ListTile(
    //          leading: Icon(Icons.photo_album),
    //          title: Text('Album'),
    //            //  ),
    //        ListTile(
    //          leading: Icon(Icons.phone),
    //          title: Text('Phone'),
    //        ),
    //      ]
    // );
  }
  }
  class SimpleListBuilder extends StatelessWidget {
    SimpleListBuilder({Key? key}) : super(key: key);
    var list =  List<int>.generate (50, (i) => i + 1);

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
         itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        }
      );
    }
  }
  class SimpleListSeparated extends StatelessWidget {
    const SimpleListSeparated({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return MyListItem(number: index);
          },
        separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 5, ),
      );
    }
  }
  class MyStatefulWidgetState extends StatefulWidget {
    const MyStatefulWidgetState({Key? key}) : super(key: key);
  
    @override
    _MyStatefulWidgetStateState createState() => _MyStatefulWidgetStateState();
  }
  
  class _MyStatefulWidgetStateState extends State<MyStatefulWidgetState> {
  int _selectedIndex = 0;
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title : Text('Элемент ${index+1}'),
            selected : index == _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = index;

              });
            },
          );
        }
      );
    }
  }
  




