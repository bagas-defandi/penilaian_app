import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penilaian_app/theme.dart';

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
      buildPeserta(),
      buildDeskripsi(),
      buildJuri(),
    ];
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          "Tentang Lomba",
          style: boldtTextStyle1.copyWith(color: NeutralWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: PrimaryColor,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: NeutralWhiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPeserta() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromRGBO(241, 243, 249, 1)),
            columns: const [
              DataColumn(
                label: Text("Nama Peserta"),
              ),
              DataColumn(
                label: Text("Keterangan"),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  const DataCell(
                    Text("DWI URFATHUL FITRIA \nUniversitas Jambi"),
                  ),
                  DataCell(
                    Text(
                      "Sudah Dinilai",
                      style: regularTextStyle4.copyWith(
                        color: PrimaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: PrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  const DataCell(
                    Text("ALDI SUKMA PUTRA \nUniversitas Jambi"),
                  ),
                  DataCell(
                    Text(
                      "Belum Dinilai",
                      style: regularTextStyle4.copyWith(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
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
                  "Edit Nilai Peserta",
                  style: boldTextStyle3.copyWith(
                    color: PrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Set the border radius here
                    ),
                  ),
                  child: Text(
                    "Simpan",
                    style: boldTextStyle3.copyWith(
                      color: NeutralWhiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDeskripsi() {
    return Padding(
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
                      color: PrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 35),
          Text(
            "Lomba Cerdas Cermat",
            style: GoogleFonts.nunito().copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Universitas Jambi",
            style: GoogleFonts.nunito().copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Deskripsi",
            style: GoogleFonts.nunito().copyWith(
              fontSize: 20,
              color: const Color.fromRGBO(0, 0, 0, 0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem.',
            style: GoogleFonts.nunito().copyWith(
              fontSize: 16,
              color: const Color.fromRGBO(0, 0, 0, 0.8),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }

  Widget buildJuri() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: DataTable(
        headingRowColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromRGBO(241, 243, 249, 1)),
        columns: const [
          DataColumn(
            label: Text("Nama Juri"),
          ),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              const DataCell(
                Text("RANDI TRINANDA \nUniversitas Jambi"),
              ),
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      iconSize: 28,
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text("Tes"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              const DataCell(
                Text("RANDI TRINANDA \nUniversitas Jambi"),
              ),
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      iconSize: 28,
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text("Tes"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
