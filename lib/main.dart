import 'package:flutter/material.dart';
import 'package:penilaian_app/adminlogin_page.dart';
import 'package:penilaian_app/pages/create_lomba_revisi_page.dart';
import 'package:penilaian_app/pages/createlomba_page.dart';
import 'package:penilaian_app/pages/detail_nilai_page.dart';
import 'package:penilaian_app/pages/home.dart';
import 'package:penilaian_app/pages/leaderboard_page.dart';
import 'package:penilaian_app/pages/nilai_peserta_page.dart';
import 'package:penilaian_app/pages/tentang_lomba_page.dart';
import 'package:penilaian_app/splashscreen.dart';
import 'package:penilaian_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Specto App Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TentangLombaPage(),
    );
  }
}

class MyStyle extends StatefulWidget {
  const MyStyle({super.key, required this.title});
  final String title;

  @override
  State<MyStyle> createState() => _MyStyleState();
}

class _MyStyleState extends State<MyStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nunito / Bold / 28', style: boldtTextStyle1),
            Text('Nunito / Bold / 24', style: boldtTextStyle2),
            Text('Nunito / ExtraBold / 16', style: extraBoldTextStyle1),
            Text('Nunito / SemiBold / 16', style: semiBoldTextStyle1),
            Text('Nunito / Light / 16', style: lightTextStyle1),
            Text('Nunito / Bold / 14', style: boldTextStyle3),
            Text('Nunito / Regular / 14', style: regularTextStyle1),
            Text('Nunito / Regular / 12', style: regularTextstyle2),
            Text('Nunito / Regular / 10', style: regularTextStyle3),
          ],
        ),
      ),
    );
  }
}
