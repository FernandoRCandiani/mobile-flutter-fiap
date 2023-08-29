import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu Perfil"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _imagem(),
          _info('Dados pessoais', 'Fernando Rodrigues Candiani'),
          _info('Formação', 'SI - FIAP'),
          _info('Experiência', 'Síntese Soluções - 8 meses'),
          _info('Projetos', 'https://github.com/FernandoRCandiani'),
        ],
      ),
    );
  }

  _imagem() {
    return SizedBox(
      child:
          Image.network('https://avatars.githubusercontent.com/u/79520984?v=4'),
    );
  }

  _info(String titulo, String info) {
    return Column(
      children: [
        Text(
          titulo,
          style: TextStyle(fontSize: 25, color: Colors.red),
        ),
        Text(
          info,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
