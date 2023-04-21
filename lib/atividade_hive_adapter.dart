import 'package:teste_gpt/atividade.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class AtividadeHiveAdapater extends TypeAdapter<Atividade> {
  @override
  final typeId = 0;

  @override
  Atividade read(BinaryReader reader) {
    return Atividade(
      agropecuaria: reader.readBool(),
      explotacaoMineral: reader.readBool(),
      barramento: reader.readBool(),
      turismo: reader.readBool(),
      outras: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Atividade obj) {
    writer.writeBool(obj.agropecuaria);
    writer.writeBool(obj.explotacaoMineral);
    writer.writeBool(obj.barramento);
    writer.writeBool(obj.turismo);
    writer.writeString(obj.outras);
  }
}
