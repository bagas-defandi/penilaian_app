import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

enum SampleItem { itemOne, itemTwo }

class CreateJuri extends StatefulWidget {
  const CreateJuri({super.key});

  @override
  State<CreateJuri> createState() => _CreateJuriState();
}

class _CreateJuriState extends State<CreateJuri> {
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
                width: MediaQuery.of(context).size.width - 100,
                child: Text(
                  "Nama Juri",
                  style: semiBoldTextStyle1.copyWith(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/icon/button_Add.png',
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "Alif M. Anwar Tambunan",
                    style: regularTextStyle1,
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
