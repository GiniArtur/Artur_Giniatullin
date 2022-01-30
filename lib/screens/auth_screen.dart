import 'dart:ui';
import 'package:auth_page/utils/global_theme_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp_());
}

class MyApp_ extends StatelessWidget {
  const MyApp_({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(
        color: const Color(0xFFbbbbbb), width: 2));
        const linkTextStyle = TextStyle (fontSize : 19,
                 fontWeight: FontWeight.bold,
                 color : Color(0xFF0079D0));

    return MaterialApp(
                        home: Scaffold(
                             body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage ('assets/nebo.jpg'),
                    fit: BoxFit.cover ,
                  ),
                  ),
                  width: double.infinity ,

                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 150,),
                      const SizedBox(width: 110, height: 84, child: Image(image: AssetImage('assets/pexels-jean-van-der-meulen-1526410.jpg'),)),
                      SizedBox(height: 20,),
                      const Text('Введите логин в виде 10 цифр номера вашего телефона',
                      style: TextStyle (fontSize : 16, color : Color.fromRGBO(0, 0, 0, 0.6)),),
                      SizedBox(height: 20,),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true ,
                          fillColor: Color(0xFFeceff1),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                          labelText: '+7',
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true ,
                            fillColor: Color(0xFFeceff1),
                            enabledBorder: borderStyle,
                            focusedBorder: borderStyle,
                            labelText: 'Введите пароль'
                        ),
                      ),
                      SizedBox(height: 28,),
                      SizedBox (width: 154, height: 42, child: ElevatedButton(
                          onPressed: () {},
                          child: Text ('Войти'),
                          style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0079D0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0)
                          ),
                      ),
                      )),
                      SizedBox(height: 32,),
                      InkWell(child: const Text ('Регистрация',
                        style: linkTextStyle,),
                          onTap: () {} ),
                      SizedBox(height: 28,),
                       InkWell (child: Text ("Забыли пароль?", style: linkTextStyle,), onTap: () {} ),
                    ],),
                  ),
                ),
            ),
    );
  }

}


