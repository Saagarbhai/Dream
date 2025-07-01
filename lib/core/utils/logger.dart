import 'package:flutter/widgets.dart';

class Logger {
  static LogMode _logMode = LogMode.debug; // Default log mode is debug

  // ANSI color codes
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';

  // Method to initialize logger with a specific mode
  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  // Method for logging success messages
  static void success(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      if (stackTrace == null) {
        debugPrint("$_green✓ SUCCESS: $data$_reset");
      } else {
        debugPrint("$_green✓ SUCCESS: $data$_reset\n$stackTrace");
      }
    }
  }

  // Method for logging error messages
  static void error(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      if (stackTrace == null) {
        debugPrint("$_red✗ ERROR: $data$_reset");
      } else {
        debugPrint("$_red✗ ERROR: $data$_reset\n$stackTrace");
      }
    }
  }

  // Method for logging warning messages
  static void warning(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      if (stackTrace == null) {
        debugPrint("$_yellow⚠ WARNING: $data$_reset");
      } else {
        debugPrint("$_yellow⚠ WARNING: $data$_reset\n$stackTrace");
      }
    }
  }

  // Method for logging info messages
  static void info(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      if (stackTrace == null) {
        debugPrint("$_blueℹ INFO: $data$_reset");
      } else {
        debugPrint("$_blueℹ INFO: $data$_reset\n$stackTrace");
      }
    }
  }

  // Legacy method for backward compatibility
  static void lOG(dynamic data, {StackTrace? stackTrace}) {
    info(data, stackTrace: stackTrace);
  }
}

// Enum to define logging modes
enum LogMode { debug, live }
