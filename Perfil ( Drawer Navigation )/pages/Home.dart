import 'dart:html';

import 'package:flutter/material.dart';
import 'package:helloworld/pages/Experiencia.dart';
import 'Pessoal.dart';
import 'Formacao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _currentPage = 0;

  final telas = [
    Pessoal(),
    Formacao(),
    Experiencia(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Meu perfil'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Fernando R Candiani'),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/79520984?v=4'),
              ),
            ),
            ListTile(
              title: Text('Pessoal'),
              subtitle: Text('Informações pessoais'),
              trailing: Icon(Icons.person),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                  _scaffoldKey.currentState?.closeDrawer();
                });
              },
            ),
            ListTile(
              title: Text('Formação'),
              subtitle: Text('Informações de formação'),
              trailing: Icon(Icons.school),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                  _scaffoldKey.currentState?.closeDrawer();
                });
              },
            ),
            ListTile(
              title: Text('Experiência'),
              subtitle: Text('Experiência de trabalho'),
              trailing: Icon(Icons.work),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                  _scaffoldKey.currentState?.closeDrawer();
                });
              },
            ),
          ],
        )),
      ),
    );
  }
}
