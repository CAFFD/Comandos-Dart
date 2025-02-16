import 'dart:io';

void exibirMenu() {
  print('\nMenu:');
  print('1 - Adicionar tarefa');
  print('2 - Remover tarefa');
  print('3 - Listar tarefas');
  print('4 - Sair');
  print('Escolha uma opção:');
}

void main() {
  List<String> tarefas = [];

  while(true) {
    exibirMenu();
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        adicionarTarefa(tarefas);
        break;
      case '2':
        removerTarefa(tarefas);
        break;
      case '3':
        listarTarefas(tarefas);
        break;
      case '4':
        print('Saindo do programa...');
        return;
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}

void adicionarTarefa(List<String> tarefas) {
  print('Digite a nova tarefa: ');
  String? tarefa = stdin.readLineSync();
  if (tarefa != null && tarefa.isNotEmpty) {
    tarefas.add(tarefa);
    print('Tarefa adicionada com sucesso!');
  }
  else
    print('Tarefa inválida. Tente novamente.');
}

void listarTarefas(List<String> tarefas) {
  if(tarefas.isEmpty)
    print('Lista de tarefa vazia.');
  else {
    print('Tarefas Cadastradas:');
    for (int i=0; i<tarefas.length; i++)
      print('${i + 1} - ${tarefas[i]}');
  }
}

void removerTarefa(List<String> tarefas) {
  if(tarefas.isEmpty) {
    print('Lista de tarefa vazia.');
    return;
  }

  print('Exibindo Tarefas Cadastradas:');
  for (int i=0; i<tarefas.length; i++)
    print('${i + 1} - ${tarefas[i]}');

  print('Digite o número da tarefa para remover: ');
  String? codeString = stdin.readLineSync();
  int? code = int.tryParse(codeString ?? '');

  if (code != null && code >= 1 && code <= tarefas.length) {
    tarefas.removeAt(code - 1);
    print('Tarefa removida com sucesso!');
  } else {
    print('Código inválido. Tente Novamente...');
  }
}