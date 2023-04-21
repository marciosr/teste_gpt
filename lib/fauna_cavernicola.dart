import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FaunaCavernicola extends HiveObject {
  @HiveField(0)
  bool morcego;
  @HiveField(1)
  bool mosquito;
  @HiveField(2)
  bool abelha;
  @HiveField(3)
  bool marimbondo;
  @HiveField(4)
  bool coruja;
  @HiveField(5)
  bool moco;
  @HiveField(6)
  bool grilo;
  @HiveField(7)
  bool aranha;
  @HiveField(8)
  bool cobra;
  @HiveField(9)
  bool mariposa;
  @HiveField(10)
  bool ratos;

  FaunaCavernicola({
    required this.morcego,
    required this.mosquito,
    required this.abelha,
    required this.marimbondo,
    required this.coruja,
    required this.moco,
    required this.grilo,
    required this.aranha,
    required this.cobra,
    required this.mariposa,
    required this.ratos,
  });
}

class FaunaCavernicolaForm extends StatefulWidget {
  const FaunaCavernicolaForm({super.key});

  @override
  _FaunaCavernicolaFormState createState() => _FaunaCavernicolaFormState();
}

class _FaunaCavernicolaFormState extends State<FaunaCavernicolaForm> {
  final _formKey = GlobalKey<FormState>();
  bool _morcego = false;
  bool _mosquito = false;
  bool _abelha = false;
  bool _marimbondo = false;
  bool _coruja = false;
  bool _moco = false;
  bool _grilo = false;
  bool _aranha = false;
  bool _cobra = false;
  bool _mariposa = false;
  bool _ratos = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final faunaCavernicola = FaunaCavernicola(
        morcego: _morcego,
        mosquito: _mosquito,
        abelha: _abelha,
        marimbondo: _marimbondo,
        coruja: _coruja,
        moco: _moco,
        grilo: _grilo,
        aranha: _aranha,
        cobra: _cobra,
        mariposa: _mariposa,
        ratos: _ratos,
      );

      final box = Hive.box<FaunaCavernicola>('fauna_cavernicola_box');
      await box.add(faunaCavernicola);

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
            title: const Text('Morcego'),
            value: _morcego,
            onChanged: (value) {
              setState(() {
                _morcego = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Mosquito'),
            value: _mosquito,
            onChanged: (value) {
              setState(() {
                _mosquito = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Abelha'),
            value: _abelha,
            onChanged: (value) {
              setState(() {
                _abelha = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Marimbondo'),
            value: _marimbondo,
            onChanged: (value) {
              setState(() {
                _marimbondo = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Coruja'),
            value: _coruja,
            onChanged: (value) {
              setState(() {
                _coruja = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Mocó'),
            value: _moco,
            onChanged: (value) {
              setState(() {
                _moco = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Grilo'),
            value: _aranha,
            onChanged: (value) {
              setState(() {
                _aranha = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Cobra'),
            value: _cobra,
            onChanged: (value) {
              setState(() {
                _cobra = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Mariposa'),
            value: _mariposa,
            onChanged: (value) {
              setState(() {
                _mariposa = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Ratos'),
            value: _ratos,
            onChanged: (value) {
              setState(() {
                _ratos = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
