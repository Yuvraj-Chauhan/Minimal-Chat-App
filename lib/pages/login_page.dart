// ignore_for_file: must_be_immutable

import "package:chat_app/auth/auth_service.dart";
import "package:chat_app/components/my_button.dart";
import "package:chat_app/components/my_textfield.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          emailcontroller.text, passwordcontroller.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 60,
            ),

            const SizedBox(height: 50),

            //welcome
            Text(
              "Welcome Back, you've been missed!",
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 10),

            //email
            MyTextfield(
              hintText: "Email",
              obsecureText: false,
              controller: emailcontroller,
            ),

            const SizedBox(height: 10),

            //password
            MyTextfield(
              hintText: "Password",
              obsecureText: true,
              controller: passwordcontroller,
            ),

            const SizedBox(height: 25),

            //login now
            MyButton(
              buttonText: "Login",
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
