import 'dart:convert';
import 'dart:async';
import 'package:demotext/ProductDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class FinalProject extends StatefulWidget {
  const FinalProject({Key? key}) : super(key: key);

  @override
  _FinalProjectState createState() => _FinalProjectState();
}


class _FinalProjectState extends State<FinalProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/login',
        routes: {
          '/': (context) => const MainScreen(),
          '/contacts': (context) => const SecondScreen(),
          '/trash': (context) => const ThirdScreen(),
          '/login': (context) => const LoginScreen()
        });
  }
}

Widget navDrawer(context) => Drawer(
  child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
                color: Colors.blue
            ),
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.svg.png"),
                  ),
                  const Text("Навигация во Flutter")
                ],
              ),
            )),
        ListTile(
          leading: const Icon(Icons.one_k),
          title: const Text("Каталог"),
          onTap: (){
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.two_k),
          title: const Text("Список изделий"),
          onTap: (){
            Navigator.pushNamed(context, '/contacts');
          },
        ),

        const Divider(
        ),
        Center(child: const Text("Профиль")),
        ListTile(
          leading: const Icon(Icons.cancel),
          title: const Text("Корзина"),
          onTap: (){
          },
        )
      ]),
);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneTextController = TextEditingController();
  final _passTextController = TextEditingController();
  String? errorText;
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();


  void _auth() {
    final phone = _phoneTextController.text;
    final pass = _passTextController.text;
    errorText = "Не верный номер телефона или пароль";
    if (phone == '111' && pass == '1') {
        Navigator.of(context).pushReplacementNamed ('/');
      } else {
      _messengerKey.currentState!.showSnackBar(SnackBar(content:
      Text("$errorText")));
    }
    setState(() {});
  }

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
      scaffoldMessengerKey: _messengerKey,
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
                    controller: _phoneTextController,
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
                    controller: _passTextController,
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
                      child: ElevatedButton(
                          onPressed: _auth,
                          child: Text ('Войти'),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0079D0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36)
                              )
                          )),
                  ),
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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme
        .of(context)
        .colorScheme
        .onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              TextButton(onPressed: () {}, child: Text("Профиль"),
                style: buttonStyle,),
            ],
            title: Text("Каталог")),
        drawer: navDrawer(context),
        body: const Center(
          child: Text("Главная страница"),
        )
    );
  }
}

Future<PostWithTodoList> _fetchPostById(String id) async {
  final response = await http.get
    (Uri.parse("https://jsonplaceholder.typicode.com/users/" + id));

  if (response.statusCode == 200) {
    Map<String, dynamic> body = json.decode(response.body);
    final post = Post.fromJson(body);
    final todosResponse = await http.get
      (Uri.parse("https://jsonplaceholder.typicode.com/todos?userId=" + id));

    List todosJson = json.decode(todosResponse.body);
    final todos = todosJson.map((item) => TodoItem.fromJson(item)).toList();

    return PostWithTodoList(
      post: post,
      todos: todos
    );
  } else {
    throw Exception('Failed to load user from API');
  }
}

Future<List<Post>> _fetchPostList() async {
  final response = await http.get
    (Uri.parse("https://jsonplaceholder.typicode.com/users"));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => Post.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users from API');
  }
}
ListView _usersListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {

        return _userListTile(context, data[index].id.toString(),data[index].name,
            data[index].email);
      });
}

ListTile _userListTile(BuildContext context, String id, String subtitle, String trailing) =>
    ListTile(


  leading: Text(id,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,)),
  title: Text(subtitle),
  subtitle: Text(trailing),

  onTap: (){
    Navigator.pushNamed(context, '/trash', arguments: <String, String>{
      'id': id
    });
  },
);

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late Future<List<Post>> futurePostList;
  late List<Post> usersPostData;

  @override
  void initState() {
    super.initState();
    futurePostList = _fetchPostList();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme
        .of(context)
        .colorScheme
        .onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              TextButton(onPressed: () {}, child: Text("Профиль"),
                style: buttonStyle,),
            ],
            title: Text("Список изделий")),
        drawer: navDrawer(context),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 50),
            child: FutureBuilder<List<Post>>(
                future: futurePostList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    usersPostData = snapshot.data!;

                    return _usersListView(usersPostData);

                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                })
        ));
  }
}


ListView _usersListView2(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final post = data[index].post;
        final todos = data[index].todos;
        bool _checked = false;



        return _userListTile2(post.id.toString()+"\n",
            "Имя: "+ post.name+"\n"+
                "Улица: "+post.address.street+"\n"+
                "Серия: "+post.address.suite+"\n"+
                "Город: "+post.address.city+"\n"+
                "Индекс: "+post.address.zipcode+"\n"+
                "Телефон: "+post.phone +"\n"+
                "Компания: "+post.company.name+"\n",
                "TODOS: " + todos.length.toString() +"\n" +
                     todos[1].completed.toString());

      });
}

ListTile _userListTile2(String title, String subtitle, String trailing) =>
    ListTile(

      leading: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,)),
      title: Text(subtitle),
      subtitle: Text(trailing,
      style: TextStyle(decorationColor: Colors.red),),
      onTap: (){

      },
    );

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late Future<PostWithTodoList> futurePost;
  late PostWithTodoList postData;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null) {
      final id = arguments['id'];
      futurePost = _fetchPostById(id.toString());
    }


    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme
        .of(context)
        .colorScheme
        .onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              TextButton(onPressed: () {}, child: Text("Профиль"),
                style: buttonStyle,),
            ],
            title: Text("Корзина")),
        drawer: navDrawer(context),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: FutureBuilder<PostWithTodoList>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    postData = snapshot.data!;

                    final list =  [ postData ];

                    return _usersListView2(list);

                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                })
        ));
  }
}