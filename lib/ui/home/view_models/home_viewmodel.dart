import 'package:cashflow_app/data/models/cash_record/cash_record.dart';
import 'package:cashflow_app/data/repositories/cash_record_repsitory.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  final CashRecordRepository _cashRecordRepository;

  HomeViewModel({
    required CashRecordRepository cashRecordRepository,
  }) :
      _cashRecordRepository = cashRecordRepository;

  List<CashRecord> _cashRecords = [];
  List<CashRecord> get cashRecords => _cashRecords;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> readCashRecords() async {
    try{
      _cashRecords = await _cashRecordRepository.readCashRecords();
      _isLoading = false;
    } finally {
      notifyListeners();
    }
  }


}