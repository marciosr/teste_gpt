import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Solo extends HiveObject {
  @HiveField(0)
  String solo;

  Solo({
    required this.solo,
  });
}

class SoloForm extends StatefulWidget {
  const SoloForm({super.key});

  @override
  _SoloFormState createState() => _SoloFormState();
}

class _SoloFormState extends State<SoloForm> {
  final _formKey = GlobalKey<FormState>();
  String _solo = '';
  final soloControler = TextEditingController();

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final solo = Solo(
        solo: _solo,
      );

      final box = Hive.box<Solo>('recursos_hidricos_box');
      await box.add(solo);

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
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Iforme outro tipo de feição',
              labelText: 'Outras feições',
            ),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
            controller: soloControler,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
