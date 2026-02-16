import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:margin/Pages/Accounts/CreateAccount/stageTwo.dart';
import 'package:margin/Utilities/Themes/ThemeProvider.dart';
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
          Icon(CupertinoIcons.xmark, color: context.read<ThemeProvider>().isDarkMode ? Colors.white : Colors.red),
          SizedBox(height: 20,),
          Text("Unfortunately you're too young to use this app. Please come back when you're older."),
          Spacer()
        ]
      ),
    );
  }
}
