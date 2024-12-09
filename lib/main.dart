import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:libary_management/src/app.dart';
import 'package:libary_management/service_locator.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await dotenv.load(fileName: ".env");
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://df25b8a491479a59e583789975b14b14@o4508424174895104.ingest.de.sentry.io/4508424301314128';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const LibaryManagementApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}
