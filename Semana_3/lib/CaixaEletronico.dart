import 'Usuario.dart';
import 'dart:io';
import 'main.dart';

class CaixaEletronico {
  List<Usuario> usuarios = [];
  Usuario? usuarioAtual;

  void mostrarMenuPrincipal() {
    print('\n');
    print('   BEM-VINDO AO BOXMOV!!!');
    print('Seu caixa eletrônico pessoal');
    print('\n');
    print('Escolha sua operação:');
    print('1. Gerenciar Usuários');
    print('2. Usar Caixa Eletrônico');
    print('3. Sair');
  }

  void mostrarMenuUsuarios() {
    print('-----------Menu de Usuários-----------');
    print('1. Criar Novo Usuário.');
    print('2. Selecione um Usuário.');
    print('3. Voltar ao menu.');
  }

  void mostrarMenuCaixa() {
    String nomeUsuario = usuarioAtual!.nome;
    print('Olá $nomeUsuario, esse é seu BoxMov!');
    print('faça sua operação:');
    print('1. Depositar');
    print('2. Sacar');
    print('3. Ver Saldo');
    print('4. Voltar ao menu.');
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
              'Nenhum usuário selecionado, faça cadastro no Menu de Usuários ou selecione um usuário.');
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
      int escolha = int.parse(stdin.readLineSync()!);
      processarEscolhaUsuario(escolha);
      if (escolha == 3) break;
    }
  }

  void usarCaixaEletronico() {
    while (true) {
      mostrarMenuCaixa();
      int escolha = int.parse(stdin.readLineSync()!);
      processarEscolhaCaixa(escolha);
      if (escolha == 4) break;
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
    print('Usuário $nome criado com sucesso.\n');
  }

  void selecionarUsuario() {
    if (usuarios.isEmpty) {
      print(
          'Nenhum usuário disponível, faça cadastro no Menu de Usuários ou selecione um usuário.');
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
