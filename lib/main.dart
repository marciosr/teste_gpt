import 'package:flutter/material.dart';
import 'package:teste_gpt/atividade.dart';
import 'package:teste_gpt/classificacao.dart';
import 'package:teste_gpt/empreendimento.dart';
import 'package:teste_gpt/evolucao.dart';
import 'package:teste_gpt/feicoes_carsticas.dart';
import 'package:teste_gpt/genese.dart';
import 'package:teste_gpt/litologia.dart';
import 'package:teste_gpt/localizacao.dart';
import 'package:teste_gpt/morfologia.dart';
import 'package:teste_gpt/morfologia_caverna.dart';
import 'package:teste_gpt/recursos_hidricos.dart';
import 'package:teste_gpt/espeleotemas.dart';
import 'package:teste_gpt/caracteristicas_internas.dart';
import 'package:teste_gpt/classificacao.dart';
import 'package:teste_gpt/conservacao.dart';
import 'package:teste_gpt/fauna_cavernicola.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teste_gpt/relevo_carstico.dart';
import 'package:teste_gpt/sedimentacao.dart';
import 'package:teste_gpt/solo.dart';
import 'package:teste_gpt/vegetacao_interior.dart';
import 'package:teste_gpt/vegetacao_uso.dart';
import 'package:teste_gpt/zona_hidrologica_carste.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<RecursosHidricos>('recursos_hidricos_box');
  await Hive.openBox<Atividade>('atividade_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

  /* _MyStatefulWidgetState() {
    onStepContinue();
  }*/

  void onStepCancel() {
    if (_index > 0) {
      setState(() {
        _index -= 1;
      });
    }
  }

  void onStepContinue() {
    if (_index < _steps.length - 1) {
      setState(() {
        _index++;
      });
    } else {
      setState(() {
        _index = 0;
      });
    }
  }

  void onStepTapped(int step) {
    setState(() {
      _index = step;
    });
  }

  final _steps = [
    Step(
      title: const Text('Espeleotemas'),
      content: Container(
          alignment: Alignment.centerLeft, child: const EspeleotemasForm()),
    ),
    Step(
      title: const Text('Características Internas'),
      content: Container(
          alignment: Alignment.centerLeft,
          child: const CaracteristicasInternasForm()),
    ),
    Step(
      title: const Text('Recursos Hídricos'),
      content: Container(
          alignment: Alignment.centerLeft, child: const RecursosHidricosForm()),
    ),
    Step(
      title: const Text('Classificação'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const ClassificacaoForm(),
      ),
    ),
    Step(
      title: const Text('Conservação'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const ConservacaoForm(),
      ),
    ),
    Step(
      title: const Text('Fauna Cavernícula'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const FaunaCavernicolaForm(),
      ),
    ),
    Step(
      title: const Text('Feições Cársticas'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const FeicoesCarsticasForm(),
      ),
    ),
    Step(
      title: const Text('Gênese'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const GeneseForm(),
      ),
    ),
    Step(
      title: const Text('Litologia'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const LitologiaForm(),
      ),
    ),
    Step(
      title: const Text('Localização'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const LocalizacaoForm(),
      ),
    ),
    Step(
      title: const Text('Morfologia da Caverna'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const MorfologiaCavernaForm(),
      ),
    ),
    Step(
      title: const Text('Relevo Cárstico'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const RelevoCarsticoForm(),
      ),
    ),
    Step(
      title: const Text('Solo'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const SoloForm(),
      ),
    ),
    Step(
      title: const Text('Vegetação Interior'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const VegetacaoInteriorForm(),
      ),
    ),
    Step(
      title: const Text('Localização na Zona Hidrológica do Carste'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const ZonaHidrologicaCarsteForm(),
      ),
    ),
    Step(
      title: const Text('Morfologia'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const MorfologiaForm(),
      ),
    ),
    Step(
      title: const Text('Sedimentação'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const SedimentacaoForm(),
      ),
    ),
    Step(
      title: const Text('Vejetação/Uso'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const VegetacaoUsoForm(),
      ),
    ),
    Step(
      title: const Text('Evolução'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const EvolucaoForm(),
      ),
    ),
    Step(
      title: const Text('Atividade Econômica Desenvolvida'),
      content: AtividadeForm(),
    ),
    Step(
      title: const Text('Empreendimento'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: const EmpreendimentoForm(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: onStepCancel,
      onStepContinue: onStepContinue,
      onStepTapped: onStepTapped,
      steps: _steps,
    );
  }
}
