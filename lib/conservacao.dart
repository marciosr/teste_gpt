import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Conservacao extends HiveObject {
  @HiveField(0)
  bool bom;
  @HiveField(1)
  bool poucoAlterado;
  @HiveField(2)
  bool degradado;

  Conservacao({
    required this.bom,
    required this.poucoAlterado,
    required this.degradado,
  });
}

class ConservacaoForm extends StatefulWidget {
  const ConservacaoForm({super.key});

  @override
  _ConservacaoFormState createState() => _ConservacaoFormState();
}

class _ConservacaoFormState extends State<ConservacaoForm> {
  final _formKey = GlobalKey<FormState>();
  bool _bom = false;
  bool _poucoAlterado = false;
  bool _degradado = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final conservacao = Conservacao(
        bom: _bom,
        poucoAlterado: _poucoAlterado,
        degradado: _degradado,
      );

      final box = Hive.box<Conservacao>('conservacao_box');
      await box.add(conservacao);

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
            title: const Text('Bom'),
            value: _bom,
            onChanged: (value) {
              setState(() {
                _bom = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Pouco Alterado'),
            value: _poucoAlterado,
            onChanged: (value) {
              setState(() {
                _poucoAlterado = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Degradado'),
            value: _degradado,
            onChanged: (value) {
              setState(() {
                _degradado = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
