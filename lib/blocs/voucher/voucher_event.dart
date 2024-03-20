import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/models.dart';

abstract class VoucherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadVouchers extends VoucherEvent {}

class UpdateVouchers extends VoucherEvent {
  final List<Voucher> vouchers;

  UpdateVouchers({this.vouchers = const <Voucher>[]});

  @override
  List<Object> get props => [vouchers];
}

class SelectVouchers extends VoucherEvent {
  final Voucher voucher;

  SelectVouchers({required this.voucher});

  @override
  List<Object> get props => [voucher];
}
