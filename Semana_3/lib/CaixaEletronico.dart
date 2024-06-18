import 'Usuario.dart';
import 'dart:io';

class CaixaEletronico {
  Usuario usuario;

  CaixaEletronico(this.usuario);

  void mostrarMenu() {
    print("\n------------------------------------");
    print('Bem-vindo ao seu Caixa Eletrônico!');
    print("------------------------------------");
    print("Escolha a opção desejada:");
    print('1. Depositar');
    print('2. Sacar');
    print('3. Ver Saldo');
    print('4. Dados do Usuário');
    print('5. Cadastrar Usuário');
    print("6. Sair");
  }

  void processarEscolha(int escolha) {
    switch (escolha) {
      case 1:
        print('Digite o valor para depósito:');
        var deposito = stdin.readLineSync()!;
        usuario.depositar(double.parse(deposito));
        break;
      case 2:
        print('Digite o valor para saque:');
        var saque = stdin.readLineSync()!;
        usuario.sacar(double.parse(saque));
        break;
      case 3:
        usuario.verificarSaldo();
        break;
      case 4:
        usuario.dadosUsuario();
        break;
      case 5:
        cadastroUsuario();
        break;
      case 6:
        print('Logout realizado, até a próxima!');
        break;
      default:
        print('Escolha inválida');
    }
  }
}
