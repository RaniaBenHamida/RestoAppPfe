import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final String id;
  final String code;
  final double value;

  Voucher({
    required this.id,
    required this.code,
    required this.value,
  });

  Voucher copyWith({
    String? id,
    String? code,
    double? value,
  }) {
    return Voucher(
      id: id ?? this.id,
      code: code ?? this.code,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'value': value,
    };
  }

  factory Voucher.fromSnapshot(DocumentSnapshot snap) {
    return Voucher(
      id: snap.id,
      code: snap.get('code'),
      value: snap.get('value').toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, code, value];

  @override
  bool get stringify => true;

  static List<Voucher> vouchers = [
    Voucher(id: '1', code: 'SAVES', value: 5.0),
    Voucher(id: '2', code: 'SAVE10', value: 10.0),
    Voucher(id: '3', code: 'SAVE15', value: 15.0),
  ];
}
