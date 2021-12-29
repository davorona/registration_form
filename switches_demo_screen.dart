
import 'package:flutter/material.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum Skilllevel {junior, middle, senior}

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _confirmAgreement = true;
  Skilllevel? _skilllevel = Skilllevel.junior;

  void _onCheckedChanged(bool? val)  {
  setState(() {
  _checked = !_checked;
  });
  }

  void _onSkilllevelChanged (Skilllevel? value) {
    setState(() {
      _skilllevel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Center(
                child: Column(children: [
                  Row(
                    children: [
                      Checkbox(value: _checked, onChanged: _onCheckedChanged),
                      const Text("data")
                    ],
                  ),
                  CheckboxListTile
                    (title: Text("Принять условия пользовательского соглашения"),
                      value: _confirmAgreement, onChanged: (val) {
                      setState(() {
                        _confirmAgreement = !_confirmAgreement;
                      });
                      }),
                  Switch(value: _checked, onChanged: _onCheckedChanged),

                  SwitchListTile
                    (title: Text("Включить"),
                      value: _checked, onChanged: _onCheckedChanged),
                  Text("Уровень навыков"),
                  RadioListTile<Skilllevel>(
                    title: const Text('Junior'),
                    value: Skilllevel.junior,
                    groupValue: _skilllevel,
                    onChanged: _onSkilllevelChanged
                  ),
                  RadioListTile<Skilllevel>(
                    title: const Text('Middle'),
                    value: Skilllevel.middle,
                    groupValue: _skilllevel,
                    onChanged: _onSkilllevelChanged
                  ),
                  RadioListTile<Skilllevel>(
                    title: const Text('Senior'),
                    value: Skilllevel.senior,
                    groupValue: _skilllevel,
                    onChanged: _onSkilllevelChanged
                  ),

                ]))));
  }
}

