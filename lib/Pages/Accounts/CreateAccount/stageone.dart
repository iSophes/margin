import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:margin/Pages/Accounts/CreateAccount/stagetwo.dart';
import 'package:margin/Utilities/logging.dart';
import 'package:margin/Utilities/Themes/theme_provider.dart';
import 'package:provider/provider.dart';

class CreateAccountPageOne extends StatefulWidget {
  const CreateAccountPageOne({super.key});

  @override
  State<StatefulWidget> createState() => _CreateAccountStageOneState();
}

class _CreateAccountStageOneState extends State<CreateAccountPageOne> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  DateTime _selectedDOB = DateTime.now(); 

  bool hasSelectedDOB = true;
  bool validEmail = true;
  bool validPassword = true;

  Future<void> selectDOB() async {
    final newDate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime.now(), initialDate: DateTime.now());

    if (newDate == null) {
      setState(() {
        hasSelectedDOB = false;
      });

      return;
    }

    if (newDate != _selectedDOB) {
      hasSelectedDOB = false;

      setState(() {
        _selectedDOB = newDate;
      });
    }
  }

  Future<dynamic> transferToNextStage() {
    // regex check

    setState(() {
      validEmail = true;
      validPassword = true;
    });

    debugLog(DateTime.now().difference(_selectedDOB).inDays.toString());

    if (DateTime.now().difference(_selectedDOB).inDays < 4745) {
      return Navigator.of(context).pushNamed('/underaged'); 
    }

    RegExp emailExpression = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    
    if (!emailExpression.hasMatch(_emailController.text)) {
      // we fail
      setState(() {
        validEmail = false;
      });
      return Future.value();
    }
    if (_passwordController.text.length < 8) {
      // we fail
      setState(() {validPassword = false;});
      return Future.value();
    }

    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => CreateAccountPageTwo(email: _emailController.text, password: _passwordController.text,)), (r) => false);
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(child: Text("Hey There!", style: TextStyle(fontFamily: "Rubik", fontWeight: FontWeight(700), fontSize: 30, color: context.read<ThemeProvider>().isLightMode ? Color(0xFF555555) : Colors.white))),
          SizedBox(height: 5,),
          Center(child: Text("Let's get you started.", style: TextStyle(fontFamily: "Rubik", fontSize: 18, color: context.read<ThemeProvider>().isLightMode ? Color(0xFF555555) : Colors.white))),
          SizedBox(height: 10,),
          if (!validEmail) 
            Text("Your email isn't a valid email address!", style: TextStyle(color: Colors.red, fontSize: 12)),
            SizedBox(height:10),
          SizedBox(width: 300, child: TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "Email", 
              prefixIcon: Icon(CupertinoIcons.envelope),
              prefixIconColor: WidgetStateColor.fromMap(
                <WidgetStatesConstraint, Color>{
                  WidgetState.any: Colors.grey,
                  WidgetState.focused: Colors.deepPurple,
                },
              ),
              filled: true,
              fillColor: context.read<ThemeProvider>().isLightMode ? Colors.white : Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
            ), 
          )),
          if (!validPassword) 
            Text("Your password needs to be 8 characters or longer!", style: TextStyle(color: Colors.red, fontSize: 12)),
            SizedBox(height:10),
          // Password Input
          SizedBox(width: 300, child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password", 
              prefixIcon: Icon(CupertinoIcons.asterisk_circle),
              prefixIconColor: WidgetStateColor.fromMap(
                <WidgetStatesConstraint, Color>{
                  WidgetState.any: Colors.grey,
                  WidgetState.focused: Colors.deepPurple,
                },
              ),
              filled: true,
              fillColor: context.read<ThemeProvider>().isLightMode ? Colors.white : Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
            ), 
          )),
          SizedBox(height: 20,),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Birthday: ${_selectedDOB.day}/${_selectedDOB.month}/${_selectedDOB.year}"),
              SizedBox(width: 30,),
              ElevatedButton.icon(
              onPressed: selectDOB, 
              icon: const Icon(CupertinoIcons.calendar),
              label: const Text("Select"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, 
                foregroundColor: Colors.white, 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                shadowColor: Color(0xFFAAAAAA),
                side: BorderSide(color: Colors.deepPurple.shade900),
                minimumSize: Size(100, 50),  
                
              )),           
            ],
          )),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: transferToNextStage, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple, 
              foregroundColor: Colors.white, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shadowColor: Color(0xFFAAAAAA),
              side: BorderSide(color: Colors.deepPurple.shade900),
              minimumSize: Size(250, 50),  
            ), 
            child: Text('Next')),
          
          Spacer()
        ]
      ),
    );
  }
}
