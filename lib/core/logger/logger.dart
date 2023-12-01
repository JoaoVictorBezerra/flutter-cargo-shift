import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Classe de configuração do `logger`
///
/// É possível definir propriedades como `color`, `emoji` e o `level`
///
/// [Level] define a partir do [FlavorConfig] o que deve ser mostrado no console
///
/// `level.warning` => esconde todos os levels acima (verbose, debug, info)
final logger = _CustomLogger();

class _CustomLogger extends Logger {
  _CustomLogger()
      : super(
          printer: _LogPrinter(),
          level: _LogPrinter().level,
        );
}

class _LogPrinter extends LogPrinter {
  static final _LogPrinter _logPrinter = _LogPrinter._();

  _LogPrinter._();

  factory _LogPrinter() {
    return _logPrinter;
  }

  @override
  List<String> log(LogEvent event) {
    AnsiColor color;

    String emoji;

    String message = event.message;

    switch (event.level) {
      case Level.error:
        var splitedMessage = message.split('||');

        if (splitedMessage.isNotEmpty && splitedMessage.length > 1) {
          color = PrettyPrinter.defaultLevelColors[event.level]!;
          emoji = PrettyPrinter.defaultLevelEmojis[event.level]!;

          var resultErrorList = [
            color('=' * splitedMessage.first.length),
            color('$emoji ${splitedMessage.first.trim()}'),
            color('$emoji ${splitedMessage[1].trim()}'),
            color('$emoji ${splitedMessage[2].trim()}'),
            color('=' * splitedMessage.first.length),
          ];

          if (message.contains('unknownFailure')) {
            return resultErrorList;
          }

          resultErrorList
            ..removeLast()
            ..addAll([
              color('$emoji ${splitedMessage[3].trim()}'),
              color('$emoji ${splitedMessage[4].trim()}'),
              color('$emoji ${splitedMessage.last.trim()}'),
              color('=' * splitedMessage.first.length),
            ]);

          return resultErrorList;
        } else {
          return [''];
        }

      default:
        color = PrettyPrinter.defaultLevelColors[Level.warning]!;
        emoji = PrettyPrinter.defaultLevelEmojis[event.level]!;
    }

    return [
      color('==' * message.length),
      color('$emoji $message'),
      color('==' * message.length)
    ];
  }

  Level? get level {
    bool isDevMode;

    if (kDebugMode) {
      isDevMode = true;
    } else {
      isDevMode = false;
    }

    if (isDevMode) {
      return Level.debug;
    } else {
      return Level.error;
    }
  }
}
