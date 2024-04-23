import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class TabUmum extends StatelessWidget {
  const TabUmum({super.key});

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
          width: MediaQuery.of(context).size.width - 60,
          child: DataTable(
            columnSpacing: 2,
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
                  child: Text("Nama Peserta"),
                ),
              ),
              DataColumn(
                label: Container(
                  alignment: Alignment.centerRight,
                  child: Text("Total Nilai"),
                ),
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
                  DataCell(
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("TEXT"),
                    ),
                  ),
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
                        "DWI URFATHUL FITRIA",
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        alignment: Alignment.centerRight, child: Text("TEXT")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
