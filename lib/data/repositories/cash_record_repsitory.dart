import 'package:cashflow_app/data/models/cash_record/cash_record.dart';

abstract class CashRecordRepository {
  Future<List<CashRecord>> readCashRecords();
}