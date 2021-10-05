import 'package:flutter/material.dart';
import 'package:tarea1/widgets/input_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? primerNumeroController = TextEditingController();
  TextEditingController? segundoNumeroController = TextEditingController();
  late int primerNumero;
  late int segundoNumero;
  bool validate = false;

  void _validate() {
    setState(() {
      String primerText = primerNumeroController!.text;
      String segundoText = segundoNumeroController!.text;
      validate = primerText != '' && segundoText != '';
      _assignNumbers();
    });
  }

  void _assignNumbers() {
    if (validate) {
      primerNumero = int.parse(primerNumeroController!.text);
      segundoNumero = int.parse(segundoNumeroController!.text);
    }
  }

  int _suma() => primerNumero + segundoNumero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Suma de dos números')),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputText(
              numeroController: primerNumeroController,
              labelText: 'Introduzca el primer número.',
            ),
            const SizedBox(
              height: 30.0,
            ),
            InputText(
              numeroController: segundoNumeroController,
              labelText: 'Introduzca el segundo número.',
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50.0,
                child: const Text(
                  'SUMAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              onPressed: () {
                _validate();
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            validate
                ? Text(
                    'La suma es: ${_suma()}',
                    style: const TextStyle(fontSize: 17.0),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
