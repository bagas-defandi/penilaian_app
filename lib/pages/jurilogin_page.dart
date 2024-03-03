import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penilaian_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginJuri extends StatefulWidget {
  const LoginJuri({super.key});

  @override
  State<LoginJuri> createState() => _LoginJuriState();
}

class _LoginJuriState extends State<LoginJuri> {
  final _pinController = TextEditingController();

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
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/admin");
                  },
                  child: Row(
                    children: [
                      Text(
                        'Login Admin!',
                        style:
                            boldTextStyle3.copyWith(color: NeutralWhiteColor),
                      ),
                      Icon(
                        Icons.login,
                        color: NeutralWhiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/img_page1.png',
                ),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the background color here
                    borderRadius:
                        BorderRadius.circular(20.0), // Set the border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    // TEXTFIELD MASUKKAN PIN JURI
                    child: Column(
                      children: [
                        Text(
                          'Masukkan Pin Juri',
                          style: boldtTextStyle2,
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: _pinController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Pin berjumlah 6 digit karakter',
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        const SizedBox(height: 15),

                        // BUTTON Masuk
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, "/home");
                              },
                              child: Container(
                                width: 100,
                                padding: const EdgeInsets.all(5.0),
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
                        const SizedBox(height: 15),

                        // HUBUNGI ADMIN
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              const TextSpan(
                                text:
                                    'Pin digunakan untuk login sebagai juri. Jika anda belum mempunyai pin? Silahkan hubungi ',
                              ),
                              TextSpan(
                                text: "Admin",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: PrimaryColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    sendEmailToAdmin();
                                  },
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
      ),
    );
  }

  void sendEmailToAdmin() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'alifmakassar9a@gmail.com', // Ganti dengan alamat email admin
      query: 'subject=Login Request&body= Saya ingin meminta Pin sebagai juri.',
    );
    final String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
