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
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  String sexo = 'Masculino';
  String escolaridade = 'Ensino Fundamental';
  double limite = 100;
  bool nacionalidade = false;
  bool resultado = false;

  void _exibeValor() {
    setState(() {
      resultado = true;
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
      title: Text("Abertura de Conta",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
      backgroundColor: Colors.amber,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _campo('Nome: ', nome),
            _campo('Idade: ', idade),
            _dropdownSexo('Sexo: '),
            _dropdownEscolaridade('Escolaridade: '),
            _slider("Limite: "),
            _switch("Brasileiro: "),
            _button(),
            resultado
                ? Column(
                    children: [
                      _texto("Nome: ", nome.text),
                      _texto("Idade: ", idade.text),
                      _texto("Sexo: ", sexo),
                      _texto("Escolaridade: ", escolaridade),
                      _texto("Limite: ", limite),
                      _texto("Brasileiro: ", nacionalidade ? 'Sim' : 'Não'),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  _campo(String titulo, TextEditingController controller) {
    return Row(
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
              labelStyle: TextStyle(color: Colors.black),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 25.0),
            controller: controller,
          ),
        ),
      ],
    );
  }

  _texto(titulo, valor) {
    return Row(
      children: [
        Text(
          titulo,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          valor.toString(),
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _dropdownSexo(String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          texto,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        DropdownButton(
          value: sexo,
          items: ['Masculino', 'Feminino', 'Outro'].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              resultado = false;
              sexo = valorSelecionado!;
            });
          },
        ),
      ],
    );
  }

  _dropdownEscolaridade(String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          texto,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        DropdownButton(
          value: escolaridade,
          items: [
            'Ensino Fundamental',
            'Ensino Médio',
            'Superior Incompleto',
            'Superior Completo',
            'Mestrado',
            'Doutorado'
          ].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? valorSelecionado) {
            setState(() {
              resultado = false;
              escolaridade = valorSelecionado!;
            });
          },
        ),
      ],
    );
  }

  _slider(titulo) {
    return Row(
      children: [
        Text(
          titulo,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        Slider(
          value: limite,
          min: 0,
          max: 100,
          divisions: 100,
          label: (limite > 70) ? 'Muito alto' : limite.round().toString(),
          onChanged: (double value) {
            setState(() {
              resultado = false;
              limite = value;
            });
          },
        ),
      ],
    );
  }

  _switch(titulo) {
    return Row(
      children: [
        Text(
          titulo,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        Switch(
          value: nacionalidade,
          onChanged: (value) {
            setState(() {
              resultado = false;
              nacionalidade = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.blue,
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
          "Confirmar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
