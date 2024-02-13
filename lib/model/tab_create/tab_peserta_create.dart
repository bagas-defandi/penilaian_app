import 'package:flutter/material.dart';
import 'package:penilaian_app/pages/home.dart';
import 'package:penilaian_app/theme.dart';

enum SampleItem { itemOne, itemTwo }

class CreatePeserta extends StatefulWidget {
  const CreatePeserta({super.key});

  @override
  State<CreatePeserta> createState() => _CreatePesertaState();
}

class _CreatePesertaState extends State<CreatePeserta> {
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
        width: MediaQuery.of(context).size.width - 10,
        child: DataTable(
          columnSpacing: 10.0,
          headingRowColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromRGBO(241, 243, 249, 1)),
          columns: [
            DataColumn(
              label: Container(
                width: MediaQuery.of(context).size.width - 190,
                child: Text(
                  "Nama Peserta",
                  style: semiBoldTextStyle1.copyWith(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            DataColumn(
              label: Container(
                width: 90,
                child: Text(
                  "Keterangan",
                  style: semiBoldTextStyle1.copyWith(fontSize: 14),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/images/icon/button_Add.png'),
                ),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "SMAN 4 KOTA JAMBI",
                    style: regularTextStyle1,
                  ),
                ),
                DataCell(
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Belum Dinilai',
                      style: regularTextStyle1,
                    ),
                  ),
                ),
                DataCell(
                  PopupMenuButton<SampleItem>(
                    initialValue: selectedMenu,
                    // Callback that sets the selected popup menu item.
                    onSelected: (SampleItem item) {
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SampleItem>>[
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemOne,
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemTwo,
                        child: Text('Hapus'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
