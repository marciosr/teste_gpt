import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum Localizacao {
  baseDoMacico,
  meiaEncosta,
  topoDoMacico,
}

class LocalizacaoForm extends StatefulWidget {
  const LocalizacaoForm({super.key});

  @override
  _LocalizacaoFormState createState() => _LocalizacaoFormState();
}

class _LocalizacaoFormState extends State<LocalizacaoForm> {
  final _formKey = GlobalKey<FormState>();

  Localizacao? _localizacaoSelecionada = Localizacao.baseDoMacico;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Base do Maciço'),
            leading: Radio<Localizacao>(
              value: Localizacao.baseDoMacico,
              groupValue: _localizacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _localizacaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Meia Encosta'),
            leading: Radio<Localizacao>(
              value: Localizacao.meiaEncosta,
              groupValue: _localizacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _localizacaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Topo do Maciço'),
            leading: Radio<Localizacao>(
              value: Localizacao.topoDoMacico,
              groupValue: _localizacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _localizacaoSelecionada = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
