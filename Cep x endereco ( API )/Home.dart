import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String info_endereco = '';

  _recuperarCep() async {
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';

    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String cep = retorno["cep"];
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      info_endereco =
          'Cep: $cep \nLogradouro: $logradouro \nBairro: $bairro \nCidade: $localidade \nEstado: $uf';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CEP X Endereço")),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Digite o CEP",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    controller: cepController,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.check),
                  color: Colors.green,
                  onPressed: _recuperarCep,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(info_endereco),
            ),
          ],
        ),
      ),
    );
  }
}
