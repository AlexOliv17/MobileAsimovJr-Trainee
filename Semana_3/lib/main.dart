import 'CaixaEletronico.dart';
import 'Usuario.dart';
import 'dart:io';

void main() {
  Usuario usuario = Usuario('João', 1000.0, 20, '123.456.789-00');
  CaixaEletronico caixaEletronico = CaixaEletronico(usuario);

  while (true) {
    caixaEletronico.mostrarMenu();
    var escolha = int.parse(stdin.readLineSync()!);
    caixaEletronico.processarEscolha(escolha);
    if (escolha == 6) break; // Sai do loop se a escolha for sair
    print('\nPressione "Enter" para continuar a opreção...');
    stdin.readLineSync();
  }
}
