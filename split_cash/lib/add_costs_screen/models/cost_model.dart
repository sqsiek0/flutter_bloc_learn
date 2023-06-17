// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

class CostModel {
  String description;
  Double price;
  DateTime dateTime;

  CostModel({
    required this.description,
    required this.price,
    required this.dateTime,
  });
}
