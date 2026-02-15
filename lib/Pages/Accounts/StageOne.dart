import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:margin/Utilities/Themes/ThemeProvider.dart';
import 'package:provider/provider.dart';

class StageOneAccounts extends StatefulWidget {
  const StageOneAccounts({super.key});

  @override
  State<StatefulWidget> createState() => _AccountsStageOneState();
}

class _AccountsStageOneState extends State<StageOneAccounts> {
  void TransferToSignUp() {
    return;
  }

  void TransferToLogIn() {

  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SvgPicture.asset("assets/images/Logo-GlassTransparent.svg", width: 128, height: 128,),
          SizedBox(height: 10),
          Center(child: SvgPicture.asset("assets/images/margin-wordmark.svg", width: 210, height: 100),),
          Spacer(),
          ElevatedButton(
            onPressed: TransferToLogIn, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple, 
              foregroundColor: Colors.white, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shadowColor: Color(0xFFAAAAAA),
              side: BorderSide(color: Colors.deepPurple.shade900),
              minimumSize: Size(250, 50),  
            ), 
            child: Text('Log In')),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: TransferToSignUp, 
            style: ElevatedButton.styleFrom(
              backgroundColor: context.read<ThemeProvider>().isLightMode ? Colors.white : Colors.black, 
              foregroundColor: context.read<ThemeProvider>().isLightMode ? Colors.deepPurple : Colors.deepPurple.shade300, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shadowColor: Color(0xFFAAAAAA),
              side: BorderSide(color: context.read<ThemeProvider>().isLightMode ? Color(0xFFCCCCCC) : Color(0xFF444444), width: 1.5),
              minimumSize: Size(250, 50),  
            ), 
            child: Text('Create an account!')),
          SizedBox(height: 20,),
          Text("Margin v0.0.1 | iSophes 2026"),
          SizedBox(height: 10)
        ]
      ),
    );
  }
}
