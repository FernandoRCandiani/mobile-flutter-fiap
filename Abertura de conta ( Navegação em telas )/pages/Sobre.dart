import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  String? nome = '';
  String? idade = '';
  String? sexo = '';
  String? escolaridade = '';
  double? limite = 0;
  bool? nacionalidade = true;

  Sobre({
    Key? key,
    this.nome,
    this.idade,
    this.sexo,
    this.escolaridade,
    this.limite,
    this.nacionalidade,
  }) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Column(
        children: [
          _texto("Nome: ", widget.nome),
          _texto("Idade: ", widget.idade),
          _texto("Sexo: ", widget.sexo),
          _texto("Escolaridade: ", widget.escolaridade),
          _texto("Limite: ", widget.limite),
          _texto("Brasileiro: ", widget.nacionalidade! ? 'Sim' : 'Não'),
        ],
      ),
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
}
