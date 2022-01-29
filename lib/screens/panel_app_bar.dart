import 'package:auth_page/utils/global_theme_demo.dart';
import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget {

  const AppBarScreen({Key? key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
      //theme: globalTheme(),
      home: Scaffold(
        body: Center(child: Text('Контент')),
        appBar: AppBar(
          title: const Text('My AppBar'),
          actions: <Widget>[
            IconButton(
                tooltip: "Баланс",
                onPressed: () {}, icon: const Icon(Icons.account_balance_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings )),
            TextButton(
              onPressed: () {},
              child: Text('Профиль'),
              style: buttonStyle,
            ),

          ],
        ),
      ),
    );
  }
}
