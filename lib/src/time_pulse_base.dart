class TimePulse {
  /// Times a function.
  ///
  /// `f` is the function to be timed. `times` is the number of times the function is executed.
  /// The result is printed to the console.
  time(Function f, [int times = 1000000]) {
    final sw = Stopwatch();
    sw.start();
    _executeFunction(f, times);
    sw.stop();
    print("Time taken: ${sw.elapsedMilliseconds}ms for $times iterations");
    print("Average time taken: ${sw.elapsedMilliseconds / times}ms");
  }

  /// Compares two functions.
  ///
  /// `f1` and `f2` are the functions to be compared. `times` is the number of times the functions are executed.
  /// The result is printed to the console.
  compare(Function f1, Function f2, [int times = 1000000]) {
    final sw = Stopwatch();
    sw.start();
    _executeFunction(f1, times);
    sw.stop();
    final time1 = sw.elapsedMilliseconds;

    sw.reset();
    sw.start();
    _executeFunction(f2, times);
    sw.stop();
    final time2 = sw.elapsedMilliseconds;

    print("Time taken: $time1 ms for $times iterations");
    print("Time taken: $time2 ms for $times iterations");
    if (time1 > time2) {
      print(
          "Function 2 is faster by ${time1 - time2} ms (${((1 - (time2 / time1)) * 100 * 100).round() / 100}% faster)");
    } else if (time1 < time2) {
      print(
          "Function 1 is faster by ${time2 - time1} ms (${((1 - (time2 / time1)) * 100 * 100).round() / 100}% faster)");
    } else {
      print("Both functions take the same time");
    }
  }

  /// Compares multiple functions.
  ///
  /// `functions` is a list of functions to be compared. `times` is the number of times the functions are executed.
  /// The fastest function is printed to the console.
  /// If `printTimes` is true, the execution times of all functions are printed to the console.
  /// If `printDifferences` is true, the differences between the fastest function and all other functions are printed to the console.
  compareMultiple(List<Function> functions,
      {int times = 1000000,
      bool printTimes = false,
      bool printDifferences = false}) {
    final sw = Stopwatch();
    final timesList = List<int>.empty(growable: true);

    for (var i = 0; i < functions.length; i++) {
      sw.reset();
      sw.start();
      _executeFunction(functions[i], times);
      sw.stop();
      timesList.add(sw.elapsedMilliseconds);
    }

    final min = timesList.reduce((curr, next) => curr < next ? curr : next);
    final max = timesList.reduce((curr, next) => curr > next ? curr : next);
    final minIndex = timesList.indexOf(min);
    final maxIndex = timesList.indexOf(max);

    if (minIndex == maxIndex) {
      print("All functions take the same time");
    } else {
      print("Function ${minIndex + 1} is fastest - $min ms");

      if (printDifferences) {
        print("\nFunction comparison:");
        for (var i = 0; i < timesList.length; i++) {
          if (i != minIndex) {
            print("Function ${i + 1} is slower by ${timesList[i] - min} ms");
          }
        }
      }
      if (printTimes) {
        print("\nFunction execution times:");
        for (var i = 0; i < timesList.length; i++) {
          print(
              "Function $i: Time taken: ${timesList[i]} ms for $times iterations");
        }
      }
    }
  }

  /// Checks if function `a` is faster than function `b`.
  ///
  /// Returns true if `a` is faster than `b`. Returns false otherwise.
  /// `times` is the number of times the functions are executed.
  isFaster(Function a, Function b, [int times = 1000000]) {
    final sw = Stopwatch();
    sw.start();
    _executeFunction(a, times);
    sw.stop();
    final time1 = sw.elapsedMilliseconds;

    sw.reset();
    sw.start();
    _executeFunction(b, times);
    sw.stop();
    final time2 = sw.elapsedMilliseconds;

    if (time1 < time2) {
      return true;
    } else {
      return false;
    }
  }

  _executeFunction(Function f, int times) {
    for (var i = 0; i < times; i++) {
      f();
    }
  }
}
