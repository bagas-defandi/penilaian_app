import 'package:flutter/material.dart';
import 'package:penilaian_app/model/card_carousel.dart';
import 'package:penilaian_app/theme.dart';
import 'package:penilaian_app/model/card_widget.dart';
import 'package:penilaian_app/pages/description_page.dart';
import 'package:penilaian_app/pages/createlomba_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar perangkat
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
              SizedBox(
                height: 50,
              ),

              // TOP BAR
              Center(
                child: Text(
                  'Home',
                  style: boldtTextStyle1.copyWith(color: NeutralWhiteColor),
                ),
              ),
              SizedBox(
                height: 18,
              ),

              // Profile Section
              Center(
                child: Container(
                  width: 234,
                  height: 48,
                  child: Row(
                    children: [
                      Image(
                        image:
                            AssetImage('assets/images/icon/Profile_icon.png'),
                      ),
                      SizedBox(
                        width: 29,
                      ),
                      Column(
                        children: [
                          Text(
                            'Selamat Datang!',
                            style: semiBoldTextStyle1.copyWith(
                                color: NeutralWhiteColor),
                          ),
                          Text(
                            '(Nama Lengkap Juri)',
                            style: extraBoldTextStyle1.copyWith(
                                color: NeutralWhiteColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),

              // SEARCH BOX
              Container(
                width: 325,
                height: 56,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(82, 69, 175, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 29.0),
                  child: TextField(
                    controller: _searchController,
                    style: lightTextStyle1.copyWith(color: NeutralWhiteColor),
                    cursorColor: PrimaryColor,
                    // onChanged: (query) {
                    //   _performSearch(query);
                    // },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: NeutralWhiteColor.withOpacity(0.5),
                        ),
                        hintText: "Cari Lomba",
                        hintStyle: lightTextStyle1.copyWith(
                            color: NeutralWhiteColor.withOpacity(0.5),
                            fontSize: 14)),
                  ),
                ),
              ),
              SizedBox(
                height: 43,
              ),

              // CAROUSEL SECTION
              CardCarousel(),
              SizedBox(height: 49),

              // LOMBA LAINNYA SECTION
              Container(
                decoration: BoxDecoration(
                  color: NeutralWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                margin: EdgeInsets.only(bottom: 0),
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lomba Lainnya',
                      style: extraBoldTextStyle1.copyWith(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateLomba()));
                      },
                      child: Image.asset('assets/images/icon/button_Add.png'),
                    ),
                  ],
                ),
              ),
              // CARD LOMBA
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 0),
                  width: screenWidth,
                  color: NeutralWhiteColor,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: CardWidget(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
