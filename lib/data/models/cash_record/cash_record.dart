class CashRecordFields {
  static String id = 'id';
  static String remark = 'remark';
  static String amount = 'amount';
  static String date = 'date';
  static String type = 'type';
}

class CashRecord {
  int? id;
  String? remark;
  String? amount;
  String? date;
  int? type;

  CashRecord({
    this.id,
    this.remark,
    this.amount,
    this.date,
    this.type,
  });

  CashRecord copyWith({
    int? id,
    String? remark,
    String? amount,
    String? date,
    int? type
  }) =>
      CashRecord(
        id: id ?? this.id,
        remark: remark ?? this.remark,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        type: type ?? this.type,
      );

  static fromJson(Map<String, dynamic> json) {
    return CashRecord(
      id: json[CashRecordFields.id] as int?,
      remark: json[CashRecordFields.remark] as String?,
      amount: json[CashRecordFields.amount] as String?,
      date: json[CashRecordFields.date] as String?,
      type: json[CashRecordFields.type] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    CashRecordFields.id: id,
    CashRecordFields.remark : remark,
    CashRecordFields.amount: amount,
    CashRecordFields.date: date,
    CashRecordFields.type: type,
  };
}