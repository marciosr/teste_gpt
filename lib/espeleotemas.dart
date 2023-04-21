import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Espeleotemas extends HiveObject {
  @HiveField(0)
  bool estalagmites;
  @HiveField(1)
  bool estalactites;
  @HiveField(2)
  bool colunasPilar;
  @HiveField(3)
  bool pendentes;
  @HiveField(4)
  bool travertinos;
  @HiveField(5)
  bool microtravertino;
  @HiveField(6)
  bool coraloides;
  @HiveField(7)
  bool blocosAbatidos;
  @HiveField(8)
  bool escorrimentos;
  @HiveField(9)
  bool perolas;

  Espeleotemas({
    required this.estalagmites,
    required this.estalactites,
    required this.colunasPilar,
    required this.pendentes,
    required this.travertinos,
    required this.microtravertino,
    required this.coraloides,
    required this.blocosAbatidos,
    required this.escorrimentos,
    required this.perolas,
  });
}

class EspeleotemasForm extends StatefulWidget {
  const EspeleotemasForm({super.key});

  @override
  _EspeleotemasFormState createState() => _EspeleotemasFormState();
}

class _EspeleotemasFormState extends State<EspeleotemasForm> {
  final _formKey = GlobalKey<FormState>();
  bool _estalagmites = false;
  bool _estalactites = false;
  bool _colunasPilar = false;
  bool _pendentes = false;
  bool _travertinos = false;
  bool _microtravertino = false;
  bool _coraloides = false;
  bool _blocosAbatidos = false;
  bool _escorrimentos = false;
  bool _perolas = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final espeleotemas = Espeleotemas(
        estalagmites: _estalagmites,
        estalactites: _estalactites,
        colunasPilar: _colunasPilar,
        pendentes: _pendentes,
        travertinos: _travertinos,
        microtravertino: _microtravertino,
        coraloides: _coraloides,
        blocosAbatidos: _blocosAbatidos,
        escorrimentos: _escorrimentos,
        perolas: _perolas,
      );

      final box = Hive.box<Espeleotemas>('espeleotemas_box');
      await box.add(espeleotemas);

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
            title: Text('Estalagmites'),
            value: _estalagmites,
            onChanged: (value) {
              setState(() {
                _estalagmites = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Estalactites'),
            value: _estalactites,
            onChanged: (value) {
              setState(() {
                _estalactites = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Colunas/Pilar'),
            value: _colunasPilar,
            onChanged: (value) {
              setState(() {
                _colunasPilar = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Pendentes'),
            value: _pendentes,
            onChanged: (value) {
              setState(() {
                _pendentes = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Travertinos'),
            value: _travertinos,
            onChanged: (value) {
              setState(() {
                _travertinos = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Microtravertino'),
            value: _microtravertino,
            onChanged: (value) {
              setState(() {
                _microtravertino = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Coraloides'),
            value: _coraloides,
            onChanged: (value) {
              setState(() {
                _coraloides = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Blocos abatidos'),
            value: _blocosAbatidos,
            onChanged: (value) {
              setState(() {
                _blocosAbatidos = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Escorrimentos'),
            value: _escorrimentos,
            onChanged: (value) {
              setState(() {
                _escorrimentos = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Pérolas'),
            value: _perolas,
            onChanged: (value) {
              setState(() {
                _perolas = value!;
              });
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
