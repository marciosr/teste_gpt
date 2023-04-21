import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum Morfologia {
  depressao,
  planicie,
  chapada,
  tabuleiro,
  escarpa,
  serra,
  morro,
  colina,
  terraco,
}

class MorfologiaForm extends StatefulWidget {
  const MorfologiaForm({super.key});

  @override
  _MorfologiaFormState createState() => _MorfologiaFormState();
}

class _MorfologiaFormState extends State<MorfologiaForm> {
  final _formKey = GlobalKey<FormState>();

  Morfologia? _morfologiaSelecionada = Morfologia.depressao;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Depressão'),
            leading: Radio<Morfologia>(
              value: Morfologia.depressao,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Planície'),
            leading: Radio<Morfologia>(
              value: Morfologia.planicie,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Chapada'),
            leading: Radio<Morfologia>(
              value: Morfologia.chapada,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Tabuleiro'),
            leading: Radio<Morfologia>(
              value: Morfologia.tabuleiro,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Escarpa'),
            leading: Radio<Morfologia>(
              value: Morfologia.escarpa,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Serra'),
            leading: Radio<Morfologia>(
              value: Morfologia.serra,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Morro'),
            leading: Radio<Morfologia>(
              value: Morfologia.morro,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Colina'),
            leading: Radio<Morfologia>(
              value: Morfologia.colina,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Terraço'),
            leading: Radio<Morfologia>(
              value: Morfologia.terraco,
              groupValue: _morfologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _morfologiaSelecionada = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
