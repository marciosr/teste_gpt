import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FeicoesCarsticas extends HiveObject {
  @HiveField(0)
  bool lapias;
  @HiveField(1)
  bool dolinas;
  @HiveField(2)
  bool sumidouros;
  @HiveField(3)
  bool paredoes;
  @HiveField(4)
  bool valesCegos;
  @HiveField(4)
  bool abrigos;
  @HiveField(5)
  String outras;

  FeicoesCarsticas({
    required this.lapias,
    required this.dolinas,
    required this.sumidouros,
    required this.paredoes,
    required this.valesCegos,
    required this.abrigos,
    required this.outras,
  });
}

class FeicoesCarsticasForm extends StatefulWidget {
  const FeicoesCarsticasForm({super.key});

  @override
  _FeicoesCarsticasFormState createState() => _FeicoesCarsticasFormState();
}

class _FeicoesCarsticasFormState extends State<FeicoesCarsticasForm> {
  final _formKey = GlobalKey<FormState>();
  bool _lapias = false;
  bool _dolinas = false;
  bool _sumidouros = false;
  bool _paredoes = false;
  bool _valesCegos = false;
  bool _abrigos = false;
  String _outras = '';
  final outrasControler = TextEditingController();

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final feicoesCarsticas = FeicoesCarsticas(
        lapias: _lapias,
        dolinas: _dolinas,
        sumidouros: _sumidouros,
        paredoes: _paredoes,
        valesCegos: _valesCegos,
        abrigos: _abrigos,
        outras: _outras,
      );

      final box = Hive.box<FeicoesCarsticas>('feicoes_carsticas_box');
      await box.add(feicoesCarsticas);

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
            title: const Text('Lapias'),
            value: _lapias,
            onChanged: (value) {
              setState(() {
                _lapias = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Dolinas'),
            value: _dolinas,
            onChanged: (value) {
              setState(() {
                _dolinas = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Sumidouros'),
            value: _sumidouros,
            onChanged: (value) {
              setState(() {
                _sumidouros = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Paredões'),
            value: _paredoes,
            onChanged: (value) {
              setState(() {
                _paredoes = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Vales Cegos'),
            value: _valesCegos,
            onChanged: (value) {
              setState(() {
                _valesCegos = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Abrigos'),
            value: _abrigos,
            onChanged: (value) {
              setState(() {
                _abrigos = value!;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Iforme outro tipo de feição',
              labelText: 'Outras feições',
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
            controller: outrasControler,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
