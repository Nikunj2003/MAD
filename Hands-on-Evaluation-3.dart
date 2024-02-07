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

  static double add(double a, double b) {
    return a + b;
  }

  static double subtract(double a, double b) {
    return a - b;
  }

  static double multiply(double a, double b) {
    return a * b;
  }

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

    print('Enter your choice:');
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 8) {
      print('Exiting the program. Goodbye!');
      break;
    }

    print('Enter the first number:');
    double num1 = double.parse(stdin.readLineSync()!);

    num result;

    switch (choice) {
      case 1:
        result = MathUtils.squareRoot(num1);
        print('Square root of $num1: $result');
        break;
      case 2:
        result = MathUtils.factorial(num1.toInt());
        print('Factorial of ${num1.toInt()}: $result');
        break;
      case 3:
        print('Enter the exponent:');
        int exponent = int.parse(stdin.readLineSync()!);
        result = MathUtils.power(num1, exponent);
        print('Result: $result');
        break;
      case 4:
        print('Enter the second number:');
        double num2 = double.parse(stdin.readLineSync()!);
        result = MathUtils.add(num1, num2);
        print('Result: $result');
        break;
      case 5:
        print('Enter the second number:');
        double num2 = double.parse(stdin.readLineSync()!);
        result = MathUtils.subtract(num1, num2);
        print('Result: $result');
        break;
      case 6:
        print('Enter the second number:');
        double num2 = double.parse(stdin.readLineSync()!);
        result = MathUtils.multiply(num1, num2);
        print('Result: $result');
        break;
      case 7:
        print('Enter the second number:');
        double num2 = double.parse(stdin.readLineSync()!);
        result = MathUtils.divide(num1, num2);
        print('Result: $result');
        break;
      default:
        print('Invalid choice');
    }
  }
}
