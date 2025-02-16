import 'dart:io';

void main() {
  List<Map<String, dynamic>> usuarios = [];
  // isso aqui cria a lista. Map associa uma chave para algum valor,
  // String é a "key", e o dynamic é o valor de qualquer tipo de dado

  while (true) {

    print('Digite o nome: (ou "sair" para encerrar!)');
    String? nome = stdin.readLineSync();

    if(nome == 'sair')
      break;

    print('Digite sua idade: ');
    String? idadeString = stdin.readLineSync();
    int? idade = int.tryParse(idadeString ?? '');
    // para evitar erros

    print('Digite seu Email: ');
    String? email = stdin.readLineSync();

    if (idade != null && idade >= 18) {
      Map<String, dynamic> user = {
        'nome': nome,
        'idade': idade,
        'email': email,
      };
      usuarios.add(user);
      print('Cadastro realizado!');
      
      /*
       aqui eu uso o Map "user" para armazenar realmente o usuário
       e depois quardo no Map "usuarios", para posteriormente
       exibi-lo
      */
    }
    else
      print('Cadastro não pode ser realizado!');

    print('\nUsuários cadastrados:');
    if (usuarios.isEmpty)
      print('Nenhum usuário cadastrado!');

    else {
      for (var usuario in usuarios) {
        print('Nome: ${usuario['nome']}\n'
            'Idade: ${usuario['idade']}\n'
            'Email: ${usuario['email']}\n');
      }
    }
  }
}