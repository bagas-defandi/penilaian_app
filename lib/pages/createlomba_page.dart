import 'package:flutter/material.dart';
import 'package:penilaian_app/pages/description_page.dart';
import 'package:penilaian_app/theme.dart';

class CreateLomba extends StatefulWidget {
  const CreateLomba({super.key});

  @override
  State<CreateLomba> createState() => _CreateLombaState();
}

class _CreateLombaState extends State<CreateLomba> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/bg-homescreen.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              // TOP BAR
              Padding(
                padding: EdgeInsets.fromLTRB(24, 15, 24, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DescriptionPage()));
                        },
                        child: Image.asset(
                          "assets/images/icon/button_back.png",
                          width: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 61,
                    ),
                    Text(
                      "Buat Lomba",
                      style: boldtTextStyle1.copyWith(color: NeutralWhiteColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              //CONTAINER
              Container(
                decoration: BoxDecoration(
                  color: NeutralWhiteColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: screenWidth,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    // GAMBAR/POSTER LOMBA
                    Container(
                      height: 191,
                      width: 323,
                      margin: EdgeInsets.fromLTRB(26, 23, 26, 23),
                      decoration: BoxDecoration(
                          color: GrayColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/example_Poster.png'),
                            ),
                            Text(
                              'Tambahkan Gambar/Poster Lomba',
                              style: TextStyle(color: PrimaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    // FIELD JUDUL
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, bottom: 5.0),
                          child: Text("Judul", style: extraBoldTextStyle1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: NeutralWhiteColor,
                            border: Border.all(color: PrimaryColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            // controller: _judulController,
                            style: regularTextstyle2.copyWith(
                                color: NeutralDarkColor2),
                            cursorColor: PrimaryColor,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Masukkan Judul Lomba",
                                hintStyle: lightTextStyle1.copyWith(
                                  color: NeutralDarkColor2,
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 9),

                    // FIELD PENYELENGGARA
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, bottom: 5.0),
                          child:
                              Text("Penyelenggara", style: extraBoldTextStyle1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: NeutralWhiteColor,
                            border: Border.all(color: PrimaryColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            // controller: _penyelenggaraController,
                            style: regularTextstyle2.copyWith(
                                color: NeutralDarkColor2),
                            cursorColor: PrimaryColor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Masukkan Penyelenggara Lomba",
                              hintStyle: lightTextStyle1.copyWith(
                                color: NeutralDarkColor2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 9),

                    // FIELD DESKRIPSI
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, bottom: 5.0),
                          child: Text("Deskripsi", style: extraBoldTextStyle1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        height: 116,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          // controller: _deskripsiController,
                          maxLines: 10,
                          style:
                              regularTextStyle1.copyWith(color: PrimaryColor),
                          decoration: InputDecoration(
                            hintText: 'Tulis Deskripsi Lomba...',
                            hintStyle:
                                lightTextStyle1, // Text yang muncul ketika TextField kosong
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: PrimaryColor),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: PrimaryColor),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            filled: true,
                            fillColor: NeutralWhiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 23),

                    // BUTTON SAVE OR CANCEL
                    Row(
                      children: [
                        SizedBox(width: 118),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 98,
                                height: 42,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: NeutralWhiteColor,
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: semiBoldTextStyle1.copyWith(
                                        color: Colors.black.withOpacity(0.2)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 98,
                                height: 42,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: PrimaryColor,
                                    border: Border.all(color: PrimaryColor),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: semiBoldTextStyle1.copyWith(
                                        color: NeutralWhiteColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
