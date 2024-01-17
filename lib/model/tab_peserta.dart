import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class BuildPeserta extends StatefulWidget {
  const BuildPeserta({super.key});

  @override
  State<BuildPeserta> createState() => _BuildPesertaState();
}

class _BuildPesertaState extends State<BuildPeserta> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
            DataRow(
              cells: [
                const DataCell(
                  Text(
                    "ALDI SUKMA PUTRA \nUniversitas Jambi",
                  ),
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
      ],
    );
  }
}
