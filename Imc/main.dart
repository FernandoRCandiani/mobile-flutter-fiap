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
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  String mostrarResultado = '';

  void _exibeValor() {
    setState(() {
      double pesoValor = double.parse(peso.text);
      double alturaValor = double.parse(altura.text);

      double valor = pesoValor / (alturaValor * alturaValor);

      if (valor < 18.5) {
        mostrarResultado = 'Abaixo do peso';
      } else if (valor < 24.9) {
        mostrarResultado = 'Peso Normal';
      } else if (valor < 29.9) {
        mostrarResultado = 'Sobrepeso';
      } else if (valor < 34.9) {
        mostrarResultado = 'Obsidade Grau I';
      } else if (valor < 39.9) {
        mostrarResultado = 'Obsidade Grau II';
      } else {
        mostrarResultado = 'Obsidade Grau III ou Mórbida';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cálculo do IMC"),
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
          _campo("Peso", peso),
          _campo("Altura", altura),
          _button(),
          _texto(),
        ],
      ),
    );
  }

  _imagem() {
    return SizedBox(
      width: 150,
      height: 150,
      child: Image.network(
        'https://lh3.googleusercontent.com/y5G9NIkLEBWfo-AYA00eH7DPtJGcvKqhi36pjpik0Y1oRYiwXXLyUHvvoMidPNL7JRU0',
      ),
    );
  }

  _campo(String titulo, TextEditingController controller) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: titulo,
              labelStyle: TextStyle(color: Colors.amberAccent)),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.amberAccent, fontSize: 25.0),
          controller: controller,
        ),
      ],
    );
  }

  _texto() {
    return Text(
      'Resultado: $mostrarResultado',
      style: TextStyle(fontSize: 25),
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
          "Verificar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
