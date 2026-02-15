import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:margin/Pages/Accounts/StageOne.dart';
import 'package:margin/Pages/Main/MainView.dart';
import 'package:margin/Utilities/API.dart';
import 'package:margin/Utilities/Logging.dart';
import 'package:margin/Utilities/Themes/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  final String? nextRoute;
  const SplashPage({super.key, this.nextRoute});

  @override 
  State<SplashPage> createState() => _splashPageState();
}

class _splashPageState extends State<SplashPage> {
  String currentLoadingStageText = "";

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<bool> hasNetwork(String knownUrl) async {
    setState(() {
      currentLoadingStageText = "Checking internet access...";
    });
    if (kIsWeb) {
      return true; // Because without internet, we wouldnt be on the web!
    } else {
      return _hasNetworkMobile(knownUrl);
    }
  }

  Future<bool> _hasNetworkMobile(String knownUrl) async {
    try {
      final result = await InternetAddress.lookup(knownUrl);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {}
    return false;
  }

  _navigateToHome() async {
    if (!await hasNetwork("google.com")) {
      debugLog("No internet!!"); 
      // show a debug page
    }

    // add server issue page check here

    debugLog("API Init");
    currentLoadingStageText = "Connecting the wires";
    final api = context.read<BaseAPI>();
    await api.init();
    await api.loadUser();
    final status = api.status;

    setState(() {
      currentLoadingStageText = "Let's go!";
    });

    debugLog(status.name);

    if (status == AccountStatus.unauthenticated) {
      return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const StageOneAccounts()), (r) => false);
    }

    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => MainPage(
            nextRoute: widget.nextRoute,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 300),
          settings: const RouteSettings(name: "/home"),
        ),
        (route) => false,
      );
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<ThemeProvider>().isDarkMode
          ? const Color.fromARGB(255, 0,0,0)
          : Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 4),
            SvgPicture.asset('assets/images/Logo-GlassTransparent.svg', width: 130, height: 130,),
            const Spacer(flex: 3),
            Text(
              currentLoadingStageText,
              style: GoogleFonts.rubik(
                color: Colors.white,
              ),
            ),
            if (kDebugMode)
              Text(
                "Debug mode!",
                style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

}