import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penilaian_app/components/primary_text_field.dart';
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

  final List<TextEditingController> _kriteriaControllers = [
    TextEditingController()
  ];

  List<String> selectedTipeNilai = [""];

  late Map<String, String> juriAndDocId;
  late List<String> juriName = [""];
  List<String> selectedJuri = [""];
  int currentStep = 0;

  final _judulController = TextEditingController();
  final _deskripsiController = TextEditingController();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final FirestoreService firestoreService = FirestoreService();

  getJuriAndDocID() async {
    var data = await firestoreService.getJuriAndDocID();
    setState(() {
      juriAndDocId = data;
      juriName = data.keys.toList();
    });
  }

  void changeJumlahPeserta(value) {
    if (value != "" && int.parse(value) <= 50) {
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

  @override
  void initState() {
    super.initState();
    _jumlahPesertaController.text = jumlahPeserta.toString();
    getJuriAndDocID();
    _kriteriaControllers[0].text = 'Kriteria Penilaian';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stepper(
          type: StepperType.vertical,
          currentStep: currentStep,
          steps: getSteps(),
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              // send data to server
              List<String> allPeserta = _pesertaControllers
                  .map((controller) => controller.text)
                  .toList();

              List<String?> allJuriId =
                  selectedJuri.map((juri) => juriAndDocId[juri]).toList();

              List<String> allKriteria = _kriteriaControllers
                  .map((controller) => controller.text)
                  .toList();

              List<Map<String, dynamic>> kriteria = List.generate(
                allKriteria.length,
                (index) => {
                  'judul': allKriteria[index],
                  'tipe': selectedTipeNilai[index].toLowerCase(),
                },
              );

              Map<String, dynamic> lombaMap = {
                "judul": _judulController.text,
                "deskripsi": _deskripsiController.text,
                "peserta": allPeserta,
                "juri": allJuriId,
                "hasIsiKriteria": false,
                "kriteria": kriteria,
              };
              firestoreService.addLomba(lombaMap);
              Navigator.pop(context);
            } else {
              if (!formKeys[currentStep].currentState!.validate()) {
                return;
              }
              setState(() => currentStep += 1);
            }
          },
          onStepCancel:
              currentStep == 0 ? null : () => setState(() => currentStep -= 1),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Deskripsi Lomba"),
        content: Form(
          key: formKeys[0],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              PrimaryTextField(
                name: 'Judul Lomba',
                controller: _judulController,
                hintText: 'Masukkan Judul Lomba',
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
              PrimaryTextField(
                name: 'Deskripsi Lomba',
                controller: _deskripsiController,
                hintText: 'Masukkan Deskripsi Lomba',
              ),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Peserta"),
        content: Form(
          key: formKeys[1],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Jumlah Peserta",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF2E384E),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: PrimaryTextField(
                      name: 'Jumlah Peserta',
                      controller: _jumlahPesertaController,
                      isOnlyNumber: true,
                      hintText: 'Masukkan Jumlah Peserta',
                      onChanged: (value) => changeJumlahPeserta(value),
                      validator: (value) => value == null ||
                              value.isEmpty ||
                              int.parse(value) <= 0 ||
                              int.parse(value) >= 50
                          ? 'Jumlah Peserta harus 1 - 50'
                          : null,
                    ),
                  ),
                  const SizedBox(width: 7),
                  IconButton.filled(
                    onPressed: () {
                      setState(() {
                        _pesertaControllers.add(TextEditingController());
                        jumlahPeserta++;
                        _jumlahPesertaController.text =
                            jumlahPeserta.toString();
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
                          child: TextFormField(
                            controller: _pesertaControllers[index],
                            validator: (value) => value == null || value.isEmpty
                                ? 'Peserta ${index + 1} wajib diisi'
                                : null,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF2E384E),
                              contentPadding: const EdgeInsets.all(16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Peserta ${index + 1}",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 132, 140, 155)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
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
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("Juri"),
        content: Form(
          key: formKeys[2],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownSearch<String>.multiSelection(
                popupProps: PopupPropsMultiSelection.menu(
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  showSearchBox: true,
                  searchDelay: Durations.short2,
                ),
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Pilih Juri",
                  ),
                ),
                items: juriName,
                validator: (List<String>? item) {
                  if (item!.isEmpty) {
                    return "Juri Harus di isi";
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedJuri = value;
                },
              ),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text("Penilaian Lomba"),
        content: Form(
          key: formKeys[3],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton.filled(
                  onPressed: () {
                    setState(() {
                      _kriteriaControllers.add(TextEditingController());
                      selectedTipeNilai.add("");
                    });
                  },
                  iconSize: 30,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _kriteriaControllers.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 25),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Kriteria & Tipe Nilai ${index + 1}'),
                            PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: const Text("Hapus Kriteria"),
                                  onTap: () {
                                    setState(() {
                                      _kriteriaControllers[index].clear();
                                      _kriteriaControllers[index].dispose();
                                      _kriteriaControllers.removeAt(index);
                                      selectedTipeNilai.removeAt(index);
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _kriteriaControllers[index],
                          validator: (value) => value == null || value.isEmpty
                              ? 'Kriteria ${index + 1} wajib diisi'
                              : null,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF2E384E),
                            contentPadding: const EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Kriteria ${index + 1}",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 132, 140, 155)),
                          ),
                        ),
                        const SizedBox(height: 7),
                        DropdownSearch<String>(
                          items: const [
                            "Per Kategori",
                            "Ada & Tidak ada",
                            "Individu"
                          ],
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Pilih Tipe Nilai",
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Tipe Nilai ${index + 1} Harus di isi";
                            }
                            return null;
                          },
                          onChanged: (String? value) {
                            if (value != null || value!.isNotEmpty) {
                              selectedTipeNilai[index] = value;
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      Step(
        title: const Text("Konfirmasi"),
        content: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Judul Lomba",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2E384E),
                ),
              ),
              const SizedBox(height: 5),
              Text(_judulController.text),
              const SizedBox(height: 15),
              const Text(
                "Deskripsi Lomba",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2E384E),
                ),
              ),
              const SizedBox(height: 5),
              Text(_deskripsiController.text),
              const SizedBox(height: 15),
              const Text(
                "Peserta Lomba",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2E384E),
                ),
              ),
              ..._pesertaControllers.asMap().entries.map((e) {
                int index = e.key;
                String peserta = e.value.text;
                return Text('${index + 1}. $peserta');
              }).toList(),
              const SizedBox(height: 15),
              const Text(
                "Juri Lomba",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2E384E),
                ),
              ),
              ...selectedJuri.asMap().entries.map((e) {
                int index = e.key;
                String juri = e.value;
                return Text('${index + 1}. $juri');
              }).toList(),
              const SizedBox(height: 15),
              const Text(
                "Penilaian Lomba",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2E384E),
                ),
              ),
              ..._kriteriaControllers.asMap().entries.map((e) {
                int index = e.key;
                String kriteria = e.value.text;
                String tipeNilai = selectedTipeNilai[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${index + 1}. $kriteria'),
                    Text('    Tipe Nilai: $tipeNilai'),
                  ],
                );
              }).toList(),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    ];
  }
}
