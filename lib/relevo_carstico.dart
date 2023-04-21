import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RelevoCarstico extends HiveObject {
  @HiveField(0)
  bool drenagemSubterranea;
  @HiveField(1)
  bool drenagemAusente;
  @HiveField(2)
  bool dissolucao;

  RelevoCarstico({
    required this.drenagemSubterranea,
    required this.drenagemAusente,
    required this.dissolucao,
  });
}

class RelevoCarsticoForm extends StatefulWidget {
  const RelevoCarsticoForm({super.key});

  @override
  _RelevoCarsticoFormState createState() => _RelevoCarsticoFormState();
}

class _RelevoCarsticoFormState extends State<RelevoCarsticoForm> {
  final _formKey = GlobalKey<FormState>();
  bool _drenagemSubterranea = false;
  bool _drenagemAusente = false;
  bool _dissolucao = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final relevoCarstico = RelevoCarstico(
        drenagemSubterranea: _drenagemSubterranea,
        drenagemAusente: _drenagemAusente,
        dissolucao: _dissolucao,
      );

      final box = Hive.box<RelevoCarstico>('recursos_hidricos_box');
      await box.add(relevoCarstico);

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
            title: const Text('Drenagem Subterrânea'),
            value: _drenagemSubterranea,
            onChanged: (value) {
              setState(() {
                _drenagemSubterranea = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Drenagem Ausente'),
            value: _drenagemAusente,
            onChanged: (value) {
              setState(() {
                _drenagemAusente = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Dissolução'),
            value: _dissolucao,
            onChanged: (value) {
              setState(() {
                _dissolucao = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
