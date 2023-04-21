import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum Classificacao {
  caverna,
  abrigo,
  reentrancia,
  abismo,
}

class ClassificacaoForm extends StatefulWidget {
  const ClassificacaoForm({super.key});

  @override
  _classificacaoFormState createState() => _classificacaoFormState();
}

class _classificacaoFormState extends State<ClassificacaoForm> {
  final _formKey = GlobalKey<FormState>();

  Classificacao? _classificacaoSelecionada = Classificacao.caverna;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Caverna'),
            leading: Radio<Classificacao>(
              value: Classificacao.caverna,
              groupValue: _classificacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _classificacaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Abrigo'),
            leading: Radio<Classificacao>(
              value: Classificacao.abrigo,
              groupValue: _classificacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _classificacaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Reentrância'),
            leading: Radio<Classificacao>(
              value: Classificacao.reentrancia,
              groupValue: _classificacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _classificacaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Abismo'),
            leading: Radio<Classificacao>(
              value: Classificacao.abismo,
              groupValue: _classificacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _classificacaoSelecionada = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
