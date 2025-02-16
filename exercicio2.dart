import 'dart:io';

double? calcular(double? num1, double? num2, String? operacao) {
  if (num1 == null || num2 == null || operacao == null)
    {
      print('Error: entrada Inválida');
      return null;
    }

  switch (operacao) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 != 0)
      {
        return num1 / num2;
      }
      else
      {
        print('Error: Divisão em zero!');
        return null;
      }
    default:
      print('Error: Operação Inválida!');
      return null;
  }
}

void main() {
  print('Digite o 1º número: ');
  String? num1String = stdin.readLineSync();
  double? num1 = double.tryParse(num1String ?? '');

  print('Digite o 2º número: ');
  String? num2String = stdin.readLineSync();
  double? num2 = double.tryParse(num2String ?? '');

  print('Digite a operação (+, -, *, /): ');
  String? operacao = stdin.readLineSync();

  double? result = calcular(num1, num2, operacao);
  // ativando função

  if (result != null)
    print('Resultado: ${result}');
}