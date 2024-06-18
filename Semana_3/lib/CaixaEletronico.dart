import 'Usuario.dart';
import 'dart:io';
import 'main.dart';

class CaixaEletronico {
  List<Usuario> usuarios = [];
  Usuario? usuarioAtual;

  void mostrarMenuPrincipal() {
    print('Bem-vindo ao Sistema de Caixa Eletrônico');
    print('1. Gerenciar Usuários');
    print('2. Usar Caixa Eletrônico');
    print('3. Sair');
  }

  void mostrarMenuUsuarios() {
    print('Menu de Usuários');
    print('1. Criar Novo Usuário');
    print('2. Selecionar Usuário Existente');
    print('3. Voltar ao Menu Principal');
  }

  void mostrarMenuCaixa() {
    print('Bem-vindo ao Caixa Eletrônico');
    print('1. Depositar');
    print('2. Sacar');
    print('3. Ver Saldo');
    print('4. Sair');
  }

  void processarEscolhaPrincipal(int escolha) {
    switch (escolha) {
      case 1:
        gerenciarUsuarios();
        break;
      case 2:
        if (usuarioAtual != null) {
          usarCaixaEletronico();
        } else {
          print(
              'Nenhum usuário selecionado. Por favor, selecione um usuário primeiro.');
        }
        break;
      case 3:
        print('Saindo...');
        break;
      default:
        print('Escolha inválida');
    }
  }

  void processarEscolhaUsuario(int escolha) {
    switch (escolha) {
      case 1:
        criarUsuario();
        break;
      case 2:
        selecionarUsuario();
        break;
      case 3:
        break;
      default:
        print('Escolha inválida');
    }
  }

  void processarEscolhaCaixa(int escolha) {
    switch (escolha) {
      case 1:
        print('Digite o valor para depósito:');
        double quantia = double.parse(stdin.readLineSync()!);
        usuarioAtual!.depositar(quantia);
        break;
      case 2:
        print('Digite o valor para saque:');
        double quantia = double.parse(stdin.readLineSync()!);
        usuarioAtual!.sacar(quantia);
        break;
      case 3:
        usuarioAtual!.verificarSaldo();
        break;
      case 4:
        print('Saindo...');
        break;
      default:
        print('Escolha inválida');
    }
  }

  void gerenciarUsuarios() {
    while (true) {
      mostrarMenuUsuarios();
      print('Escolha uma opção:');
      int escolha = int.parse(stdin.readLineSync()!);
      processarEscolhaUsuario(escolha);
      if (escolha == 3) break;
      print('Pressione Enter para continuar...');
      stdin.readLineSync(); // Espera o usuário pressionar Enter para continuar
    }
  }

  void usarCaixaEletronico() {
    while (true) {
      mostrarMenuCaixa();
      print('Escolha uma opção:');
      int escolha = int.parse(stdin.readLineSync()!);
      processarEscolhaCaixa(escolha);
      if (escolha == 4) break;
      print('Pressione Enter para continuar...');
      stdin.readLineSync(); // Espera o usuário pressionar Enter para continuar
    }
  }

  void criarUsuario() {
    print('Digite o nome do novo usuário:');
    String nome = stdin.readLineSync()!;

    print('Digite seu CPF:');
    String cpf = stdin.readLineSync()!;

    print('Digite sua idade:');
    String idade = stdin.readLineSync()!;
    double.parse(idade);
    idade.toString();

    print('Digite seu saldo inicial: ');
    String saldoInicial = stdin.readLineSync()!;
    double saldo = double.parse(saldoInicial);

    usuarios.add(Usuario(nome, cpf, idade, saldo));
    print('Usuário $nome criado com sucesso.');
  }

  void selecionarUsuario() {
    if (usuarios.isEmpty) {
      print('Nenhum usuário disponível. Crie um usuário primeiro.');
      return;
    }

    print('Selecione um usuário:');
    for (int i = 0; i < usuarios.length; i++) {
      print('${i + 1}. ${usuarios[i].nome}');
    }
    int escolha = int.parse(stdin.readLineSync()!);
    if (escolha > 0 && escolha <= usuarios.length) {
      usuarioAtual = usuarios[escolha - 1];
      print('Usuário ${usuarioAtual!.nome} selecionado.');
    } else {
      print('Escolha inválida');
    }
  }
}
