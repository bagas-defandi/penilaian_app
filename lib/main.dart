import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
