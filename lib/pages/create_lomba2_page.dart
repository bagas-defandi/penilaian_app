import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  int currentStep = 0;

  final _judulController = TextEditingController();
  final _penyelenggaraController = TextEditingController();
  final _deskripsiController = TextEditingController();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

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
              List<String> allJuri = _juriControllers
                  .map((controller) => controller.text)
                  .toList();

              List<String> allPeserta = _pesertaControllers
                  .map((controller) => controller.text)
                  .toList();

              Map<String, dynamic> lombaMap = {
                "judul": _judulController.text,
                "penyelenggara": _penyelenggaraController.text,
                "deskripsi": _deskripsiController.text,
                "peserta": allPeserta,
                "juri": allJuri,
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
                    child: TextFormField(
                      controller: _jumlahPesertaController,
                      onChanged: (value) => changeJumlahPeserta(value),
                      validator: (value) => value == null ||
                              value.isEmpty ||
                              int.parse(value) == 0
                          ? 'Jumlah Peserta harus lebih dari 0'
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
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
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
                      validator: (value) => value == null ||
                              value.isEmpty ||
                              int.parse(value) == 0
                          ? 'Jumlah Juri harus lebih dari 0'
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
                          child: TextFormField(
                            controller: _juriControllers[index],
                            validator: (value) => value == null || value.isEmpty
                                ? 'Juri ${index + 1} wajib diisi'
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
                              hintText: "Juri ${index + 1}",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 132, 140, 155)),
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
                              _jumlahJuriController.text =
                                  jumlahJuri.toString();
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
                "Penyelenggara Lomba",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2E384E),
                ),
              ),
              const SizedBox(height: 5),
              Text(_penyelenggaraController.text),
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
              ..._juriControllers.asMap().entries.map((e) {
                int index = e.key;
                String juri = e.value.text;
                return Text('${index + 1}. $juri');
              }).toList(),
            ],
          ),
        ),
      ),
    ];
  }
}
