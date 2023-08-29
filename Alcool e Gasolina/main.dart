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
  TextEditingController valorAlcool = TextEditingController();
  TextEditingController valorGasolina = TextEditingController();

  String mostrarResultado = 'Resultado: ';

  void _exibeValor() {
    setState(() {
      double valor =
          double.parse(valorAlcool.text) / double.parse(valorGasolina.text);

      if (valor > 0.7) {
        mostrarResultado = 'Gasolina é melhor';
      } else {
        mostrarResultado = 'Alcool é melhor';
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
          title: Text("Alcool ou Gasolina"),
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
          _campo("Preço do Alcool"),
          _campo("Preço da Gasolina"),
          _button(),
          _texto(),
        ],
      ),
    );
  }

  _imagem() {
    return SizedBox(
      width: 200,
      height: 200,
      child:
          Image.network('https://m.media-amazon.com/images/I/61lcaZUfH9L.png'),
    );
  }

  _campo(campo) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: campo,
              labelStyle: TextStyle(color: Colors.amberAccent)),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.amberAccent, fontSize: 25.0),
          controller: campo == "Preço do Alcool" ? valorAlcool : valorGasolina,
        ),
      ],
    );
  }

  _texto() {
    return Text(
      mostrarResultado,
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
          "Calcular",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
