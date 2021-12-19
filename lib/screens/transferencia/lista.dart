import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

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
  final String _appBarTitulo = 'Lista de Transferência';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitulo)),
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
