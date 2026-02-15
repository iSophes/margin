import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:margin/Utilities/Themes/ThemeProvider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final String? nextRoute;
  const MainPage({super.key, this.nextRoute});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String title = "Home";
  int _selectedIndex = 1;

  void updateSelectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [
              context.read<ThemeProvider>().isLightMode ? Colors.white : Colors.black, 
              context.read<ThemeProvider>().isLightMode ? Colors.white : Colors.black, 
              context.read<ThemeProvider>().isLightMode ? Color.fromARGB(100, 204, 204, 204) : const Color.fromARGB(255, 26, 26, 26)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.95, 1]
              )
            ),
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            child: Text(title, textAlign: TextAlign.center,
              style: TextStyle(
                color: context.read<ThemeProvider>().isLightMode ? Colors.black : Colors.white,
                fontFamily: 'Rubik',
                fontSize: 24,
                fontWeight: FontWeight.w700
              )
            )
          )
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: context.read<ThemeProvider>().isLightMode ? Colors.white : Colors.black, unselectedItemColor: context.read<ThemeProvider>().isLightMode ? Colors.black : Colors.white, unselectedLabelStyle: TextStyle(color: context.read<ThemeProvider>().isLightMode ? Colors.black : Colors.white),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, onTap: updateSelectedPage, items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.plus), label: "Create"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: "My Library"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "Profile"),
        ],
      ),
    );
  }
}
