import 'package:cashflow_app/data/models/cash_record/cash_record.dart';
import 'package:cashflow_app/data/repositories/cash_record_repsitory.dart';

class CashRecordViewModel {
  CashRecordViewModel({required CashRecordRepository cashRecordRepository})
      : _cashRecordRepository = cashRecordRepository;

  final CashRecordRepository _cashRecordRepository;

  Future<void> addCashRecords({required CashRecord cashRecord}) async {
    await _cashRecordRepository.createCashRecord(cashRecord);
  }
}