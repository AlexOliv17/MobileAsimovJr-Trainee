import 'dart:io';
import 'CaixaEletronico.dart';
import 'Usuario.dart';

void main() {
  CaixaEletronico caixaEletronico = CaixaEletronico();

  while (true) {
    caixaEletronico.mostrarMenuPrincipal();
    int escolha = int.parse(stdin.readLineSync()!);
    caixaEletronico.processarEscolhaPrincipal(escolha);
    if (escolha == 3) break; // Sai do loop se a escolha for sair
  }
}
