import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:libary_management/src/app.dart';
import 'package:libary_management/service_locator.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  
  //.env file is loaded the first time you access a variable
  await dotenv.load(fileName: ".env");

  setupServiceLocator();

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://df25b8a491479a59e583789975b14b14@o4508424174895104.ingest.de.sentry.io/4508424301314128';

      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const LibaryManagementApp()),
  );

}
