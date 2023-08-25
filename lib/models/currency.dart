import 'package:isar/isar.dart';
part 'currency.g.dart';

@collection
class Currency {
  Id id = Isar.autoIncrement;
  String? code;
  String? symbols;
  double? rate;
}