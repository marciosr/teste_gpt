import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DimensoesInternas extends HiveObject {
  @HiveField(0)
  double altura;
  @HiveField(1)
  double largura;
  @HiveField(2)
  double ph;

  DimensoesInternas({
    required this.altura,
    required this.largura,
    required this.ph,
  });
}
