import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerbase = TextEditingController();
  TextEditingController _controlleraltura = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? base = double.tryParse(_controllerbase.text);
    double? altura = double.tryParse(_controlleraltura.text);

    if (base == null || altura == null) {
      setState(() {
        _textoResultado =
            'Número inválido, digite números maiores que 0 e utilizando (.)';
      });
    } else {
      double area = base * altura;
      setState(() {
        _textoResultado = 'A área do retângulo é $area';
      });
    }
  }

  void _limpaCampos() {
    _controllerbase.clear();
    _controlleraltura.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo da Área do Retângulo"),
        backgroundColor: Color.fromARGB(255, 0, 182, 136),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image(
                    image: AssetImage("imagens/imagem.png"),
                    width: 200,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Calcule a área de um retângulo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "base"),
                style: TextStyle(fontSize: 25),
                controller: _controllerbase,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "altura"),
                style: TextStyle(fontSize: 25),
                controller: _controlleraltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color.fromARGB(255, 92, 27, 1),
                    textStyle: TextStyle(fontSize: 25),
                  ),
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}
