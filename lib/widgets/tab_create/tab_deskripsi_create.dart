import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class BuildDeskripsiCreate extends StatefulWidget {
  const BuildDeskripsiCreate({super.key});

  @override
  State<BuildDeskripsiCreate> createState() => _BuildDeskripsiCreateState();
}

class _BuildDeskripsiCreateState extends State<BuildDeskripsiCreate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/example_Poster.png'),
                    Text(
                      "Gambar Lomba",
                      style: extraBoldTextStyle2.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Judul",
              // style: boldtTextStyle2.copyWith(color: Colors.black),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintText: 'Masukkan Judul lomba',
                filled: true,
                hintStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: const TextStyle(color: Colors.black),
              cursorColor: neutralWhiteColor,
            ),
            const SizedBox(height: 9),
            const Text(
              "Penyelenggara",
              // style: boldtTextStyle2.copyWith(color: Colors.black),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintText: 'Masukkan Penyelenggara Lomba',
                filled: true,
                hintStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: const TextStyle(color: Colors.black),
              cursorColor: neutralWhiteColor,
            ),
            const SizedBox(height: 9),
            const Text(
              "Deskripsi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintText: 'Tambahkan deskripsi lomba',
                filled: true,
                hintStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: const TextStyle(color: Colors.black),
              cursorColor: neutralWhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
