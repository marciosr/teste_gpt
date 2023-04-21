import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RecursosHidricos extends HiveObject {
  @HiveField(0)
  bool gotejamento;
  @HiveField(1)
  bool pocasIsoladas;
  @HiveField(2)
  bool nascentes;
  @HiveField(3)
  bool cursosPerenes;
  @HiveField(4)
  bool cursosIntermitentes;
  @HiveField(5)
  bool enxurradas;

  RecursosHidricos({
    required this.gotejamento,
    required this.pocasIsoladas,
    required this.nascentes,
    required this.cursosPerenes,
    required this.cursosIntermitentes,
    required this.enxurradas,
  });
}

class RecursosHidricosForm extends StatefulWidget {
  const RecursosHidricosForm({super.key});

  @override
  _RecursosHidricosFormState createState() => _RecursosHidricosFormState();
}

class _RecursosHidricosFormState extends State<RecursosHidricosForm> {
  final _formKey = GlobalKey<FormState>();
  bool _gotejamento = false;
  bool _pocasIsoladas = false;
  bool _nascentes = false;
  bool _cursosPerenes = false;
  bool _cursosIntermitentes = false;
  bool _enxurradas = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final recursosHidricos = RecursosHidricos(
        gotejamento: _gotejamento,
        pocasIsoladas: _pocasIsoladas,
        nascentes: _nascentes,
        cursosPerenes: _cursosPerenes,
        cursosIntermitentes: _cursosIntermitentes,
        enxurradas: _enxurradas,
      );

      final box = Hive.box<RecursosHidricos>('recursos_hidricos_box');
      await box.add(recursosHidricos);

      // exibe uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados salvos com sucesso')),
      );

      // reinicia o formulário
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            title: const Text('Gotejamento'),
            value: _gotejamento,
            onChanged: (value) {
              setState(() {
                _gotejamento = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Pocas Isoladas'),
            value: _pocasIsoladas,
            onChanged: (value) {
              setState(() {
                _pocasIsoladas = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Nascentes'),
            value: _nascentes,
            onChanged: (value) {
              setState(() {
                _nascentes = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Cursos de Água Perenes'),
            value: _cursosPerenes,
            onChanged: (value) {
              setState(() {
                _cursosPerenes = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Cursos de Água Intermitentes'),
            value: _cursosIntermitentes,
            onChanged: (value) {
              setState(() {
                _cursosIntermitentes = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Enxurradas'),
            value: _enxurradas,
            onChanged: (value) {
              setState(() {
                _enxurradas = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
