import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class TabDetail extends StatefulWidget {
  const TabDetail({super.key});

  @override
  State<TabDetail> createState() => _TabDetailState();
}

class _TabDetailState extends State<TabDetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: neutralWhiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
      margin: EdgeInsets.all(8),
      width: screenWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.only(top: 10.0),
          width: MediaQuery.of(context).size.width - 10,
          child: DataTable(
            columnSpacing: 5.0,
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromRGBO(241, 243, 249, 1)),
            columns: [
              DataColumn(
                label: Container(
                  width: 20.0,
                  child: Text("No"),
                ),
              ),
              DataColumn(
                label: Container(
                  width: 100.0,
                  child: Text("Nama Peserta"),
                ),
              ),
              DataColumn(
                label: Text("Juri 1"),
              ),
              DataColumn(
                label: Text("Juri 2"),
              ),
              DataColumn(
                label: Text("Juri 3"),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text("1")),
                  DataCell(
                    Container(
                      width: 170.0,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        "DWI URFATHUL FITRIA",
                      ),
                    ),
                  ),
                  DataCell(Text("TEXT")),
                  DataCell(Text("TEXT")),
                  DataCell(Text("TEXT")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("2")),
                  DataCell(
                    Container(
                      width: 170.0,
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          "ALDI SUKMA PUTRA Universitas Jambi"),
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
    );
  }
}
