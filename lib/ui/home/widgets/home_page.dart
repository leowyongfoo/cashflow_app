import 'package:cashflow_app/ui/core/ui/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/cash_record/cash_record.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  List<CashRecord> cashRecords = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash flow app'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField(
                labelText: 'remark here',
                controller: remarkController,
              ),
              SizedBox(height: 10,),
              AppTextFormField(
                labelText: 'amount',
                controller: amountController,
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
}