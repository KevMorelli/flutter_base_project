import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

class ErrorHandlerService {
  void setHandler(Widget rootWidget) {
    CatcherOptions debugOptions = CatcherOptions(SilentReportMode(), [ConsoleHandler()]);

    CatcherOptions releaseOptions = CatcherOptions(
      SilentReportMode(),
      [
        SentryHandler(
          SentryClient(
            SentryOptions(dsn: 'https://e690a2d00bd64f9db9b09affab40d119@o1115503.ingest.sentry.io/6147554'),
          ),
        ),
      ],
    );

    Catcher(rootWidget: rootWidget, debugConfig: debugOptions, releaseConfig: releaseOptions);
  }

  void reportError(Object error, StackTrace stackTrace) {
    Catcher.reportCheckedError(error, stackTrace);
  }
}
