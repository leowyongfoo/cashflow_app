import 'package:cashflow_app/data/models/cash_record/cash_record.dart';

class LocalDataService {

  Future<List<CashRecord>> getCashRecords() async {
    await Future.delayed(Duration(seconds: 3));
    return [
      CashRecord(
          id: 1,
          remark: 'Mock data 1',
          amount: '1.00',
          date: '10/1/2026'
      ),
      CashRecord(
          id: 2,
          remark: 'Mock data 2',
          amount: '2.00',
          date: '11/1/2026'
      ),

    ];
  }

  Future<CashRecord> insertCashRecord({required CashRecord cashRecord}) async {
    final result = cashRecord.copyWith(id: 3);
    return result;
  }
}