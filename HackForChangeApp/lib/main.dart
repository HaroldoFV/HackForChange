import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/main/main_page.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appDelegations = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'login',
      getPages: routes,
      supportedLocales: const <Locale>[Locale('pt', 'BR')],
      localizationsDelegates: appDelegations,
      home: const Login(),
    );
  }
}
