import 'package:time_pulse/time_pulse.dart';

void main() {
  // Create a TimePulse object
  final ta = TimePulse();

  // Time a function
  ta.time(function1, 1000000);
  ta.time(() => isPrime(1000000007));

  // Compare two functions
  ta.compare(function1, function2);

  // Compare multiple functions
  ta.compareMultiple([function1, function2, function3],
      printDifferences: true, printTimes: true);

  // Check if a function is faster than another
  print(ta.isFaster(function1, function2));
}

// Functions to be timed.
// The following three functions return a list of doubles from 1 to 5.
List<double> function1() {
  final list = List<double>.empty(growable: true);
  for (var i = 0; i < 5; i++) {
    list.add((i + 1).toDouble());
  }
  return list;
}

List<double> function2() => [1, 2, 3, 4, 5];

List<double> function3() {
  final list = List<double>.empty(growable: true);
  for (var i = 1; i < 6; i++) {
    list.add(i.toDouble());
  }
  return list;
}

// Function to check if a number is prime.
bool isPrime(int n) {
  if (n <= 1) return false;
  if (n <= 3) return true;
  if (n % 2 == 0 || n % 3 == 0) return false;
  var i = 5;
  while (i * i <= n) {
    if (n % i == 0 || n % (i + 2) == 0) return false;
    i += 6;
  }
  return true;
}
