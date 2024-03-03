import 'dart:js_interop';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  bool passwordHidden = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushNamed(context, "/home");
    } on FirebaseAuthException {
      Fluttertoast.showToast(
        msg: "Incorrect Email or Password",
        webBgColor: "NeutralWhiteColor",
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/bg-onboarding.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 105,
                ),
                Image.asset(
                  'assets/images/img_page1.png',
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color here
                    borderRadius:
                        BorderRadius.circular(20.0), // Set the border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Masuk Sebagai Admin',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Email Textfield
                          TextFormField(
                            controller: _emailController,
                            validator: (value) => value == null || value.isEmpty
                                ? 'Email wajib diisi'
                                : null,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              contentPadding: const EdgeInsets.all(16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Password Textfield
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) => value == null || value.isEmpty
                                ? 'Password wajib diisi'
                                : null,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding: const EdgeInsets.all(16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordHidden = !passwordHidden;
                                  });
                                },
                                icon: Icon(passwordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            obscureText: passwordHidden,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 15),

                          // BUTTON Masuk
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: signIn,
                                child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: PrimaryColor,
                                      border:
                                          Border.all(color: NeutralDarkColor),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: Text(
                                      "Masuk",
                                      style: boldTextStyle3.copyWith(
                                        color: NeutralWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          // Masuk sebagai Juri
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                const TextSpan(
                                  text: 'Masuk sebagai ',
                                ),
                                TextSpan(
                                  text: "Juri",
                                  style: TextStyle(
                                    color: PrimaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                          context, "/juri");
                                    },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
