import 'dart:io';

void exibirMenu() {
  print('\nMenu:');
  print('1 - Adicionar Dados do Aluno');
  print('2 - Verificar Notas');
  print('3 - Sair');
  print('Escolha uma opção:');
}

void main() {
  Map<String, List<double>> alunos = {};
  while(true) {
    exibirMenu();
    String? opcao = stdin.readLineSync();

    switch(opcao) {
      case '1':
        adicionarAluno(alunos);
        break;
      case '2':
        verificarNotas(alunos);
        break;
      case '3':
        print('Saindo...');
        return;
      default:
        print('Opção inválida!');
    }
  }
}

void adicionarAluno(Map<String, List<double>> alunos) {
  print('Digite o nome do aluno:');
  String? nome = stdin.readLineSync();

  if(nome != null && nome.isNotEmpty) {
    List<double> notas = [];
    for(int i = 1; i <= 3; i++) {
      double? nota = _lerNota('Digite a $iª nota:');
      if (nota != null) {
        notas.add(nota);
      } else {
        print('Nota inválida!');
        return;
      }
    }

    alunos[nome] = notas; // valor da chave
    print('Aluno adicionado!');
  } else {
    print('Nome inválido!');
  }
}

double? _lerNota(String mens){
  print(mens);
  String? notaString = stdin.readLineSync();
  return double.tryParse(notaString ?? '');
}

void verificarNotas(Map<String, List<double>> alunos) {
  if (alunos.isEmpty) {
    print('Sem alunos cadastrados.');
    return;
  }

  for (String nome in alunos.keys) {
    List<double> notas = alunos[nome]!;
    double media = calcularMedia(notas);
    String status = media >= 7.0 ? 'Aprovado' : 'Reprovado';
    print('Aluno: $nome - Média: ${media.toStringAsFixed(2)} - Status: $status');
  }
}

double calcularMedia(List<double> notas) {
  double soma = 0;
  for (double nota in notas)
    soma += nota;

  return soma/notas.length;
}

