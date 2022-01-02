import 'package:demotext/global_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);


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
      theme: globalTheme(),
      home: Scaffold(
          appBar: AppBar(),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column (
                  children: [
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Регистрация',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  const Divider(
                  ),
                  SizedBox(height: 20),
                  Text('Чтобы зарегистрироваться, введите свой номер телефона и почту',
                      textAlign: TextAlign.center),
                  SizedBox(height: 14),
                  Text('Телефон',),
                  TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFeceff1),
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                      )

                  ),
                  SizedBox(height: 20),
                  Text('Почта'),
                  TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFeceff1),
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                      )

                  ),
                  SizedBox(height: 28),
                  Text("Вам придет четырехзначный код,который будет вашим паролем",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 10),
                  Text("Чтобы зарегистрироваться введите свой номер телефона и почту",
                      textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  SizedBox(height: 60, width: 150,
                      child: ElevatedButton(onPressed: (){}, child: Text ('Войти'),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0079D0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36)
                              )
                          ))),
                  SizedBox(height: 20),

                ],),
              )
          )
      ),
    );
  }
}