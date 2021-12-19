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
