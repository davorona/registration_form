import 'package:flutter/material.dart';

class AppBarNavigation extends StatefulWidget {
  const AppBarNavigation({Key? key}) : super(key: key);

  @override
  _AppBarNavigationState createState() => _AppBarNavigationState();
}

class _AppBarNavigationState extends State<AppBarNavigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/contacts': (context) => const SecondScreen(),
        '/trash': (context) => const ThirdScreen(),
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
          Navigator.pushNamed(context, '/trash');
        },
      )
    ]),
);

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.account_balance)),
    IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
    TextButton(onPressed: (){}, child: Text("Профиль"),
    style: buttonStyle,),],
        title: Text("Каталог")),
        drawer: navDrawer(context),
        body: const Center(
    child: Text("Главная страница"),
    )
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: Icon(Icons.account_balance)),
              IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
              TextButton(onPressed: (){}, child: Text("Профиль"),
                style: buttonStyle,),],
            title: Text("Список изделий")),
        drawer: navDrawer(context),
        body: const Center(
          child: Text("Список изделий"),
        )
    );
  }
}

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: Icon(Icons.account_balance)),
              IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
              TextButton(onPressed: (){}, child: Text("Профиль"),
                style: buttonStyle,),],
            title: Text("Корзина")),
        drawer: navDrawer(context),
        body: const Center(
          child: Text("Пусто"),
        )
    );
  }
}
