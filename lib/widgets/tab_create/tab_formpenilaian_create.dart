import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

enum SampleItem { itemOne, itemTwo }

class CreatePenilaian extends StatefulWidget {
  const CreatePenilaian({super.key});

  @override
  State<CreatePenilaian> createState() => _CreatePenilaianState();
}

class _CreatePenilaianState extends State<CreatePenilaian> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Tampilkan menu saat tombol ditekan
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(0, 200, 0, 0),
                        items: [
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemOne,
                            child: Text('Jumlah Kriteria: 1'),
                          ),
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemTwo,
                            child: Text('Batal'),
                          ),
                        ],
                      ).then((value) {
                        // Setelah item dipilih, lakukan sesuatu jika perlu
                        if (value != null) {
                          setState(() {
                            selectedMenu = value;
                          });
                        }
                      });
                    },
                    child: Text(
                      'Tambah Form Penilaian',
                      style: semiBoldTextStyle1.copyWith(
                          color: neutralWhiteColor, fontSize: 10),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      elevation: MaterialStateProperty.all(3),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 15)), // Sesuaikan padding di sini
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Tambah Form Waktu',
                      style: semiBoldTextStyle1.copyWith(
                          color: neutralWhiteColor, fontSize: 10),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      elevation: MaterialStateProperty.all(3),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 15)), // Sesuaikan padding di sini
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
