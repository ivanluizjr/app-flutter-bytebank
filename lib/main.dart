// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

const String _title = 'Lista de Transferência';

/// This is the main application widget.
class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  final String _textoBotaoConfirmar = 'Confirmar';

  @override
  State<StatefulWidget> createState() {
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
      appBar: AppBar(title: const Text('Formulário de Transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: controladorCpNumConta,
              rotulo: 'Número da Conta',
              dica: '0000',
              icone: Icons.account_balance,
            ),
            Editor(
              controlador: controladorCpValor,
              rotulo: 'Valor',
              dica: '0.00',
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
      debugPrint('Criando transferencia');
      debugPrint('$transferenciaCriada');
      Navigator.pop(
        context,
        transferenciaCriada,
      );
    }
  }
}

class Editor extends StatelessWidget {
  const Editor({
    Key? key,
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
  }) : super(key: key);

  //Interrogação na frente do tipo da variável serve para indicar que não é obrigatoria a varialvel
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          icon: Icon(icone),
          labelText: rotulo,
          hintText: dica,
        ),
        style: const TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  ListaTransferencias({Key? key}) : super(key: key);

  final List<Transferencia> transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: ListView.builder(
        itemBuilder: (context, indice) {
          final transferencia = widget.transferencias[indice];
          return ItemTransferencia(transferencia: transferencia);
        },
        itemCount: widget.transferencias.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: unused_local_variable
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            Future.delayed(const Duration(seconds: 2), () {
              if (transferenciaRecebida != null) {
                setState(() {
                  widget.transferencias.add(transferenciaRecebida);
                });
              }
            });
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  const ItemTransferencia({
    Key? key,
    required this.transferencia,
  }) : super(key: key);

  final Transferencia transferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('Transferência: ' + transferencia.transf.toString()),
        subtitle: Text('Numero Conta: ' + transferencia.numConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double transf;
  final int numConta;
  Transferencia({
    required this.transf,
    required this.numConta,
  });

  @override
  String toString() {
    return 'Transferencia{transf: $transf, numConta: $numConta}';
  }
}
