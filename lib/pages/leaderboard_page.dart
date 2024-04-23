import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';
import 'package:penilaian_app/widgets/tab_leaderboard_umum.dart';
import 'package:penilaian_app/widgets/tab_leaderboard_detail.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Papan Peringkat',
            style: boldtTextStyle1.copyWith(color: neutralWhiteColor),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('assets/images/icon/button_back.png'),
          ),
          centerTitle: true,
        ),
        backgroundColor: primaryColor,
        body: Column(
          children: [
            TabBar(
              labelColor: neutralWhiteColor,
              tabs: [
                Tab(text: "Umum"),
                Tab(text: "Detail"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TabUmum(),
                  TabDetail(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
