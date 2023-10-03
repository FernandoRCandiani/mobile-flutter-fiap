import 'package:flutter/material.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Experiência',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.green,
            ),
          ),
          Column(
            children: [
              _info('Atual: ', 'Dev Flutter - 10 meses'),
              _info('2º: ', 'Prensista - 1 ano'),
              _info('1º: ', 'Feirante - 11 anos'),
            ],
          ),
        ],
      ),
    );
  }

  _info(titulo, info) {
    return Row(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.green,
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
