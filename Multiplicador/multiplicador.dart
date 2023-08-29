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
  TextEditingController valorUm = TextEditingController();
  TextEditingController valorDois = TextEditingController();

  double exibicaoValor = 0;

  void _exibeValor() {
    setState(() {
      double multilicacao =
          double.parse(valorUm.text) * double.parse(valorDois.text);

      exibicaoValor = multilicacao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Multiplicador"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(50),
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _campo("Digite o primeiro Nº", valorUm),
          _campo("Digite o secundo Nº", valorDois),
          _button(),
          _texto(),
        ],
      ),
    );
  }

  _campo(String titulo, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: titulo, labelStyle: TextStyle(color: Colors.amberAccent)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.amberAccent, fontSize: 25.0),
      controller: controller,
    );
  }

  _texto() {
    return Text(
      exibicaoValor.toString(),
      style: TextStyle(fontSize: 25),
    );
  }

  _button() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
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
