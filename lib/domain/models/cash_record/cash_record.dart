class CashRecordFields {
  static String id = 'id';
  static String remark = 'remark';
  static String amount = 'amount';
}

class CashRecord {
  int? id;
  String? remark;
  String? amount;

  CashRecord({
    this.id,
    this.remark,
    this.amount,
  });

  static fromJson(Map<String, dynamic> json) {
    return CashRecord(
      id: json[CashRecordFields.id] as int?,
      remark: json[CashRecordFields.remark] as String?,
      amount: json[CashRecordFields.amount] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    CashRecordFields.id: id,
    CashRecordFields.remark : remark,
    CashRecordFields.amount: amount,
  };
}