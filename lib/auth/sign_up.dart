import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:myapp3/auth/sign_in.dart';
import 'package:myapp3/constants.dart';

class SignUPScreen extends StatefulWidget {
  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPading),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Row(children: [
                      Text("Aready have an Account"),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen())),
                          child: Text("sign in",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )))
                    ]),
                    SizedBox(height: defaultPading * 2),
                    SignUPForm(formKey: _formKey),
                    SizedBox(height: defaultPading * 2),
                    Center(
                        child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "sign Up",
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

class SignUPForm extends StatefulWidget {
  SignUPForm({
    super.key,
    required this.formKey,
  });
  final GlobalKey formKey;

  @override
  State<SignUPForm> createState() => _SignUPFormState();
}

class _SignUPFormState extends State<SignUPForm> {
  late String _UserName, _email, _password, _phoneNUmber;

  final validate = ValidationBuilder().minLength(10).maxLength(50).build();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextForm(text: "Username"),
        TextFormField(
            onSaved: (username) => _UserName = username!,
            decoration: InputDecoration(hintText: "Name!")),
        SizedBox(
          height: defaultPading,
        ),
        TextForm(text: "Email"),
        TextFormField(
            onSaved: (email) => _email = email!,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "@gmail.com")),
        SizedBox(
          height: defaultPading,
        ),
        TextForm(text: "Number"),
        TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "+123456")),
        SizedBox(
          height: defaultPading,
        ),
        TextForm(text: "Password"),
        TextFormField(
            onSaved: (password) => _password = password!,
            obscureText: true,
            decoration: InputDecoration(hintText: "********")),
        SizedBox(
          height: defaultPading,
        ),
        TextForm(text: "Confirm Password"),
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
