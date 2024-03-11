import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penilaian_app/components/circle_tab_indicator.dart';
import 'package:penilaian_app/components/tab_bar_dotted.dart';
import 'package:penilaian_app/services/firestore.dart';

class CreateLombaPage extends StatefulWidget {
  const CreateLombaPage({super.key});

  @override
  State<CreateLombaPage> createState() => _CreateLombaPageState();
}

class _CreateLombaPageState extends State<CreateLombaPage> {
  List<TextEditingController> _pesertaControllers = [TextEditingController()];
  final _jumlahPesertaController = TextEditingController();
  int jumlahPeserta = 1;

  List<TextEditingController> _juriControllers = [TextEditingController()];
  final _jumlahJuriController = TextEditingController();
  int jumlahJuri = 1;

  final List tabBarTitle = ["Deskripsi", "Peserta", "Juri"];

  final _judulController = TextEditingController();
  final _penyelenggaraController = TextEditingController();
  final _deskripsiController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FirestoreService firestoreService = FirestoreService();

  void changeJumlahPeserta(value) {
    if (value != "") {
      setState(() {
        jumlahPeserta = int.parse(value);
        _pesertaControllers = [];
        _pesertaControllers =
            List.generate(jumlahPeserta, (index) => TextEditingController());
      });
    } else {
      setState(() {
        jumlahPeserta = 0;
        _pesertaControllers = [];
      });
    }
  }

  void changeJumlahJuri(value) {
    if (value != "") {
      setState(() {
        jumlahJuri = int.parse(value);
        _juriControllers = [];
        _juriControllers =
            List.generate(jumlahJuri, (index) => TextEditingController());
      });
    } else {
      setState(() {
        jumlahJuri = 0;
        _juriControllers = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _jumlahPesertaController.text = jumlahPeserta.toString();
    _jumlahJuriController.text = jumlahJuri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarTitle.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: BackButton(color: Theme.of(context).colorScheme.tertiary),
          title: Text(
            "Buat Lomba",
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
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 15),
                child: TabBar(
                  dividerColor: Theme.of(context).colorScheme.tertiary,
                  indicator: CircleTabIndicator(
                      color: Theme.of(context).colorScheme.primary, radius: 6),
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
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    buildDeskripsi(context),
                    buildPeserta(),
                    buildJuri(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildDeskripsi(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
                      "Pilih Gambar Lomba",
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Judul",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _judulController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Judul Lomba wajib diisi'
                  : null,
              decoration: InputDecoration(
                hintText: 'Masukkan Judul Lomba',
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Penyelenggara",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _penyelenggaraController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Penyelenggara Lomba wajib diisi'
                  : null,
              decoration: InputDecoration(
                hintText: 'Masukkan Penyelenggara Lomba',
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Deskripsi",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _deskripsiController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Deskripsi Lomba wajib diisi'
                  : null,
              decoration: InputDecoration(
                hintText: 'Masukkan Deskripsi Lomba',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 35,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
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
                      "Kembali",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // _tabController.animateTo(currentTab + 1);
                      if (_formKey.currentState!.validate()) {
                        // login();
                        print("object");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Selanjutnya",
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

  SingleChildScrollView buildPeserta() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Text("Jumlah Peserta",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF2E384E),
                )),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _jumlahPesertaController,
                  onChanged: (value) => changeJumlahPeserta(value),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Jumlah Peserta wajib diisi'
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Jumlah Peserta',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 7),
              IconButton.filled(
                onPressed: () {
                  setState(() {
                    _pesertaControllers.add(TextEditingController());
                    jumlahPeserta++;
                    _jumlahPesertaController.text = jumlahPeserta.toString();
                  });
                },
                iconSize: 30,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _pesertaControllers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E384E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _pesertaControllers[index],
                          autofocus: false,
                          style: const TextStyle(color: Color(0xFFF8F8FF)),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Peserta ${index + 1}",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 132, 140, 155)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pesertaControllers[index].clear();
                          _pesertaControllers[index].dispose();
                          _pesertaControllers.removeAt(index);
                          jumlahPeserta--;
                          _jumlahPesertaController.text =
                              jumlahPeserta.toString();
                        });
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Color(0xFF6B74D6),
                        size: 35,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  SingleChildScrollView buildJuri() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Text("Jumlah Juri",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF2E384E),
                )),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _jumlahJuriController,
                  onChanged: (value) => changeJumlahJuri(value),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Jumlah Juri wajib diisi'
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Jumlah Juri',
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 7),
              IconButton.filled(
                onPressed: () {
                  setState(() {
                    _juriControllers.add(TextEditingController());
                    jumlahJuri++;
                    _jumlahJuriController.text = jumlahJuri.toString();
                  });
                },
                iconSize: 30,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _juriControllers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E384E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _juriControllers[index],
                          autofocus: false,
                          style: const TextStyle(color: Color(0xFFF8F8FF)),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Juri ${index + 1}",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 132, 140, 155)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _juriControllers[index].clear();
                          _juriControllers[index].dispose();
                          _juriControllers.removeAt(index);
                          jumlahJuri--;
                          _jumlahJuriController.text = jumlahJuri.toString();
                        });
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Color(0xFF6B74D6),
                        size: 35,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
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
                    "Kembali",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   List<String> allJuri = _juriControllers
                    //       .map((controller) => controller.text)
                    //       .toList();

                    //   List<String> allPeserta = _pesertaControllers
                    //       .map((controller) => controller.text)
                    //       .toList();

                    //   Map<String, dynamic> lombaMap = {
                    //     "judul": _judulController.text,
                    //     "penyelenggara": _penyelenggaraController.text,
                    //     "deskripsi": _deskripsiController.text,
                    //     "peserta": allPeserta,
                    //     "juri": allJuri,
                    //   };
                    //   print("YESSS");
                    //   // firestoreService.addLomba(lombaMap);
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Simpan",
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
