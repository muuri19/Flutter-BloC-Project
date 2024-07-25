import 'package:logger/logger.dart';

class LoggerGlobal {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true, 
      printEmojis: true, 
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );
}
