import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Empreendimento extends HiveObject {
  @HiveField(0)
  String nome;
  @HiveField(1)
  String longitude;
  @HiveField(2)
  String latitude;
  @HiveField(3)
  String municipio;

  Empreendimento({
    required this.nome,
    required this.longitude,
    required this.latitude,
    required this.municipio,
  });
}

class EmpreendimentoForm extends StatefulWidget {
  const EmpreendimentoForm({super.key});

  @override
  _EmpreendimentoFormState createState() => _EmpreendimentoFormState();
}

class _EmpreendimentoFormState extends State<EmpreendimentoForm> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _longitude = '';
  String _latitude = '';
  String _municipio = '';

  final nomeControler = TextEditingController();
  final longitudeControler = TextEditingController();
  final latitudeControler = TextEditingController();
  final municipioControler = TextEditingController();

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final empreendimento = Empreendimento(
        nome: _nome,
        longitude: _longitude,
        latitude: _latitude,
        municipio: _municipio,
      );

      final box = Hive.box<Empreendimento>('recursos_hidricos_box');
      await box.add(empreendimento);

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
              hintText: 'Informe o nome do empreendimento',
              labelText: 'Nome',
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
            controller: nomeControler,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Informe a coordenada da longitude (X)',
              labelText: 'Longitude',
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
            controller: longitudeControler,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Informe a coordenada da latitude (Y)',
              labelText: 'Latitude',
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
            controller: latitudeControler,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Informe o município do empreendimento',
              labelText: 'Município',
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
            controller: municipioControler,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
