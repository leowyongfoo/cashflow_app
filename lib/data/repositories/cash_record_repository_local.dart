import 'package:cashflow_app/data/models/cash_record/cash_record.dart';
import 'package:cashflow_app/data/repositories/cash_record_repsitory.dart';

class CashRecordRepositoryLocal implements CashRecordRepository {
  @override
  Future<List<CashRecord>> readCashRecords() async {
    return [
      CashRecord(
        id: 1,
        remark: 'Mock data 1',
        amount: '1.00',
        date: '10/1/2026'
      )
    ];
  }

}