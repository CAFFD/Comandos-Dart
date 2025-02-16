import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CadastroUsuario(),
  ));
}

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  String nome = '';
  int idade = 0;
  String email = '';
  List<Map<String, dynamic>> usuarios = [];

  void _cadastrarUsuario() {
    if (idade >= 18) {
      // Cria um mapa com os dados do usuário
      Map<String, dynamic> usuario = {
        'nome': nome,
        'idade': idade,
        'email': email,
      };

      // Adiciona o usuário à lista
      usuarios.add(usuario);

      // Exibe mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );

      // Limpa os campos
      setState(() {
        nome = '';
        idade = 0;
        email = '';
      });
    } else {
      // Exibe mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro não pode ser realizado. Idade inferior a 18 anos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              onChanged: (value) {
                nome = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                idade = int.tryParse(value) ?? 0; // Converte para inteiro ou 0
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                email = value;
              },
            ),
            ElevatedButton(
              onPressed: _cadastrarUsuario,
              child: Text('Cadastrar'),
            ),
            // Exibe a lista de usuários cadastrados
            if (usuarios.isNotEmpty)
              Column(
                children: [
                  Text('Usuários Cadastrados:', style: TextStyle(fontWeight: FontWeight.bold)),
                  for (var usuario in usuarios)
                    Text('Nome: ${usuario['nome']}, Idade: ${usuario['idade']}, Email: ${usuario['email']}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}