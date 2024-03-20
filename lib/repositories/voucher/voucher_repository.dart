import 'package:flutter_app_resto/models/voucher_model.dart';
import 'package:flutter_app_resto/repositories/voucher/base_voucher_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VoucherRepository extends BaseVoucherRepository {
  final FirebaseFirestore _firebaseFirestore;

  VoucherRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Voucher>> getVoucher() {
    return _firebaseFirestore.collection("vouchers").snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Voucher.fromSnapshot(doc)).toList());
  }

  @override
  Future<bool> searchVoucher(String code) async {
    final voucher = await _firebaseFirestore
        .collection('vouchers')
        .where('code', isEqualTo: code)
        .get();

    return voucher.docs.length > 0;
  }
}
