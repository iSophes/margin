import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:margin/Pages/Splash/Splash.dart';
import 'package:margin/Pages/Terms/terms.dart';
import 'package:margin/Utilities/API.dart';
import 'package:margin/Utilities/Logging.dart';
import 'package:margin/Utilities/Themes/DarkMode.dart';
import 'package:margin/Utilities/Themes/LightMode.dart';
import 'package:margin/Utilities/Themes/ThemeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  debugLog("Margin is starting!");

  final marginThemeProvider = ThemeProvider();
  marginThemeProvider.initTheme(); // why error!?? you are async'ed!

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => BaseAPI())),
        ChangeNotifierProvider.value(value: marginThemeProvider),
      ],
      child: BaseApp(
        globalKey: navigatorKey,
      ),
    ),
  );
}

class BaseApp extends StatelessWidget {
  final GlobalKey<NavigatorState>? globalKey;
  const BaseApp({super.key, this.globalKey});


@override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        title: 'Margin',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          colorScheme: lightColourScheme,
          fontFamily: 'Rubik',
          primaryTextTheme: GoogleFonts.rubikTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: Colors.white,
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.deepPurple,
            backgroundColor: Colors.grey[800],
            contentTextStyle: GoogleFonts.rubik(color: Colors.white),
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            insetPadding: const EdgeInsets.all(10),
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  Brightness.light, // makes icons light in Android
              statusBarBrightness: Brightness.dark, // makes icons light in iOS
            ),
          ),
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
          colorScheme: darkColourScheme,
          fontFamily: 'Rubik',
          primaryTextTheme: GoogleFonts.rubikTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: Colors.black,
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.deepPurple,
            backgroundColor: Colors.black,
            contentTextStyle: GoogleFonts.rubik(color: Colors.white),
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            insetPadding: const EdgeInsets.all(10),
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  Brightness.light, // makes icons light in Android
              statusBarBrightness: Brightness.dark, // makes icons light in iOS
            ),
          ),
        ),
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/splash': (BuildContext context) => const SplashPage(),
          '/terms': (BuildContext context) => const TermsOfUsePage(),
          // We can only add routes here that don't need data passing to them
        },
        navigatorKey: globalKey,
        themeMode: themeProvider.themeMode,
      );
    });
  }
}