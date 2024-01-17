import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class DetailNilai extends StatefulWidget {
  const DetailNilai({super.key});

  @override
  State<DetailNilai> createState() => _DetailNilaiState();
}

class _DetailNilaiState extends State<DetailNilai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Dwi Urfatul',
          style: boldtTextStyle1.copyWith(color: NeutralWhiteColor),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/images/icon/button_back.png'),
        ),
        centerTitle: true,
      ),
      backgroundColor: PrimaryColor,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Text(
              'Lomba Cerdas Cermat',
              style: extraBoldTextStyle1.copyWith(
                  fontSize: 20, color: NeutralWhiteColor),
            ),
            Text(
              'Universitas Jambi',
              style: lightTextStyle1.copyWith(color: NeutralWhiteColor),
            ),
            SizedBox(height: 5.0),
            Container(
              decoration: BoxDecoration(
                color: NeutralWhiteColor,
              ),
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(top: 5.0),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromRGBO(241, 243, 249, 1)),
                  columns: const [
                    DataColumn(
                      label: Text("Nama Juri"),
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
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            "Juri 1 \nUniversitas Jambi",
                            style: regularTextStyle1,
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
                          Text(
                            "Juri 2 \nUniversitas Jambi",
                            style: regularTextStyle1,
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
                          Text(
                            "Juri 3 \nUniversitas Jambi",
                            style: regularTextStyle1,
                          ),
                        ),
                        DataCell(Text("TEXT")),
                        DataCell(Text("TEXT")),
                        DataCell(Text("TEXT")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
