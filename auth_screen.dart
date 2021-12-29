import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFeceff1), width: 2));
    const LinkTextStyle = TextStyle(
        fontSize: 16,
        color: Color(0xFF0079D0));

    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("Assets/YourPng.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column (children: [
                  SizedBox(height: 60),
                  SizedBox(width: 110, height: 84, child: Image(image: AssetImage("Assets/Tree.png")),),
                  SizedBox(height: 20),
                  Text('Добро пожаловать',
                      style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 6))),
                  SizedBox(height: 20),
                  TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFeceff1),
                        labelText: 'Телефон',
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                      )

                  ),
                  SizedBox(height: 20),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFeceff1),
                        labelText: 'Введите пароль',
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                      )

                  ),
                  SizedBox(height: 28),
                  SizedBox(height: 60, width: 150,
                      child: ElevatedButton(onPressed: (){}, child: Text ('Войти'),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0079D0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36)
                              )
                          ))),
                  SizedBox(height: 20),
                  InkWell(child: Text('Регистрация',
                      style: LinkTextStyle),
                      onTap: (){} ),
                  SizedBox(height: 20),
                  InkWell(child: Text('Забыли пароль?',
                      style: LinkTextStyle),
                      onTap: (){} ),

                ],),
              )
          )
      ),
    );
  }
}
