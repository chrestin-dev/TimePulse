## time_pulse
A Dart package that aims to help with measuring and comparing function execution times, assisting in performance insights.

## Features

Utility functions to measure function execution times and compare them. Able to determine the fastest function and the difference in execution times compared to the other functions.

This package should help developers to determine which function to use.


## Usage

Simply import the package, create a TimePulse object and you are ready to use its functions.

```dart
final tp = TimePulse();
tp.time(() => isPrime(1000000007)); // e.g. 8088ms for 1000000 iterations

tp.compare(function1, function2); // e.g. Function 2 is faster by 24 ms (72.73% faster)
```
Longer examples can be found in the 'Example' tab.

## Limitations
- Execution times highly depend on the device the code is running on. This means that the execution times will be different on different devices. This package is not meant to be used to compare the execution times of functions on different devices.

## Additional information

Feel free to open an issue on the [GitHub repository](https://github.com/chrestin-dev/TimePulse.git) if you find any bugs or if you have any suggestions.

## License
MIT License
