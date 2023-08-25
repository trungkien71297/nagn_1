import 'package:isar/isar.dart';

part 'country.g.dart';

@collection
class Country {
  Id id = Isar.autoIncrement;
  String? name;
  String? code2;
  String? code3;
  String? currencyName;
  String? currencyCode;
}