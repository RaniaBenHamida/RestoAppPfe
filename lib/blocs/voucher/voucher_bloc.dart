import 'dart:async';

import 'package:flutter_app_resto/blocs/voucher/voucher_event.dart';
import 'package:flutter_app_resto/blocs/voucher/voucher_state.dart';
import 'package:flutter_app_resto/repositories/voucher/voucher_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherRepository _voucherRepository;
  StreamSubscription? _streamSubscription;

  VoucherBloc({required VoucherRepository voucherRepository})
      : _voucherRepository = voucherRepository,
        super(VoucherLoading()) {
    on<LoadVouchers>(_onLoadVouchers);
    on<UpdateVouchers>(_onUpdateVouchers);
    on<SelectVouchers>(_onSelectVouchers);
  }

  void _onLoadVouchers(LoadVouchers event, Emitter<VoucherState> emit) {
    _streamSubscription?.cancel();
    _streamSubscription = _voucherRepository.getVoucher().listen((vouchers) {
      add(
        UpdateVouchers(vouchers: vouchers),
      );
    });
  }

  void _onUpdateVouchers(UpdateVouchers event, Emitter<VoucherState> emit) {
    emit(
      VoucherLoaded(vouchers: event.vouchers),
    );
  }

  void _onSelectVouchers(SelectVouchers event, Emitter<VoucherState> emit) {
    emit(
      VoucherSelected(voucher: event.voucher),
    );
  }
}
