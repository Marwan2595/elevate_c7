import 'package:elevate_c7/features/unit_test/calculator.dart';
import 'package:test/test.dart';

void main() {
  //AAA
  //Arrange -> Define all variables and dependencies needed for the test
  //Act -> Call the function or method being tested, and save the result
  //Assert -> Verify that the result is correct

  late Calculator calculator;
  setUp(() {
    //This function is called before each test function is run
    print("<<<<<setUp>>>>>");
  });
  setUpAll(() {
    //This function is called once before all tests are run
    print("<<<<<setUpAll>>>>>");
    calculator = Calculator();
  });
  tearDown(() {
    //This function is called after each test is run
    print("<<<<<tearDown>>>>>");
  });
  tearDownAll(() {
    //This function is called once after all tests are run
    print("<<<<<tearDownAll>>>>>");
  });

  group("Add Function Tests", () {
    test("Test Add Function send 2 positive numbers", () {
      //Verify that the add function works correctly when adding two positive numbers
      //AAA
      //Arrange
      int a = 5;
      int b = 11;
      //Act
      int result = calculator.add(a, b);
      //Assert
      expect(result, isPositive);
      expect(result, isNonZero);
      expect(result, 16);
    });
    test("Test Add Function send 2 negative numbers", () {
      //Verify that the add function works correctly when adding two negative numbers
      //AAA
      //Arrange
      int a = -55;
      int b = -7;
      //Act
      int result = calculator.add(a, b);
      //Assert
      expect(result, isNegative);
      expect(result, -62);
    });
  });

  group("Multiply Function Tests", () {
    test("Test Multiply Function send 2 positive numbers", () {
      //Verify that the multiply function works correctly when multiplying two positive numbers
      //AAA
      //Arrange
      int a = 5;
      int b = 11;
      //Act
      int result = calculator.multiply(a, b);
      //Assert
      expect(result, isPositive);
      expect(result, isNonZero);
      expect(result, 55);
    });
  });
}
