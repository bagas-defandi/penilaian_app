import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class NilaiPesertaPage extends StatefulWidget {
  const NilaiPesertaPage({super.key});

  @override
  State<NilaiPesertaPage> createState() => _NilaiPesertaPageState();
}

class _NilaiPesertaPageState extends State<NilaiPesertaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Nilai Peserta',
          style: boldtTextStyle1.copyWith(color: neutralWhiteColor),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/images/icon/button_back.png'),
        ),
        centerTitle: true,
      ),
      backgroundColor: primaryColor,
      body: Container(
        color: neutralWhiteColor,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 11),
              width: double.infinity,
              color: primaryColor,
              child: Column(
                children: [
                  Text(
                    "Lomba Cerdas Cermat",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: neutralWhiteColor,
                    ),
                  ),
                  Text(
                    "Universitas Jambi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: neutralWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromRGBO(241, 243, 249, 1)),
                      columns: const [
                        DataColumn(
                          label: Text("Nama Peserta"),
                        ),
                        DataColumn(
                          label: Text("Kriteria 1"),
                        ),
                        DataColumn(
                          label: Text("Kriteria 2"),
                        ),
                        DataColumn(
                          label: Text("Kriteria 3"),
                        ),
                      ],
                      rows: const [
                        DataRow(
                          cells: [
                            DataCell(
                              Text(
                                "DWI URFATHUL FITRIA \nUniversitas Jambi",
                              ),
                            ),
                            DataCell(Text("TEXT")),
                            DataCell(Text("TEXT")),
                            DataCell(Text("TEXT")),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("ALDI SUKMA PUTRA \nUniversitas Jambi"),
                            ),
                            DataCell(Text("TEXT")),
                            DataCell(Text("TEXT")),
                            DataCell(Text("TEXT")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            side: BorderSide(color: primaryColor),
                          ),
                          child: Text(
                            "Batal",
                            style: boldTextStyle3.copyWith(
                              color: primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Set the border radius here
                            ),
                          ),
                          child: Text(
                            "Selesai",
                            style: boldTextStyle3.copyWith(
                              color: neutralWhiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
