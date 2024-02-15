import 'package:flutter/material.dart';
import 'package:myapp3/auth/sign_up.dart';

import '../constants.dart';

class SignInScreen extends StatefulWidget {
  

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack( children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPading),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Row(children: [
                      Text("Do Not have an Account? "),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUPScreen())),
                          child: Text("Sign Up!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )))
                    ]),
                    SizedBox(height: defaultPading * 2),
                    SignInForm(formKey:_formKey ),
                    SizedBox(height: defaultPading * 2),
                    Center(
                        child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "sign In",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ))
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class SignInForm extends StatelessWidget {
  SignInForm({
    super.key,
    required this.formKey,
  });
  final GlobalKey formKey;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextForm(text: "Email"),
        TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "@gmail.com")),
        SizedBox(
          height: defaultPading,
        ),
        TextForm(text: "Password"),
        TextFormField(
            obscureText: true,
            decoration: InputDecoration(hintText: "********")),
        SizedBox(
          height: defaultPading,
        ),
      ]),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.text,
  });

  @override
  final String text;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPading / 3),
      child: Text(text,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
    );
  }
}
