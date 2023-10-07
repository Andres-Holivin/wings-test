import 'package:flutter/material.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Login"), SingForm()]),
        ),
      ),
    );
  }
}

class SingForm extends StatefulWidget {
  const SingForm({super.key});

  @override
  State<SingForm> createState() => _SingFormState();
}

class _SingFormState extends State<SingForm> {
  final _formKey = GlobalKey<FormState>();
  late String username, password;
  final List<String> error = [];
  void addError({required String errors}) {
    if (!error.contains(errors)) {
      setState(() {
        error.add(errors);
      });
    }
  }

  void removeError({required String errors}) {
    if (error.contains(errors)) {
      setState(() {
        error.remove(errors);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            textFromUsername(),
            const SizedBox(
              height: 16,
            ),
            textFromPassword(),
            Column(
              children: List.generate(
                  error.length,
                  (index) => Text(
                        error[index],
                        style: TextStyle(color: Colors.red),
                      )),
            ),
            TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.pushReplacementNamed(context, "home");
                  }
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }

  TextFormField textFromUsername() {
    return TextFormField(
      onSaved: (v) => username = v!,
      onChanged: (value) {
        if (value.isNotEmpty && error.contains("username empty")) {
          removeError(errors: "username empty");
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains("username empty")) {
          addError(errors: "username empty");
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter Username",
        labelText: "Username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField textFromPassword() {
    return TextFormField(
      obscureText: true,
      onSaved: (v) => password = v!,
      onChanged: (value) {
        if (value.isNotEmpty && error.contains("password empty")) {
          removeError(errors: "password empty");
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains("password empty")) {
          addError(errors: "password empty");
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter Password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
