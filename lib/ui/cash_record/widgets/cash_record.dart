import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/cash_record/cash_record.dart';
import '../../core/ui/text_form_field.dart';

class CashRecordPage extends StatefulWidget {
  const CashRecordPage({super.key});

  @override
  State<CashRecordPage> createState() => _CashRecordPageState();
}

class _CashRecordPageState extends State<CashRecordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;
  List<CashRecord> cashRecords = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateController.text = formatDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add cash record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField(
                labelText: 'remark here',
                controller: remarkController,
              ),
              AppTextFormField(
                labelText: 'amount',
                controller: amountController,
              ),
              AppTextFormField(
                readOnly: true,
                labelText: 'Date',
                controller: dateController,
                onTap: _selectDate,
              ),
              ElevatedButton(
                onPressed: () {
                  final data = CashRecord(
                    remark: remarkController.text,
                    amount: amountController.text,
                  );
                  setState(() {
                    cashRecords.add(data);
                  });
                },
                child: Text('Add'),
              ),
              cashRecords.isNotEmpty ?
              ListView.builder(
                shrinkWrap: true,
                itemCount: cashRecords.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1.0,
                  child: ListTile(
                    title: Text('RM ${double.parse(cashRecords[index].amount ?? '0.00').toStringAsFixed(2)}'),
                    subtitle: Text(cashRecords[index].remark ?? ''),
                  ),
                ),
              ) : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  formatDate(DateTime dateTime){
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2026),
      lastDate: DateTime(2027),
    );

    setState(() {
      selectedDate = pickedDate;
      dateController.text = formatDate(selectedDate!);
    });
  }
}
