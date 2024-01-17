import 'package:flutter/material.dart';
// import 'package:penilaian_app/theme.dart';

class BuildJuri extends StatefulWidget {
  const BuildJuri({super.key});

  @override
  State<BuildJuri> createState() => _BuildJuriState();
}

class _BuildJuriState extends State<BuildJuri> {
  @override
  Widget build(BuildContext context) {
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
