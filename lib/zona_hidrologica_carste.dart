import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ZonaHidrologicaCarste extends HiveObject {
  @HiveField(0)
  bool zonaVadosa;
  @HiveField(1)
  bool zonaDeOscilacao;
  @HiveField(2)
  bool zonaFreatica;

  ZonaHidrologicaCarste({
    required this.zonaVadosa,
    required this.zonaDeOscilacao,
    required this.zonaFreatica,
  });
}

class ZonaHidrologicaCarsteForm extends StatefulWidget {
  const ZonaHidrologicaCarsteForm({super.key});

  @override
  _ZonaHidrologicaCarsteFormState createState() =>
      _ZonaHidrologicaCarsteFormState();
}

class _ZonaHidrologicaCarsteFormState extends State<ZonaHidrologicaCarsteForm> {
  final _formKey = GlobalKey<FormState>();
  bool _zonaVadosa = false;
  bool _zonaDeOscilacao = false;
  bool _zonaFreatica = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final zonaHidrologicaCarste = ZonaHidrologicaCarste(
        zonaVadosa: _zonaVadosa,
        zonaDeOscilacao: _zonaDeOscilacao,
        zonaFreatica: _zonaFreatica,
      );

      final box = Hive.box<ZonaHidrologicaCarste>('recursos_hidricos_box');
      await box.add(zonaHidrologicaCarste);

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
            title: const Text('Zona Vadosa'),
            value: _zonaVadosa,
            onChanged: (value) {
              setState(() {
                _zonaVadosa = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Zona de Oscilação'),
            value: _zonaDeOscilacao,
            onChanged: (value) {
              setState(() {
                _zonaDeOscilacao = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Zona Freática'),
            value: _zonaFreatica,
            onChanged: (value) {
              setState(() {
                _zonaFreatica = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
