// ignore_for_file: unnecessary_null_comparison

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const String appBar = 'Formulário de Transferência';
const String rotuloNumConta = 'Número da Conta';
const String dicaNumConta = '0000';
const String rotuloValor = 'Valor Transferência';
const String dicaValor = '00.00';
const String textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  final String _textoBotaoConfirmar = 'Confirmar';

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController controladorCpNumConta = TextEditingController();
  final TextEditingController controladorCpValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: controladorCpNumConta,
              rotulo: rotuloNumConta,
              dica: dicaNumConta,
              icone: Icons.account_balance,
            ),
            Editor(
              controlador: controladorCpValor,
              rotulo: rotuloValor,
              dica: dicaValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(widget._textoBotaoConfirmar),
              onPressed: () => criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void criarTransferencia(BuildContext context) {
    int numeroConta = int.parse(controladorCpNumConta.text);
    double valor = double.parse(controladorCpValor.text);
    if (numeroConta != null && valor != null) {
      // ignore: unused_local_variable
      final transferenciaCriada =
          Transferencia(transf: valor, numConta: numeroConta);
      Navigator.pop(
        context,
        transferenciaCriada,
      );
    }
  }
}
