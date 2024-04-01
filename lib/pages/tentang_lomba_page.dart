import 'package:flutter/material.dart';
import 'package:penilaian_app/components/circle_tab_indicator.dart';
import 'package:penilaian_app/components/tab_bar_dotted.dart';

class TentangLombaPage extends StatefulWidget {
  const TentangLombaPage({super.key});

  @override
  State<TentangLombaPage> createState() => _TentangLombaPageState();
}

class _TentangLombaPageState extends State<TentangLombaPage> {
  late List<Widget> tabBarViews = [
    buildPeserta(),
    buildDeskripsi(),
    buildJuri(),
  ];

  final List tabBarTitle = ["Peserta", "Deskripsi", "Juri"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarTitle.length,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: BackButton(color: Theme.of(context).colorScheme.tertiary),
            title: Text(
              "Tentang Lomba",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Container(
            margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 15),
                  child: TabBar(
                    dividerColor: Theme.of(context).colorScheme.tertiary,
                    indicator: CircleTabIndicator(
                        color: Theme.of(context).colorScheme.primary,
                        radius: 6),
                    labelColor: Theme.of(context).colorScheme.primary,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    tabs: tabBarTitle
                        .map((title) => TabBarDotted(title: title))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: tabBarViews,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildPeserta() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
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
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const DataRow(
                  cells: [
                    DataCell(
                      Text("ALDI SUKMA PUTRA \nUniversitas Jambi"),
                    ),
                    DataCell(
                      Text(
                        "Belum Dinilai",
                        style: TextStyle(
                          fontSize: 14,
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
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text(
                  "Lihat Nilai Peserta",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Set the border radius here
                    ),
                  ),
                  child: Text(
                    "Ajukan Nilai",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDeskripsi() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/example_Poster.png'),
                    Text(
                      "Gambar Lomba",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              "Lomba Cerdas Cermat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              "Universitas Jambi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Deskripsi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
            ),
            const Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Text(
                    "Lihat Nilai Peserta",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the border radius here
                      ),
                    ),
                    child: Text(
                      "Ajukan Nilai",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJuri() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
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
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text(
                  "Lihat Nilai Peserta",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Set the border radius here
                    ),
                  ),
                  child: Text(
                    "Ajukan Nilai",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
