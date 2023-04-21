import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class VegetacaoUso extends HiveObject {
  @HiveField(0)
  bool cerrado;
  @HiveField(1)
  bool mataSeca;
  @HiveField(2)
  bool mataCiliar;
  @HiveField(3)
  bool pastagem;
  @HiveField(4)
  bool silvicultura;

  VegetacaoUso({
    required this.cerrado,
    required this.mataSeca,
    required this.mataCiliar,
    required this.pastagem,
    required this.silvicultura,
  });
}

class VegetacaoUsoForm extends StatefulWidget {
  const VegetacaoUsoForm({super.key});

  @override
  _VegetacaoUsoFormState createState() => _VegetacaoUsoFormState();
}

class _VegetacaoUsoFormState extends State<VegetacaoUsoForm> {
  final _formKey = GlobalKey<FormState>();
  bool _cerrado = false;
  bool _mataSeca = false;
  bool _mataCiliar = false;
  bool _pastagem = false;
  bool _silvicultura = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final vegetacaoUso = VegetacaoUso(
        cerrado: _cerrado,
        mataSeca: _mataSeca,
        mataCiliar: _mataCiliar,
        pastagem: _pastagem,
        silvicultura: _silvicultura,
      );

      final box = Hive.box<VegetacaoUso>('recursos_hidricos_box');
      await box.add(vegetacaoUso);

      // exibe uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados salvos com sucesso')),
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
            title: const Text('Cerrado'),
            value: _cerrado,
            onChanged: (value) {
              setState(() {
                _cerrado = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Mata Seca'),
            value: _mataSeca,
            onChanged: (value) {
              setState(() {
                _mataSeca = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Mata Ciliar'),
            value: _mataCiliar,
            onChanged: (value) {
              setState(() {
                _mataCiliar = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Pastagem'),
            value: _pastagem,
            onChanged: (value) {
              setState(() {
                _pastagem = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Silvicultura'),
            value: _silvicultura,
            onChanged: (value) {
              setState(() {
                _silvicultura = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
