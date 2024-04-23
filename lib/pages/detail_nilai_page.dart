import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class DetailNilaiPage extends StatefulWidget {
  const DetailNilaiPage({super.key});

  @override
  State<DetailNilaiPage> createState() => _DetailNilaiPageState();
}

class _DetailNilaiPageState extends State<DetailNilaiPage> {
  final items = [
    '0 Tidak Dikerjakan',
    '2 Kurang Tepat',
    '3 Kurang Tepat',
    '4 Kurang Tepat',
    '8 Tepat',
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'SMAN 1 SAROLANGUN',
          style: TextStyle(
            color: neutralWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/images/icon/button_back.png'),
        ),
        centerTitle: true,
      ),
      backgroundColor: primaryColor,
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 15.0),
            Text(
              'Lomba Cerdas Cermat',
              style: extraBoldTextStyle1.copyWith(
                  fontSize: 20, color: neutralWhiteColor),
            ),
            Text(
              'Universitas Jambi',
              style: lightTextStyle1.copyWith(color: neutralWhiteColor),
            ),
            const SizedBox(height: 5.0),
            Container(
              decoration: BoxDecoration(
                color: neutralWhiteColor,
              ),
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(top: 5.0),
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromRGBO(241, 243, 249, 1)),
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        "Penilaian Awal",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      const DataCell(
                        Text("Pengamanan TKP"),
                      ),
                      // DataCell(Text("TEXT")),
                      DataCell(
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: value,
                            items: items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) =>
                                setState(() => this.value = value),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      const DataCell(
                        Text("Perkenalan Diri"),
                      ),
                      DataCell(
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: value,
                            items: items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) =>
                                setState(() => this.value = value),
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
