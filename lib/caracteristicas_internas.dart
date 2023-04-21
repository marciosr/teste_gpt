import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CaracteristicasInternas extends HiveObject {
  @HiveField(0)
  bool zonaAfotica;
  @HiveField(1)
  bool microclima;
  @HiveField(2)
  bool depositosOrganicos;

  CaracteristicasInternas({
    required this.zonaAfotica,
    required this.microclima,
    required this.depositosOrganicos,
  });
}

class CaracteristicasInternasForm extends StatefulWidget {
  const CaracteristicasInternasForm({super.key});

  @override
  _CaracteristicasInternasFormState createState() =>
      _CaracteristicasInternasFormState();
}

class _CaracteristicasInternasFormState
    extends State<CaracteristicasInternasForm> {
  final _formKey = GlobalKey<FormState>();
  bool _zonaAfotica = false;
  bool _microClima = false;
  bool _depositosOrganicos = false;

  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final caracteristicasInternas = CaracteristicasInternas(
        zonaAfotica: _zonaAfotica,
        microclima: _microClima,
        depositosOrganicos: _depositosOrganicos,
      );

      final box =
          Hive.box<CaracteristicasInternas>('caracteristicas_internas_box');
      await box.add(caracteristicasInternas);

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
            title: const Text('Zona Afótica'),
            value: _zonaAfotica,
            onChanged: (value) {
              setState(() {
                _zonaAfotica = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Micro Clima'),
            value: _microClima,
            onChanged: (value) {
              setState(() {
                _microClima = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Depósitos Orgânicos'),
            value: _depositosOrganicos,
            onChanged: (value) {
              setState(() {
                _depositosOrganicos = value!;
              });
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
