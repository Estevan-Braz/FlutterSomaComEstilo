import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Soma de Números'),
        ),
        body: NumberSum(),
      ),
    );
  }
}

class NumberSum extends StatefulWidget {
  @override
  _NumberSumState createState() => _NumberSumState();
}

class _NumberSumState extends State<NumberSum> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';
  void _sumNumbers() {
    if (_formKey.currentState!.validate()) {
      final int num1 = int.parse(_controller1.text);
      final int num2 = int.parse(_controller2.text);
      final int sum = num1 + num2;
      setState(() {
        _result = 'Resultado: $sum';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Soma realizada com sucesso!')),
      );
    }
  }

  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira um número';
    }
    if (int.tryParse(value) == null) {
      return 'Por favor, insira um número válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Calculadora de Soma',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o primeiro número',
                prefixIcon: Icon(Icons.looks_one),
                border: OutlineInputBorder(),
              ),
              validator: _validateNumber,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o segundo número',
                prefixIcon: Icon(Icons.looks_two),
                border: OutlineInputBorder(),
              ),
              validator: _validateNumber,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sumNumbers,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Somar'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
