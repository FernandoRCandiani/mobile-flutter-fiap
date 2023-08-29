import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int valor = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contador de Pessoas"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Text(
                "$valor",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                ),
              ),
            ),
            Column(
              children: [
                _button("+"),
                _button("-"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _button(valor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: valor == "+" ? Colors.green : Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: valor == "+" ? onSoma : onSubtracao,
        child: Icon(
          valor == "+" ? Icons.add : Icons.remove,
          size: 50,
        ),
      ),
    );
  }

  onSoma() {
    setState(() {
      valor++;
    });
  }

  onSubtracao() {
    if (valor > 0) {
      setState(() {
        valor--;
      });
    }
  }
}
