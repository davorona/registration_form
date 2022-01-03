import 'package:flutter/material.dart';

class UserNameSelector extends StatelessWidget {
  const UserNameSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Список контактов"),
        ),
          body: SimpleListSelector(

          )
      ),
    );
  }
}


class SimpleListSelector extends StatefulWidget {
  const SimpleListSelector({Key? key}) : super(key: key);

  @override
  _SimpleListSelectorState createState() => _SimpleListSelectorState();
}

class _SimpleListSelectorState extends State<SimpleListSelector> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile (
            title: Text(users[index].name),
            subtitle: Text("Телефон: ${users[index].phone}"),
            selected: index == _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });

            }
);
      },
    );
  }
}
class User{
  String name;
  String phone;
  User(this.name, this.phone);
}
final List<User> users = <User>[User("Tom", "+79265006060"),
  User("Alice", "+79265006070"), User("Bob", "+79265006080"),
  User("Sam", "+79265006090")];


