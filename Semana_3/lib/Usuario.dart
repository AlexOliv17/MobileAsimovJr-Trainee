import 'dart:io';

class Usuario {
  String nome;
  int idade;
  String cpf;
  double saldo;

  Usuario(this.nome, this.saldo, this.idade, this.cpf);

  void depositar(double valor) {
    saldo += valor;
    print('Depósito de R\$ $valor realizado com sucesso.');
    print('Seu saldo atual é de: R\$ $saldo');
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
      print('Saque de R\$ $valor realizado com sucesso.');
      print('Seu saldo atual é de: R\$ $saldo');
    } else {
      print('Saldo insuficiente para realizar o saque.\n');
    }
  }

  void verificarSaldo() {
    if (saldo > 0) {
      print('Seu saldo bancário é: R\$ $saldo\n');
    } else if (saldo == 0 || saldo < 0) {
      print('Seu saldo bancário é: R\$ 0.0 ou está negativo!\n');
    }
  }

  void dadosUsuario() {
    print('Nome: $nome');
    print('Idade: $idade');
    print('Cpf: $cpf');
  }
}

void cadastroUsuario() {
  print('Digite o nome do usuário:');
  var nome = stdin.readLineSync()!;
  print('Digite a idade do usuário:');
  var idade = int.parse(stdin.readLineSync()!);
  print('Digite o CPF do usuário:');
  var cpf = stdin.readLineSync()!;
  print('Digite o saldo inicial do usuário:');
  var saldo = double.parse(stdin.readLineSync()!);

  Usuario usuario = Usuario(nome, saldo, idade, cpf);
  print('Usuário cadastrado com sucesso!\n');
  print('Nome: ${usuario.nome}');
  print('Idade: ${usuario.idade}');
  print('Cpf: ${usuario.cpf}');
  print('Saldo: R\$ ${usuario.saldo}');
}
