import 'package:flutter/material.dart';
import 'package:myapp3/auth/sign_up.dart';
import 'package:myapp3/constants.dart';

import '../auth/sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPading),
        child: Column(
          children: [
            Spacer(),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (cxt) => SignUPScreen())),
                  style:
                      TextButton.styleFrom(backgroundColor: primaryColor),
                  child: Text("sign up")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPading),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen())),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: primaryColor)),
                        elevation: 0,
                        backgroundColor: Colors.white),
                    child: Text("sign in", style: TextStyle(color: primaryColor))),
              ),
            ),
            const SizedBox(height: defaultPading)
          ],
        ),
      )),
    ]));
  }
}
