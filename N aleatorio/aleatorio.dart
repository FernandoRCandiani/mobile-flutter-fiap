import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String valor = '?';

  _exibeValor() {
    int numero = Random().nextInt(10);

    setState(() {
      valor = numero.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Jogo do Nº Aleatório"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _imagem(),
            _resultado(),
            _button(),
          ],
        ),
      ),
    );
  }

  _imagem() {
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.network(
          'https://static.vecteezy.com/system/resources/previews/020/575/874/original/3d-icon-illustration-floating-dice-png.png'),
    );
  }

  _resultado() {
    return Column(
      children: [
        Text(
          "Pense em um valor Nº de 0 a 10",
          style: TextStyle(
            fontSize: 18,
            color: Colors.red,
          ),
        ),
        Text(
          valor,
          style: TextStyle(
            fontSize: 40,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  _button() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amberAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: _exibeValor,
        child: Text(
          "Descobrir",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
