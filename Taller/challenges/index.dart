import 'dart:io';
import 'dart:math';

String readLine() => stdin.readLineSync()?.trim() ?? '';
int readInt() => int.parse(readLine());
double readDouble() => double.parse(readLine());

String formatNumber(num value) {
  if (value == value.roundToDouble()) {
    return value.round().toString();
  }

  String text = value.toString();
  if (text.contains('.')) {
    text = text.replaceFirst(RegExp(r'0+$'), '');
    text = text.replaceFirst(RegExp(r'\.$'), '');
  }
  return text;
}

int gcd(int a, int b) => b == 0 ? a.abs() : gcd(b, a % b);

String simplifyFraction(int numerator, int denominator) {
  if (denominator == 0) {
    throw Exception("El denominador no puede ser cero.");
  }

  if (numerator == 0) {
    return "0";
  }

  final int divisor = gcd(numerator, denominator);
  int n = numerator ~/ divisor;
  int d = denominator ~/ divisor;

  if (d < 0) {
    n = -n;
    d = -d;
  }

  return d == 1 ? '$n' : '$n/$d';
}

/// 1. Positive Power
/// Solicita al usuario un número y eleva este número al cuadrado solo si es positivo.
class Challenge1 {
  void run() {
    print("Ingrese un número:");
    final int num = readInt();

    if (num > 0) {
      print("Resultado: ${num * num}");
    } else if (num < 0) {
      print("Resultado: Número negativo.");
    } else {
      print("Resultado: 0");
    }
  }
}

/// 2. Double or Triple
/// Solicita al usuario dos números. Si el primero es mayor, devuelva su doble,
/// de lo contrario devuelva el triple del segundo.
class Challenge2 {
  void run() {
    print("Ingrese el primer número:");
    final int num1 = readInt();

    print("Ingrese el segundo número:");
    final int num2 = readInt();

    final int result = num1 >= num2 ? num1 * 2 : num2 * 3;
    print("Resultado: $result");
  }
}

/// 3. Root or Square
/// Pide al usuario un número. Si es positivo, devuelve su raíz cuadrada,
/// de lo contrario, devuelve su cuadrado.
class Challenge3 {
  void run() {
    print("Ingrese un número:");
    final double num = readDouble();

    if (num > 0) {
      print("Resultado: ${formatNumber(sqrt(num))}");
    } else {
      print("Resultado: ${formatNumber(num * num)}");
    }
  }
}

/// 4. Circle Perimeter
/// Pide al usuario el radio de un círculo y calcula su perímetro.
class Challenge4 {
  void run() {
    print("Ingrese el radio del círculo:");
    final double radio = readDouble();
    final double perimetro = 2 * pi * radio;
    print("Resultado: ${perimetro.toStringAsFixed(2)}");
  }
}

/// 5. Midweek Day
/// Solicita al usuario un número entre 1 y 7 y muestra el día de la semana
/// correspondiente, pero solo considerando los días laborables.
class Challenge5 {
  void run() {
    const diasLaborales = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"];

    print("Ingrese un número entre 1 y 7:");
    final int dia = readInt();

    if (dia >= 1 && dia <= 5) {
      print("Resultado: ${diasLaborales[dia - 1]}");
    } else {
      print("Resultado: Número fuera del rango laboral.");
    }
  }
}

/// 6. Tax Calculator
/// Solicita al usuario su salario anual y, si este excede los 12000,
/// muestra el impuesto a pagar que es el 15% del excedente.
class Challenge6 {
  void run() {
    print("Ingrese su salario anual:");
    final double salario = readDouble();

    if (salario > 12000) {
      final double impuesto = (salario - 12000) * 0.15;
      print("Resultado: ${formatNumber(impuesto)}");
    } else {
      print("Resultado: No debe impuestos.");
    }
  }
}

/// 7. Remainder Finder
/// Solicita dos números y muestra el residuo de la división del primero entre el segundo.
class Challenge7 {
  void run() {
    try {
      print("Ingrese el primer número:");
      final int num1 = readInt();

      print("Ingrese el segundo número:");
      final int num2 = readInt();

      print("Resultado: ${num1 % num2}");
    } catch (e) {
      print("Error: $e");
    }
  }
}

/// 8. Sum of Evens
/// Calcula y muestra la suma de los números pares entre 1 y 50.
class Challenge8 {
  void run() {
    int suma = 0;

    for (int i = 2; i <= 50; i += 2) {
      suma += i;
    }

    print("Resultado: $suma");
  }
}

class Fraccion {
  final int numerador;
  final int denominador;

  Fraccion(this.numerador, this.denominador) {
    if (denominador == 0) {
      throw Exception("El denominador no puede ser cero.");
    }
  }

  Fraccion restar(Fraccion otra) {
    final int nuevoNumerador =
        numerador * otra.denominador - otra.numerador * denominador;
    final int nuevoDenominador = denominador * otra.denominador;
    return Fraccion(nuevoNumerador, nuevoDenominador);
  }

  String simplificado() => simplifyFraction(numerador, denominador);
}

/// 9. Fraction Difference
/// Solicita al usuario los valores para dos fracciones y muestra la diferencia
/// entre esas fracciones.
class Challenge9 {
  void run() {
    try {
      print("Ingrese numerador de la primera fracción:");
      final int num1 = readInt();

      print("Ingrese denominador de la primera fracción:");
      final int den1 = readInt();

      print("Ingrese numerador de la segunda fracción:");
      final int num2 = readInt();

      print("Ingrese denominador de la segunda fracción:");
      final int den2 = readInt();

      final Fraccion f1 = Fraccion(num1, den1);
      final Fraccion f2 = Fraccion(num2, den2);
      final Fraccion resultado = f1.restar(f2);

      print("Resultado: ${resultado.simplificado()}");
    } catch (e) {
      print("Error: $e");
    }
  }
}

/// 10. String Length
/// Pide una palabra al usuario y muestra la longitud de esa palabra.
class Challenge10 {
  void run() {
    print("Ingrese una palabra:");
    final String palabra = readLine();
    print("Resultado: ${palabra.length}");
  }
}

/// 11. Average of Four
/// Pide al usuario cuatro números y muestra el promedio.
class Challenge11 {
  void run() {
    print("Ingrese el primer número:");
    final double n1 = readDouble();

    print("Ingrese el segundo número:");
    final double n2 = readDouble();

    print("Ingrese el tercer número:");
    final double n3 = readDouble();

    print("Ingrese el cuarto número:");
    final double n4 = readDouble();

    final double promedio = (n1 + n2 + n3 + n4) / 4;
    print("Resultado: ${formatNumber(promedio)}");
  }
}

/// 12. Smallest of Five
/// Pide al usuario cinco números y muestra el más pequeño.
class Challenge12 {
  void run() {
    final List<int> numeros = [];

    for (int i = 0; i < 5; i++) {
      print("Ingrese el número ${i + 1}:");
      numeros.add(readInt());
    }

    print("Resultado: ${numeros.reduce(min)}");
  }
}

/// 13. Vowel Counter
/// Pide una palabra al usuario y devuelve el número de vocales en esa palabra.
class Challenge13 {
  void run() {
    print("Ingrese una palabra:");
    final String palabra = readLine().toLowerCase();
    const String vocales = 'aeiouáéíóú';
    final int total = palabra
        .split('')
        .where((c) => vocales.contains(c))
        .length;

    print("Resultado: $total");
  }
}

/// 14. Factorial Finder
/// Pide un número al usuario y devuelve el factorial de ese número.
class Challenge14 {
  void run() {
    print("Ingrese un número:");
    final int n = readInt();

    if (n < 0) {
      print("Resultado: No definido");
      return;
    }

    int factorial = 1;
    for (int i = 2; i <= n; i++) {
      factorial *= i;
    }

    print("Resultado: $factorial");
  }
}

/// 15. InRange Validator
/// Pide un número al usuario y verifica si está en el rango de 10 a 20
/// (ambos incluidos).
class Challenge15 {
  void run() {
    print("Ingrese un número:");
    final int n = readInt();

    if (n >= 10 && n <= 20) {
      print("Resultado: Está en el rango.");
    } else {
      print("Resultado: Fuera del rango.");
    }
  }
}
