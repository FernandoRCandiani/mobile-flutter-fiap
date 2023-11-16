import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  TextEditingController user = TextEditingController();
  String info_endereco = '';
  String fotoMostrar = '';

  _recuperarCep() async {
    String url = 'https://api.github.com/users/${user.text}';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);

    String foto = retorno["avatar_url"];
    int id = retorno["id"];
    String nome = retorno["name"];
    int repositorios = retorno["public_repos"];
    String criado = retorno["created_at"];
    int seguidores = retorno["followers"];
    int seguindo = retorno["following"];

    setState(() {
      fotoMostrar = foto;
      info_endereco =
          'Id: $id \nNome: $nome \nRepositorios: $repositorios \nCriado: $criado \nSeguidores: $seguidores \nSeguindo $seguindo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Perfil DEV")),
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
                    controller: user,
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
              child: Column(
                children: [
                  fotoMostrar != ''
                      ? SizedBox(
                          height: 250,
                          child: Image.network(fotoMostrar),
                        )
                      : Container(),
                  Text(
                    info_endereco,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
