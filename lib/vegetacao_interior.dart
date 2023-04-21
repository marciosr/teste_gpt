import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum VegetacaoInterior {
  ausente,
  pontual,
  generalizada,
}

class VegetacaoInteriorForm extends StatefulWidget {
  const VegetacaoInteriorForm({super.key});

  @override
  _VegetacaoInteriorFormState createState() => _VegetacaoInteriorFormState();
}

class _VegetacaoInteriorFormState extends State<VegetacaoInteriorForm> {
  final _formKey = GlobalKey<FormState>();

  VegetacaoInterior? _vegetacaoInteriorSelecionada = VegetacaoInterior.ausente;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Ausente'),
            leading: Radio<VegetacaoInterior>(
              value: VegetacaoInterior.ausente,
              groupValue: _vegetacaoInteriorSelecionada,
              onChanged: (value) {
                setState(() {
                  _vegetacaoInteriorSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Pontual'),
            leading: Radio<VegetacaoInterior>(
              value: VegetacaoInterior.pontual,
              groupValue: _vegetacaoInteriorSelecionada,
              onChanged: (value) {
                setState(() {
                  _vegetacaoInteriorSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Generalizada'),
            leading: Radio<VegetacaoInterior>(
              value: VegetacaoInterior.generalizada,
              groupValue: _vegetacaoInteriorSelecionada,
              onChanged: (value) {
                setState(() {
                  _vegetacaoInteriorSelecionada = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
