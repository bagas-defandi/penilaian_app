import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:penilaian_app/components/app_drawer.dart';
import 'package:penilaian_app/services/firestore.dart';
import 'package:penilaian_app/widgets/card_carousel.dart';
import 'package:penilaian_app/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar perangkat
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/bg-homescreen.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder(
          future: firestoreService.getUserInfo(user.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              bool isAdmin = snapshot.data?['role'] == 'admin';
              return Scaffold(
                drawer: AppDrawer(isAdmin: isAdmin),
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'Home',
                    style: boldtTextStyle1.copyWith(color: neutralWhiteColor),
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Profile Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              "/account-page",
                            );
                          },
                          child: const Image(
                            image: AssetImage(
                                'assets/images/icon/Profile_icon.png'),
                          ),
                        ),
                        const SizedBox(width: 29),
                        Column(
                          children: [
                            Text(
                              'Selamat Datang!',
                              style: semiBoldTextStyle1.copyWith(
                                  color: neutralWhiteColor),
                            ),
                            Text(
                              snapshot.data?['nama'],
                              style: extraBoldTextStyle1.copyWith(
                                  color: neutralWhiteColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 18),

                    // SEARCH BOX
                    Container(
                      width: 325,
                      height: 56,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(82, 69, 175, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 29.0),
                        child: TextField(
                          controller: _searchController,
                          style: lightTextStyle1.copyWith(
                              color: neutralWhiteColor),
                          cursorColor: primaryColor,
                          // onChanged: (query) {
                          //   _performSearch(query);
                          // },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.search,
                                color: neutralWhiteColor.withOpacity(0.5),
                              ),
                              hintText: "Cari Lomba",
                              hintStyle: lightTextStyle1.copyWith(
                                  color: neutralWhiteColor.withOpacity(0.5),
                                  fontSize: 14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 43),

                    // CAROUSEL SECTION
                    const CardCarousel(),
                    const SizedBox(height: 49),

                    // LOMBA LAINNYA SECTION
                    Container(
                      decoration: BoxDecoration(
                        color: neutralWhiteColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                      margin: const EdgeInsets.only(bottom: 0),
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lomba Lainnya',
                            style: extraBoldTextStyle1.copyWith(fontSize: 20),
                          ),
                          (isAdmin)
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/create-lomba");
                                  },
                                  child: Image.asset(
                                      'assets/images/icon/button_Add.png'),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    // CARD LOMBA
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 0),
                        width: screenWidth,
                        color: neutralWhiteColor,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: StreamBuilder(
                            stream: firestoreService.getLombasStream(),
                            builder: (context, snapshot) {
                              List lombasList = snapshot.data?.docs ?? [];
                              int jumlahLomba = lombasList.length;

                              if (lombasList.isEmpty) {
                                return const Center(
                                  child: Text("Belum ada lomba yang dibuat"),
                                );
                              }

                              return SingleChildScrollView(
                                child: SizedBox(
                                  height: jumlahLomba.isEven
                                      ? (jumlahLomba / 2) * 195
                                      : ((jumlahLomba / 2) + 0.5) * 195,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 25,
                                      crossAxisSpacing: 20,
                                      // mainAxisExtent: 210,
                                    ),
                                    itemCount: jumlahLomba,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot lomba =
                                          lombasList[index];
                                      return InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromRGBO(201, 84, 84, 1),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  "assets/images/example.png"),
                                              const SizedBox(height: 15),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      lomba['judul'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      bottomSheet(lomba);
                                                    },
                                                    child: Icon(
                                                      Icons.more_vert,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }

  Future bottomSheet(DocumentSnapshot lomba) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  lomba['judul'],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              onTap: () {},
              title: const Text('Edit Lomba'),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              onTap: () {},
              title: const Text('Hapus Lomba'),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/form-penilaian", arguments: {
                  'id': lomba.id,
                  'judul': lomba['judul'],
                  'kriteria': lomba['kriteria'],
                });
              },
              title: const Text('Tambah Form Penilaian'),
            ),
          ],
        );
      },
    );
  }
}
