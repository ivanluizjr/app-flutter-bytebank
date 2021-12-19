// ignore_for_file: unnecessary_null_comparison

import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

/// This is the main application widget.
class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade900),
      ),
      home: ListaTransferencias(),
    );
  }
}
