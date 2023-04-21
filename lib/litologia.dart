import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/*class Litologia extends HiveObject {
  @HiveField(0)
  bool calcario;
  @HiveField(1)
  bool itabirito;
  @HiveField(2)
  bool canga;
  @HiveField(3)
  bool quartizito;
  @HiveField(4)
  bool gnaisse;
  @HiveField(5)
  bool metassiltito;
  @HiveField(6)
  bool filito;
  @HiveField(7)
  bool diamictito;
  @HiveField(8)
  bool arenito;
  @HiveField(9)
  bool siltito;

  Litologia({
    required this.calcario,
    required this.itabirito,
    required this.canga,
    required this.quartizito,
    required this.gnaisse,
    required this.metassiltito,
    required this.filito,
    required this.diamictito,
    required this.arenito,
    required this.siltito,
  });
}*/

enum Litologia {
  calcario,
  itabirito,
  canga,
  quartizito,
  gnaisse,
  metassiltito,
  filito,
  diamictito,
  arenito,
  siltito,
}

class LitologiaForm extends StatefulWidget {
  const LitologiaForm({super.key});

  @override
  _LitologiaFormState createState() => _LitologiaFormState();
}

class _LitologiaFormState extends State<LitologiaForm> {
  final _formKey = GlobalKey<FormState>();

  Litologia? _litologiaSelecionada = Litologia.calcario;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Calcário'),
            leading: Radio<Litologia>(
              value: Litologia.calcario,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Itabirito'),
            leading: Radio<Litologia>(
              value: Litologia.itabirito,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Canga'),
            leading: Radio<Litologia>(
              value: Litologia.canga,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Quartzito'),
            leading: Radio<Litologia>(
              value: Litologia.quartizito,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Gnaisse'),
            leading: Radio<Litologia>(
              value: Litologia.gnaisse,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Metassiltito'),
            leading: Radio<Litologia>(
              value: Litologia.metassiltito,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Filito'),
            leading: Radio<Litologia>(
              value: Litologia.filito,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Diamictito'),
            leading: Radio<Litologia>(
              value: Litologia.diamictito,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Arenito'),
            leading: Radio<Litologia>(
              value: Litologia.arenito,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Siltito'),
            leading: Radio<Litologia>(
              value: Litologia.siltito,
              groupValue: _litologiaSelecionada,
              onChanged: (value) {
                setState(() {
                  _litologiaSelecionada = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
