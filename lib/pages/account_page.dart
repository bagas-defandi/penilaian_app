import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:penilaian_app/pages/adminlogin_page.dart';
import 'package:penilaian_app/pages/home.dart';
import 'package:penilaian_app/theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 15, left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Icon(Icons.arrow_back_ios_new),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: PrimaryColor,
                            backgroundColor: NeutralWhiteColor,
                            shape: CircleBorder(),
                            minimumSize: Size(10, 60),
                          )),
                    ),
                    Text(
                      "My Account",
                      style: boldtTextStyle1.copyWith(color: PrimaryColor),
                    ),
                  ],
                ),
              ),
              // BASIC INFORMATION
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: NeutralWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Basic Information",
                      style: boldTextStyle3.copyWith(color: PrimaryColor),
                    ),
                  )),
              // StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection("User")
              //         .where("email", isEqualTo: currentUser.currentUser!.email)
              //         .snapshots(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //             itemCount: snapshot.data!.docs.length,
              //             shrinkWrap: true,
              //             itemBuilder: (context, i) {
              //               var data = snapshot.data!.docs[i];
              //               return ListTile(
              //                 leading: Icon(
              //                   Icons.person,
              //                   color: PrimaryColor,
              //                 ),
              //                 title: Text(
              //                   'Full Name',
              //                   style: regularTextStyle1.copyWith(
              //                       color: PrimaryColor, fontSize: 12),
              //                 ),
              //                 subtitle: Text(
              //                   data['fullName'],
              //                   style: regularTextStyle1.copyWith(
              //                       color: PrimaryColor, fontSize: 14),
              //                 ),
              //               );
              //             });
              //       } else {
              //         return CircularProgressIndicator();
              //       }
              //     }),
              // StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection("User")
              //         .where("email", isEqualTo: currentUser.currentUser!.email)
              //         .snapshots(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //             itemCount: snapshot.data!.docs.length,
              //             shrinkWrap: true,
              //             itemBuilder: (context, i) {
              //               var data = snapshot.data!.docs[i];
              //               return ListTile(
              //                 leading: Icon(
              //                   Icons.email_rounded,
              //                   color: PrimaryColor,
              //                 ),
              //                 title: Text(
              //                   'Email',
              //                   style: regularTextStyle1.copyWith(
              //                       color: PrimaryColor, fontSize: 12),
              //                 ),
              //                 subtitle: Text(
              //                   data['email'],
              //                   style: regularTextStyle1.copyWith(
              //                       color: PrimaryColor, fontSize: 14),
              //                 ),
              //               );
              //             });
              //       } else {
              //         return CircularProgressIndicator();
              //       }
              //     }),
              // BASIC INFORMATION

              // LINKS
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: NeutralWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Links",
                          style: boldTextStyle3.copyWith(color: PrimaryColor),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: PrimaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "About the app",
                            style:
                                regularTextStyle1.copyWith(color: PrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // LINKS

              // PRIVACY
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: NeutralWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Privacy",
                          style: boldTextStyle3.copyWith(color: PrimaryColor),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sticky_note_2_rounded,
                            color: PrimaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Terms of use",
                            style:
                                regularTextStyle1.copyWith(color: PrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.privacy_tip_rounded,
                            color: PrimaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Privacy Policy",
                            style:
                                regularTextStyle1.copyWith(color: PrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // PRIVACY

              // ACCOUNT SETTINGS
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: NeutralWhiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Account Settings",
                          style: boldTextStyle3.copyWith(color: PrimaryColor),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.password_rounded,
                            color: PrimaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Change Password",
                            style:
                                regularTextStyle1.copyWith(color: PrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: PrimaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign Out",
                            style:
                                regularTextStyle1.copyWith(color: PrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              print("Signed Out");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginAdmin()));
                            });
                          },
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ACCOUNT SETTING
            ],
          ),
        ),
      ),
    );
  }
}
