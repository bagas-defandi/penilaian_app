import 'package:flutter/material.dart';
import 'package:penilaian_app/pages/nilai_peserta_page.dart';
import 'package:penilaian_app/theme.dart';
import 'package:penilaian_app/model/tab_peserta.dart';
import 'package:penilaian_app/model/tab_juri.dart';
import 'package:penilaian_app/model/tab_deskripsi.dart';

class TentangLombaPage extends StatefulWidget {
  const TentangLombaPage({super.key});

  @override
  State<TentangLombaPage> createState() => _TentangLombaPageState();
}

class _TentangLombaPageState extends State<TentangLombaPage> {
  late List<Widget> tabs = [];
  List<String> items = [
    "Peserta",
    "Deskripsi",
    "Juri",
  ];

  @override
  void initState() {
    super.initState();
    tabs = [
      const BuildPeserta(),
      const BuildDeskripsi(),
      const BuildJuri(),
    ];
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Tentang Lomba',
          style: boldtTextStyle1.copyWith(color: NeutralWhiteColor),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/images/icon/button_back.png'),
        ),
        centerTitle: true,
      ),
      backgroundColor: PrimaryColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            color: PrimaryColor,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: NeutralWhiteColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15, left: 0, right: 0),
                    width: double.infinity,
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              color: NeutralWhiteColor,
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 80,
                              height: 45,
                              child: Column(
                                children: [
                                  Text(
                                    items[index],
                                    style: boldTextStyle3.copyWith(
                                      color: PrimaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: current == index
                                        ? BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: PrimaryColor,
                                          )
                                        : BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: PrimaryColor,
                                              width: 1.0,
                                            ),
                                          ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: tabs[current],
                  ))
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: NeutralWhiteColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20.0,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: BorderSide(color: PrimaryColor),
                    ),
                    child: Text(
                      "Lihat Nilai Peserta",
                      style: semiBoldTextStyle1.copyWith(
                        color: PrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NilaiPesertaPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the border radius here
                      ),
                    ),
                    child: Text(
                      "Ajukan nilai",
                      style: semiBoldTextStyle1.copyWith(
                        color: NeutralWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
