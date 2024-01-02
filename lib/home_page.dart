import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penilaian_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg-homepage.png'),
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
              Image.asset(
                'assets/images/img_page1.png',
              ),
              const SizedBox(height: 15),
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
                      const SizedBox(height: 30),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text:
                                  'Pin digunakan untuk login sebagai juri. Jika anda belum mempunyai pin? Silahkan hubungi ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {},
                                child: const Text("Admin"),
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
