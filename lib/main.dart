import 'package:cashflow_app/data/repositories/cash_record_repository_local.dart';
import 'package:cashflow_app/data/repositories/cash_record_repsitory.dart';
import 'package:cashflow_app/ui/home/view_models/home_viewmodel.dart';
import 'package:cashflow_app/ui/home/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) =>
            CashRecordRepositoryLocal() as CashRecordRepository,
        ),
        ChangeNotifierProvider(create: (context) =>
            HomeViewModel(cashRecordRepository: context.read()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash flow app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) {
          return HomePage(homeViewModel: context.read<HomeViewModel>());
        }
      },
    );
  }
}

