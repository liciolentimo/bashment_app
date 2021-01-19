import 'package:bashment_app/constants.dart';
import 'package:bashment_app/screens/login_page.dart';
import 'package:bashment_app/widgets/custom_btn.dart';
import 'package:bashment_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24.0,
                ),
                child: Text("Register an account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Name",
                  ),
                  CustomInput(
                    hintText: "Email",
                  ),
                  CustomInput(
                    hintText: "Password",
                  ),
                  CustomBtn(
                    text: "Register",
                    onPressed: (){
                      print("Clicked Login");
                    },
                    outlineBtn: false,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0
                ),
                child: CustomBtn(
                  text: "Login",
                  onPressed: (){
                    Navigator.pop(context);

                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
