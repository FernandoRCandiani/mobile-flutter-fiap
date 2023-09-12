import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valorDigitado = TextEditingController();
  String valorDe = 'Dolar';
  String valorPara = 'Dolar';
  double resultado = 0;

  void _exibeValor() {
    setState(() {
      double num = double.parse(valorDigitado.text);
      if (valorDe == 'Dolar' && valorPara == 'Dolar') {
        resultado = num * 1;
      } else if (valorDe == 'Dolar' && valorPara == 'Real') {
        resultado = num * 4.93;
      } else if (valorDe == 'Dolar' && valorPara == 'Euro') {
        resultado = num * 0.93;
      } else if (valorDe == 'Real' && valorPara == 'Real') {
        resultado = num * 1;
      } else if (valorDe == 'Real' && valorPara == 'Dolar') {
        resultado = num * 0.20;
      } else if (valorDe == 'Real' && valorPara == 'Euro') {
        resultado = num * 0.19;
      } else if (valorDe == 'Euro' && valorPara == 'Euro') {
        resultado = num * 1;
      } else if (valorDe == 'Euro' && valorPara == 'Dolar') {
        resultado = num * 1.07;
      } else if (valorDe == 'Euro' && valorPara == 'Real') {
        resultado = num * 5.30;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Conversor de Moedas"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _subTitulo(),
            _campo('Valor: ', valorDigitado),
            _dropdownDe('De: '),
            _dropdownPara('Para: '),
            _button(),
            _texto(resultado),
          ],
        ),
      ),
    );
  }

  _subTitulo() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        'Dólar, Real e Euro',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    );
  }

  _campo(String titulo, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.amberAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.amberAccent, fontSize: 25.0),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  _texto(valor) {
    return Text(
      valor.toString(),
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _dropdownDe(String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texto,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        DropdownButton(
          value: valorDe,
          items: ['Dolar', 'Real', 'Euro'].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              valorDe = valorSelecionado!;
            });
          },
        ),
      ],
    );
  }

  _dropdownPara(String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texto,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        DropdownButton(
          value: valorPara,
          items: ['Dolar', 'Real', 'Euro'].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              valorPara = valorSelecionado!;
            });
          },
        ),
      ],
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
          "Converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
