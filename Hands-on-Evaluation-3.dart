import 'dart:io';
import 'dart:math';

class MathUtils {
  static double squareRoot(double number) {
    return number >= 0 ? sqrt(number) : double.nan;
  }

  static int factorial(int n) {
    if (n < 0) {
      return -1;
    }
    return n == 0 ? 1 : n * factorial(n - 1);
  }

  static double power(double base, int exponent) {
    return pow(base, exponent).toDouble();
  }

  static double add(double a, double b) => a + b;

  static double subtract(double a, double b) => a - b;

  static double multiply(double a, double b) => a * b;

  static double divide(double a, double b) {
    if (b != 0) {
      return a / b;
    } else {
      print('Error: Division by zero');
      return double.nan;
    }
  }
}

void main() {
  Map<int, Function> operations = {
    1: () => operateUnary(MathUtils.squareRoot),
    2: () => operateUnary((n) => MathUtils.factorial(n.toInt()).toDouble()),
    3: () => operateBinary(MathUtils.power),
    4: () => operateBinary(MathUtils.add),
    5: () => operateBinary(MathUtils.subtract),
    6: () => operateBinary(MathUtils.multiply),
    7: () => operateBinary(MathUtils.divide),
    8: () => exitProgram(),
  };

  while (true) {
    print('\n=== Menu ===');
    print('1. Square Root');
    print('2. Factorial');
    print('3. Power');
    print('4. Addition');
    print('5. Subtraction');
    print('6. Multiplication');
    print('7. Division');
    print('8. Exit');
    print('=============');

    int choice = getUserChoice();

    if (operations.containsKey(choice)) {
      operations[choice]!();
    } else {
      print('Invalid choice');
    }
  }
}

void operateUnary(Function operation) {
  double num1 = getUserNumber('Enter the number:');
  double result = operation(num1);
  print('Result: $result');
}

void operateBinary(Function operation) {
  double num1 = getUserNumber('Enter the first number:');
  double num2 = getUserNumber('Enter the second number:');
  double result = operation(num1, num2);
  print('Result: $result');
}

void exitProgram() {
  print('Exiting the program. Goodbye!');
  exit(0);
}

int getUserChoice() {
  while (true) {
    try {
      print('\nEnter your choice:');
      return int.parse(stdin.readLineSync()!);
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }
}

double getUserNumber(String prompt) {
  while (true) {
    try {
      print(prompt);
      return double.parse(stdin.readLineSync()!);
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }
}
