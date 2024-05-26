import 'package:flutter/material.dart';
import 'package:penilaian_app/components/primary_text_field.dart';
import 'package:penilaian_app/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordHidden = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showLoadingCircle();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, "/auth");
    } on FirebaseAuthException {
      if (!mounted) return;
      Navigator.pop(context);

      Fluttertoast.showToast(
        msg: "Incorrect Email or Password",
        webBgColor: "neutralWhiteColor",
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
    }
  }

  void showLoadingCircle() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
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
                const SizedBox(height: 105),
                Image.asset('assets/images/img_page1.png'),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Masuk ke Sistem',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Email Textfield
                          PrimaryTextField(
                            name: 'Email',
                            controller: _emailController,
                          ),
                          const SizedBox(height: 20),

                          // Password Textfield
                          PrimaryTextField(
                            name: 'Password',
                            controller: _passwordController,
                            isPassword: true,
                            isPasswordHidden: passwordHidden,
                            onPressedPassword: () {
                              setState(() => passwordHidden = !passwordHidden);
                            },
                          ),
                          const SizedBox(height: 15),

                          // BUTTON Masuk
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    signIn();
                                  }
                                },
                                child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      border:
                                          Border.all(color: neutralDarkColor),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: Text(
                                      "Masuk",
                                      style: boldTextStyle3.copyWith(
                                        color: neutralWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
