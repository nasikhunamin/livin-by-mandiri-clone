import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livin_clone/navigation/livin_router.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';
import 'package:core/core.dart';
import 'providers/language_provider.dart';

class LivinApp extends ConsumerWidget {
  const LivinApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var language = ref.watch(getSelectedLanguageProvider);
    return MaterialApp.router(
      title: "Livin-Clone",
      debugShowCheckedModeBanner: kDebugMode,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(language),
      builder: (context, child) {
        ScreenUtil.init(context);
        return child ?? const SizedBox.shrink();
      },
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          colorSchemeSeed: Colors.blue,
          fontFamily: "Poppins"),
      routerConfig: livinRouter,
    );
  }
}

Future<void> startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  runApp(const ProviderScope(child: LivinApp()));
}
