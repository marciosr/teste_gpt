import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teste_gpt/atividade_hive_adapter.dart';
//part 'atividade.g.dart';

class Atividade {
  bool agropecuaria;
  bool explotacaoMineral;
  bool barramento;
  bool turismo;
  String outras;

  Atividade({
    required this.agropecuaria,
    required this.explotacaoMineral,
    required this.barramento,
    required this.turismo,
    required this.outras,
  });
}

class AtividadeForm extends StatefulWidget {
  const AtividadeForm({super.key});
  //final VoidCallback enviarFormulario;

  /*const AtividadeForm({Key? key, required this.enviarFormulario})
      : super(key: key);
*/
  @override
  _AtividadeFormState createState() => _AtividadeFormState();
}

class _AtividadeFormState extends State<AtividadeForm> {
  final _formKey = GlobalKey<FormState>();
  bool _agropecuaria = false;
  bool _explotacaoMineral = false;
  bool _barramento = false;
  bool _turismo = false;
  String _outras = '';
  final outrasControler = TextEditingController();

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final atividade = Atividade(
        agropecuaria: _agropecuaria,
        explotacaoMineral: _explotacaoMineral,
        barramento: _barramento,
        turismo: _turismo,
        outras: _outras,
      );

      final box = Hive.box<Atividade>('atividade_box');
      await box.add(atividade);

      // exibe uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados salvos com sucesso')),
      );
      print('Salvou no hive!!!');
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
            title: const Text('Agropecuária'),
            value: _agropecuaria,
            onChanged: (value) {
              setState(() {
                _agropecuaria = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Explotação de Recursos Minerais'),
            value: _explotacaoMineral,
            onChanged: (value) {
              setState(() {
                _explotacaoMineral = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Barramento'),
            value: _barramento,
            onChanged: (value) {
              setState(() {
                _barramento = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Turismo'),
            value: _turismo,
            onChanged: (value) {
              setState(() {
                _turismo = value!;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Informe outra atividade se houver',
              labelText: 'Outras',
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
          ElevatedButton(
            onPressed: () {
              _enviarFormulario();
              //widget.proximoStep();
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
