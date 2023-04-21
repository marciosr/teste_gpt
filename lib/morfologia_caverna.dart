import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MorfologiaCaverna extends HiveObject {
  @HiveField(0)
  bool dendritica;
  @HiveField(1)
  bool reticulada;
  @HiveField(2)
  bool anastomotica;
  @HiveField(3)
  bool ramiformeEspongiforme;
  @HiveField(4)
  bool indefinida;

  MorfologiaCaverna({
    required this.dendritica,
    required this.reticulada,
    required this.anastomotica,
    required this.ramiformeEspongiforme,
    required this.indefinida,
  });
}

class MorfologiaCavernaForm extends StatefulWidget {
  const MorfologiaCavernaForm({super.key});

  @override
  _MorfologiaCavernaFormState createState() => _MorfologiaCavernaFormState();
}

class _MorfologiaCavernaFormState extends State<MorfologiaCavernaForm> {
  final _formKey = GlobalKey<FormState>();
  bool _dendritica = false;
  bool _reticulada = false;
  bool _anastomotica = false;
  bool _ramiformeEspongiforme = false;
  bool _indefinida = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final morfologiaCaverna = MorfologiaCaverna(
        dendritica: _dendritica,
        reticulada: _reticulada,
        anastomotica: _anastomotica,
        ramiformeEspongiforme: _ramiformeEspongiforme,
        indefinida: _indefinida,
      );

      final box = Hive.box<MorfologiaCaverna>('morfologia_box');
      await box.add(morfologiaCaverna);

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
            title: const Text('Dendritica'),
            value: _dendritica,
            onChanged: (value) {
              setState(() {
                _dendritica = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Reticulada'),
            value: _reticulada,
            onChanged: (value) {
              setState(() {
                _reticulada = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Anastomótica'),
            value: _anastomotica,
            onChanged: (value) {
              setState(() {
                _anastomotica = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Ramiforme e Espongiforme'),
            value: _ramiformeEspongiforme,
            onChanged: (value) {
              setState(() {
                _ramiformeEspongiforme = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Indefinida'),
            value: _indefinida,
            onChanged: (value) {
              setState(() {
                _indefinida = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
