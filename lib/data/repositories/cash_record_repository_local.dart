import 'package:cashflow_app/data/models/cash_record/cash_record.dart';
import 'package:cashflow_app/data/repositories/cash_record_repsitory.dart';

import '../services/local/local_data_service.dart';

class CashRecordRepositoryLocal implements CashRecordRepository {

  CashRecordRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;
  List<CashRecord> _cashRecords = [];

  @override
  Future<List<CashRecord>> readCashRecords() async {
    //_cashRecords = await _localDataService.getCashRecords();
    return _cashRecords;
  }

  @override
  Future<void> createCashRecord(CashRecord cashRecord) async {
    CashRecord result  = await _localDataService.insertCashRecord(cashRecord: cashRecord);
    _cashRecords.add(result);
  }

}