import 'package:flutter/material.dart';

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
