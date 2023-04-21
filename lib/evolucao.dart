import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum Evolucao {
  paragenese,
  singenese,
}

class EvolucaoForm extends StatefulWidget {
  const EvolucaoForm({super.key});

  @override
  _EvolucaoFormState createState() => _EvolucaoFormState();
}

class _EvolucaoFormState extends State<EvolucaoForm> {
  final _formKey = GlobalKey<FormState>();

  Evolucao? _evolucaoSelecionada = Evolucao.paragenese;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Paragênese'),
            leading: Radio<Evolucao>(
              value: Evolucao.paragenese,
              groupValue: _evolucaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _evolucaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Singênese'),
            leading: Radio<Evolucao>(
              value: Evolucao.singenese,
              groupValue: _evolucaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _evolucaoSelecionada = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
