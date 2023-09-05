import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Vagas"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      child: _corpo(),
    );
  }

  _corpo() {
    return ListView(
      children: [
        _card(
          'Dev Backend',
          'Salario: 3000.00',
          'Desc: Java, C#',
          'Fone: 91234-8524',
        ),
        SizedBox(height: 10),
        _card(
          'Eng de Dados',
          'Salario: 4000.00',
          'Desc: Cursando',
          'Contato: 9234-1234',
        ),
        SizedBox(height: 10),
        _card(
          'Dev Flutter',
          'Salario: 3000.00',
          'Desc: Dart, Flutter',
          'Contato: 91234-1234',
        ),
        SizedBox(height: 10),
        _card(
          'Dev Fontend',
          'Salario: 2500.00',
          'Desc: HTML, CSS, JavaScript',
          'Fone: 91234-4321',
        ),
        SizedBox(height: 10),
      ],
    );
  }

  _card(String titulo, String nome, String anime, String estudio) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titulo,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _texto(nome),
                _texto(anime),
                _texto(estudio),
              ],
            ),
          )
        ],
      ),
    );
  }

  _texto(String texto) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: 16,
        color: Colors.orange,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
