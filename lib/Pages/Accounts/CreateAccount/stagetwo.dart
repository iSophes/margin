import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:margin/Utilities/Themes/theme_provider.dart';
import 'package:provider/provider.dart';

class CreateAccountPageTwo extends StatefulWidget {
  final String? email;
  final String? password;
  const CreateAccountPageTwo({super.key, this.email, this.password});

  @override
  State<StatefulWidget> createState() => _CreateAccountStageTwoState();
}

class _CreateAccountStageTwoState extends State<CreateAccountPageTwo> {
  final TextEditingController _usernameController = TextEditingController();
  bool hasAgreedToConditions = false;
  bool hasAgreedToPrivacyPolicy = false;

  Future<void> createAccount() async {

  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(child: Text("Please create yourself a username", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Rubik", fontWeight: FontWeight(700), fontSize: 30, color: context.read<ThemeProvider>().isLightMode ? Color(0xFF555555) : Colors.white))),
          SizedBox(height: 20,),
          SizedBox(width: 300, child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Username", 
              prefixIcon: Icon(CupertinoIcons.person),
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: hasAgreedToConditions, onChanged: (bool? value) {
                setState(() {
                  if (value != null) {hasAgreedToConditions = !hasAgreedToConditions;}
                });
              }),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "I agree to Margin's ", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface
                    )
                  ),
                  TextSpan(
                    text: "Terms of use", 
                    style: TextStyle(
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed(
                          "/terms",
                        );
                      },
                  )
                ]
              )),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: hasAgreedToPrivacyPolicy, onChanged: (bool? value) {
                setState(() {
                  if (value != null) {hasAgreedToPrivacyPolicy = !hasAgreedToPrivacyPolicy;}
                });
              }),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "I agree to Margin's ", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface
                    )
                  ),
                  TextSpan(
                    text: "Privacy Policy", 
                    style: TextStyle(
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed(
                          "/privacy",
                        );
                      },
                  )
                ]
              )),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: createAccount, 
            style: ElevatedButton.styleFrom(
              backgroundColor: hasAgreedToConditions && hasAgreedToPrivacyPolicy ? Colors.deepPurple : Colors.grey, 
              foregroundColor: Colors.white, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shadowColor: Color(0xFFAAAAAA),
              side: BorderSide(color: hasAgreedToConditions && hasAgreedToPrivacyPolicy ? Colors.deepPurple.shade900 : Colors.grey.shade700),
              minimumSize: Size(250, 50),  
            ), 
            child: Text('Create Account')),
          
          Spacer()
        ]
      ),
    );
  }
}
