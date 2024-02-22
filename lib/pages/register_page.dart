import "package:chat_app/auth/auth_service.dart";
import "package:chat_app/components/my_button.dart";
import "package:chat_app/components/my_textfield.dart";
import "package:flutter/material.dart";

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //login method
  void register(BuildContext context) {
    final auth = AuthService();

    if (passwordcontroller.text == confirmpasswordcontroller.text) {
      try {
        auth.signUpWithEmailPassword(
            emailcontroller.text, passwordcontroller.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords don't match!"),
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
              "Let's create an account for you!",
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

            const SizedBox(height: 10),

            //password
            MyTextfield(
              hintText: "Confirm Password",
              obsecureText: true,
              controller: confirmpasswordcontroller,
            ),

            const SizedBox(height: 25),

            //login now
            MyButton(
              buttonText: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
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
