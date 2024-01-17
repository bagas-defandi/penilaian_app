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
        color: NeutralWhiteColor,
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
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromRGBO(241, 243, 249, 1)),
          columns: const [
            DataColumn(
              label: Text("No"),
            ),
            DataColumn(
              label: Text("Nama Peserta"),
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
          rows: const [
            DataRow(
              cells: [
                DataCell(Text("1")),
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
                DataCell(Text("2")),
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
    );
  }
}
