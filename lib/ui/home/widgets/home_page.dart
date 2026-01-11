import 'package:cashflow_app/ui/cash_record/widgets/cash_record.dart';
import 'package:cashflow_app/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const HomePage({super.key, required this.homeViewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.homeViewModel.readCashRecords();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash flow app'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CashRecordPage(viewModel: context.read()),
            ),
          ).then((_) {
            widget.homeViewModel.readCashRecords();
          });
        },
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if(viewModel.isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.cashRecords.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(viewModel.cashRecords[index].amount!),
                subtitle: Text(viewModel.cashRecords[index].remark!),
              ),
            ),
          );
        },
      )
    );
  }
}