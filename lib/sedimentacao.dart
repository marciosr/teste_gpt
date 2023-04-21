import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum Sedimentacao {
  quimica,
  clasticaAutoctone,
  clasticaAloctone,
}

class SedimentacaoForm extends StatefulWidget {
  const SedimentacaoForm({super.key});

  @override
  _SedimentacaoFormState createState() => _SedimentacaoFormState();
}

class _SedimentacaoFormState extends State<SedimentacaoForm> {
  final _formKey = GlobalKey<FormState>();

  Sedimentacao? _sedimentacaoSelecionada = Sedimentacao.quimica;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Química'),
            leading: Radio<Sedimentacao>(
              value: Sedimentacao.quimica,
              groupValue: _sedimentacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _sedimentacaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Clástica Autóctone'),
            leading: Radio<Sedimentacao>(
              value: Sedimentacao.clasticaAutoctone,
              groupValue: _sedimentacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _sedimentacaoSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Clástica Alóctone'),
            leading: Radio<Sedimentacao>(
              value: Sedimentacao.clasticaAloctone,
              groupValue: _sedimentacaoSelecionada,
              onChanged: (value) {
                setState(() {
                  _sedimentacaoSelecionada = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
