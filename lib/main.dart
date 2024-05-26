import 'package:flutter/material.dart';
import 'package:penilaian_app/pages/account_page.dart';
import 'package:penilaian_app/pages/login_page.dart';
import 'package:penilaian_app/pages/auth_page.dart';
import 'package:penilaian_app/pages/create_lomba_page.dart';
import 'package:penilaian_app/pages/detail_nilai_page.dart';
import 'package:penilaian_app/pages/form_penilaian_page.dart';
import 'package:penilaian_app/pages/home.dart';
import 'package:penilaian_app/pages/leaderboard_page.dart';
import 'package:penilaian_app/pages/nilai_peserta_page.dart';
import 'package:penilaian_app/pages/tambah_juri.dart';
import 'package:penilaian_app/pages/tentang_lomba_page.dart';
import 'package:penilaian_app/pages/juri_page.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(106, 90, 224, 1),
          primary: const Color.fromRGBO(106, 90, 224, 1),
          secondary: const Color.fromRGBO(0, 24, 51, 1),
          tertiary: const Color.fromRGBO(248, 248, 248, 1),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        "/auth": (context) => const AuthPage(),
        "/manage-juri": (context) => const JuriPage(),
        "/tambah-juri": (context) => const TambahJuriPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/create-lomba": (context) => const CreateLombaPage(),
        "/tentang-lomba": (context) => const TentangLombaPage(),
        "/detail-nilai": (context) => const DetailNilaiPage(),
        "/nilai-peserta": (context) => const NilaiPesertaPage(),
        "/leaderbord": (context) => const LeaderBoard(),
        "/account-page": (context) => const AccountPage(),
        "/form-penilaian": (context) => const FormPenilaianPage(),
      },
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
