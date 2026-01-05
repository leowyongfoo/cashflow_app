class CashRecordFields {
  static String id = 'id';
  static String remark = 'remark';
  static String amount = 'amount';
  static String date = 'date';
}

class CashRecord {
  int? id;
  String? remark;
  String? amount;
  String? date;

  CashRecord({
    this.id,
    this.remark,
    this.amount,
    this.date
  });

  static fromJson(Map<String, dynamic> json) {
    return CashRecord(
      id: json[CashRecordFields.id] as int?,
      remark: json[CashRecordFields.remark] as String?,
      amount: json[CashRecordFields.amount] as String?,
      date: json[CashRecordFields.date] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    CashRecordFields.id: id,
    CashRecordFields.remark : remark,
    CashRecordFields.amount: amount,
    CashRecordFields.date: date,
  };
}