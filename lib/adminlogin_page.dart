import 'package:flutter/material.dart';
import 'package:penilaian_app/pages/home.dart';
import 'package:penilaian_app/theme.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
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
                  child: Column(
                    children: [
                      Text(
                        'Masuk Sebagai Admin',
                        style: boldtTextStyle2,
                      ),
                      const SizedBox(height: 20),

                      // Username Textfield
                      TextField(
                        controller: _usernameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ), // Set the border radius
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                      ),
                      SizedBox(height: 10),

                      // Password Textfield
                      TextField(
                        controller: _passwordController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ), // Set the border radius
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 15),

                      // BUTTON Masuk
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: Container(
                              width: 100,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: PrimaryColor,
                                  border: Border.all(color: NeutralDarkColor),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text(
                                  "Masuk",
                                  style: boldTextStyle3.copyWith(
                                      color: NeutralWhiteColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Masuk sebagai Juri
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Masuk sebagai ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginAdmin()));
                                },
                                child: Text('Juri?',
                                    style: TextStyle(
                                      color: PrimaryColor,
                                      decoration: TextDecoration.underline,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
