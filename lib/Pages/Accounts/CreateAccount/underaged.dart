import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:margin/Utilities/Themes/theme_provider.dart';
import 'package:provider/provider.dart';

class UnderagedUserPage extends StatelessWidget {
  const UnderagedUserPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(child: Icon(CupertinoIcons.xmark, color: context.read<ThemeProvider>().isDarkMode ? Colors.white : Colors.red, size: 75,)),
          SizedBox(height: 20,),
          Center(child: Text("Unfortunately you're too young to use this app. Please come back when you're older.", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Rubik", fontSize: 20, color: context.read<ThemeProvider>().isDarkMode ? Colors.white : Color(0xFF555555), ))),
          Spacer()
        ]
      ),
    );
  }
}
