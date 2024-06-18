class Usuario {
  String nome;
  String cpf;
  String idade;
  double saldo;

  Usuario(this.nome, this.cpf, this.idade, this.saldo);

  void depositar(double quantia) {
    saldo += quantia;
    print('Depósito de R\$ $quantia realizado com sucesso. ');
    print("Saldo atual: R\$ $saldo");
  }

  void sacar(double quantia) {
    if (quantia <= saldo) {
      saldo -= quantia;
      print('Saque de R\$ $quantia realizado com sucesso.');
      print("Saldo atual: R\$ $saldo");
    } else {
      print('Saldo insuficiente para saque.');
    }
  }

  void verificarSaldo() {
    print('Saldo atual: R\$ $saldo');
  }
}
