import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Genese extends HiveObject {
  @HiveField(0)
  bool dissolucao;
  @HiveField(1)
  bool fraturamento;
  @HiveField(2)
  bool desabamento;

  Genese({
    required this.dissolucao,
    required this.fraturamento,
    required this.desabamento,
  });
}

class GeneseForm extends StatefulWidget {
  const GeneseForm({super.key});

  @override
  _GeneseFormState createState() => _GeneseFormState();
}

class _GeneseFormState extends State<GeneseForm> {
  final _formKey = GlobalKey<FormState>();
  bool _dissolucao = false;
  bool _fraturamento = false;
  bool _desabamento = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final genese = Genese(
        dissolucao: _dissolucao,
        fraturamento: _fraturamento,
        desabamento: _desabamento,
      );

      final box = Hive.box<Genese>('genese_box');
      await box.add(genese);

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
            title: const Text('Dissolução'),
            value: _dissolucao,
            onChanged: (value) {
              setState(() {
                _dissolucao = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Fraturamento'),
            value: _fraturamento,
            onChanged: (value) {
              setState(() {
                _fraturamento = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Desabamento'),
            value: _desabamento,
            onChanged: (value) {
              setState(() {
                _desabamento = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
