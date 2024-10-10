import 'package:flutter/material.dart';
import 'package:stanch_flutter_task/common/custom_button.dart';
import 'package:stanch_flutter_task/common/custom_icon.dart';
import 'package:stanch_flutter_task/common/custom_snackbar.dart';
import 'package:stanch_flutter_task/common/custom_text.dart';
import 'package:stanch_flutter_task/common/custom_textfield.dart';
import 'package:stanch_flutter_task/views/main_screen.dart';
import 'package:stanch_flutter_task/views/meetup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();

  void onTapSubmit() {
    String email = emailCon.text;
    String password = passCon.text;
    if (email.isEmpty) {
      customSnackBar(
          context: context, message: "Please Enter Your Email", isError: true);
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      customSnackBar(
          context: context, message: "Please Enter valid Email", isError: true);
    } else if (password.isEmpty) {
      customSnackBar(
          context: context,
          message: "Please Enter Your Password",
          isError: true);
    } else if (password.length < 8) {
      customSnackBar(
          context: context,
          message: "Password Must Have 8 Character",
          isError: true);
    } else if (email != "test@stanch.io") {
      customSnackBar(
          context: context,
          message: "Please Enter Correct email",
          isError: true);
    } else if (password != "Test@123") {
      customSnackBar(
          context: context, message: "Incorrect password", isError: true);
    } else {
      customSnackBar(context: context, message: "Login Successful");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MainScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Promila",
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "Hi, Welcome Back!",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),
              const CustomText(text: "Please Sign in to continue"),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                controller: emailCon,
                hintText: "Enter Email or Mobile Number",
              ),
              const SizedBox(
                height: 6,
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "Sign In With OTP",
                    color: Colors.blue,
                  )),
              const CustomText(text: "Password"),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                controller: passCon,
                hintText: "Enter Password",
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const CustomText(text: "Remember Me"),
                  const Spacer(),
                  const CustomText(
                    text: "Forget Password",
                    color: Colors.blue,
                  ),
                ],
              ),
              CustomButton(
                text: 'Submit',
                onTap: () => onTapSubmit(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(alignment: Alignment.center, child: CustomText(text: "or")),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIcon(
                    icon: 'asset/google_icon.png',
                    height: 30,
                    width: 30,
                  ),
                  CustomIcon(
                      icon: 'asset/linked_in_icon.png', height: 30, width: 30),
                  CustomIcon(
                      icon: 'asset/facebook_icon.png', height: 30, width: 30),
                  CustomIcon(
                      icon: 'asset/instagram_icon.png', height: 48, width: 48),
                  CustomIcon(
                      icon: 'asset/whatsapp_icon.png', height: 48, width: 48)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  CustomText(text: "Business User?"),
                  Spacer(),
                  CustomText(text: "Don't have an account"),
                ],
              ),
              const Row(
                children: [
                  CustomText(
                    text: "Login Here",
                    color: Colors.blue,
                  ),
                  Spacer(),
                  CustomText(
                    text: "Sign Up",
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "By Continuing, you agree to",
                    color: Colors.grey,
                  )),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomText(
                  text: "Promilo's",
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 4,
                ),
                CustomText(text: "Terms of Use & Privacy Policy"),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
