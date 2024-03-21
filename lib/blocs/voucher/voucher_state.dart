import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/models.dart';

abstract class VoucherState extends Equatable {
  const VoucherState();

  @override
  List<Object> get props => [];
}

class VoucherLoading extends VoucherState {}

class VoucherLoaded extends VoucherState {
  final List<Voucher> vouchers;

  VoucherLoaded({this.vouchers= const <Voucher>[]});
  

  @override
  List<Object> get props => [vouchers];
}


class VoucherSelected extends VoucherState {
  final Voucher voucher;

  VoucherSelected({ required this.voucher});

  @override
  List<Object> get props => [voucher];
}
