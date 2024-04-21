import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penilaian_app/services/firestore.dart';

class FormPenilaianPage extends StatefulWidget {
  const FormPenilaianPage({super.key});

  @override
  State<FormPenilaianPage> createState() => _FormPenilaianPageState();
}

class _FormPenilaianPageState extends State<FormPenilaianPage> {
  int currentStep = 0;
  String id = "";
  String judul = "";
  List kriteria = [];

  final FirestoreService firestoreService = FirestoreService();

  List<List<TextEditingController>> kriteriaNilaiControllers = [];
  List<List<TextEditingController>> kriteriaNilaiPersenControllers = [];
  List<Widget> konfirmasiWidget = [];
  List<Widget> keteranganWidget = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    id = arguments['id'] as String;
    kriteria = arguments['kriteria'] as List;
    judul = arguments['judul'] as String;

    // kriteriaNilaiControllers = List.generate(
    //   kriteria.length,
    //   (index) => [TextEditingController()],
    // );

    // kriteriaNilaiPersenControllers = List.generate(
    //   kriteria.length,
    //   (index) => [TextEditingController()],
    // );

    if (kriteriaNilaiControllers.isEmpty) {
      for (var el in kriteria) {
        kriteriaNilaiControllers.add([TextEditingController()]);
        kriteriaNilaiPersenControllers.add([TextEditingController()]);
        konfirmasiWidget.add(
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              el['judul'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        keteranganWidget.add(
          Column(
            children: [
              Text(
                el['judul'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
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
                              hintText: "Isi Kriteria ${index + 1}",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 132, 140, 155)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
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
            ],
          ),
        );
      }
    }

    List<Step> steps = List.generate(
      kriteria.length,
      (stepIndex) => Step(
        state: currentStep > stepIndex ? StepState.complete : StepState.indexed,
        isActive: currentStep >= stepIndex,
        title: Text(kriteria[stepIndex]['judul']),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton.filled(
                onPressed: () {
                  setState(() {
                    kriteriaNilaiControllers[stepIndex]
                        .add(TextEditingController());
                    kriteriaNilaiPersenControllers[stepIndex]
                        .add(TextEditingController());
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
              itemCount: kriteriaNilaiControllers[stepIndex].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          controller: kriteriaNilaiControllers[stepIndex]
                              [index],
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
                            hintText: "Isi Kriteria ${index + 1}",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 132, 140, 155)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: kriteriaNilaiPersenControllers[stepIndex]
                              [index],
                          textAlign: TextAlign.center,
                          keyboardType: const TextInputType.numberWithOptions(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          if (kriteriaNilaiControllers[stepIndex].length > 1) {
                            setState(() {
                              kriteriaNilaiControllers[stepIndex][index]
                                  .clear();
                              kriteriaNilaiControllers[stepIndex][index]
                                  .dispose();
                              kriteriaNilaiControllers[stepIndex]
                                  .removeAt(index);
                              kriteriaNilaiPersenControllers[stepIndex][index]
                                  .clear();
                              kriteriaNilaiPersenControllers[stepIndex][index]
                                  .dispose();
                              kriteriaNilaiPersenControllers[stepIndex]
                                  .removeAt(index);
                            });
                          }
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
          ],
        ),
      ),
    );

    steps.add(
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("Keterangan"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: keteranganWidget,
        ),
      ),
    );

    // steps.add(konfirmasi());
    steps.add(
      Step(
        title: const Text('Konfirmasi'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: konfirmasiWidget,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: BackButton(color: Theme.of(context).colorScheme.tertiary),
        title: Text(
          "Form Penilaian",
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                judul,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stepper(
              physics: const NeverScrollableScrollPhysics(),
              type: StepperType.vertical,
              currentStep: currentStep,
              steps: steps,
              onStepContinue: () {
                final isLastStep = currentStep == steps.length - 1;
                final stepBeforeLast = currentStep == steps.length - 2;
                if (isLastStep) {
                  // send data to server

                  // Navigator.pop(context);
                } else if (stepBeforeLast) {
                  setState(() {
                    currentStep += 1;
                  });
                } else {
                  // if (!formKeys[currentStep].currentState!.validate()) {
                  //   return;
                  // }
                  setState(() {
                    konfirmasiWidget.insert(
                      (2 * currentStep) + 1,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: kriteriaNilaiControllers[currentStep]
                            .asMap()
                            .entries
                            .map((e) {
                          int index = e.key;
                          String kriteria = e.value.text;
                          String kriteriaNilai =
                              kriteriaNilaiPersenControllers[currentStep][index]
                                  .text;
                          return Text(
                              '${index + 1}. $kriteria ${kriteriaNilai == '' ? '0' : kriteriaNilai}%');
                        }).toList(),
                      ),
                    );
                    currentStep += 1;
                  });
                }
              },
              onStepCancel: () {
                final firstStep = currentStep == 0;
                final lastStep = currentStep == steps.length - 1;
                if (firstStep) {
                  return;
                } else if (lastStep) {
                  setState(() {
                    currentStep -= 1;
                  });
                } else {
                  setState(() {
                    konfirmasiWidget.removeAt((2 * currentStep) - 1);
                    currentStep -= 1;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Step konfirmasi() {
    return const Step(
      title: Text("Konfirmasi"),
      content: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Judul Lomba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF2E384E),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Penyelenggara Lomba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF2E384E),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Deskripsi Lomba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF2E384E),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Peserta Lomba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF2E384E),
              ),
            ),
            Text(
              "Juri Lomba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF2E384E),
              ),
            ),
            Text(
              "Penilaian Lomba",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF2E384E),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
