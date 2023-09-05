import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Anúncios"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: _corpo(),
    );
  }

  _corpo() {
    return PageView(
      children: [
        _imagem('assets/img/gojo.jpg', 'Nome: Gojo', 'Anime: Jujutsu Kaisen',
            'Estudio: MAPPA'),
        _imagem('assets/img/naoLembro.jpg', 'Nome: Taiga Aisaka',
            'Anime: Toradora', 'Estudio: J.C.Staff'),
        _imagem('assets/img/naruto.jpg', 'Nome: Naruto', 'Anime: Naruto',
            'Estudio: Pierrot'),
        _imagem('assets/img/saitama.jpg', 'Nome: Saitama', 'Anime: One Punch',
            'Estudio: MAPPA'),
        _imagem('assets/img/yourName.jpg', 'Nome: Gojo', 'Anime: Your Name',
            'Estudio: CoMix Wave'),
      ],
    );
  }

  _imagem(String img, String nome, String anime, String estudio) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(16),
      color: Colors.grey[900],
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.asset(
            img,
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Column(
            children: [
              _texto(nome),
              _texto(anime),
              _texto(estudio),
            ],
          )
        ],
      ),
    );
  }

  _texto(String texto) {
    return Center(
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 25,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
