class Calculator {
  // send 2 positive numbers -> DONE IN UNIT TEST
  // send 1 negative number and 1 positive number
  // 2 negative numbers
  // number and zero -> same number
  // zero and zero -> zero
  int add(int a, int b) {
    return a + b;
  }

  //
  //
  //
  int subtract(int a, int b) {
    return a - b;
  }

  //
  //
  //
  int multiply(int a, int b) {
    return a * b;
  }

  //
  //
  //
  double divide(int a, int b) {
    if (b == 0) {
      throw Exception("Cannot divide by zero");
    }
    return a / b;
  }
}
