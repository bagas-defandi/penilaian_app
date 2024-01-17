import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class CardWidget extends StatelessWidget {
  // final CardWidget card;

  // const CardWidget({required this.card, Key? key}) : super(key: key);

  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) {
        return Card(
          color: Colors.blueGrey,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset('assets/images/example.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Judul Lomba',
                      style:
                          regularTextStyle1.copyWith(color: NeutralWhiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 8.0,
        children: _buildGridCards(10));
  }
}

// class CardItem {
//   final String title;
//   final String creator;
//   final String imagePath;
//   final String category;

//   CardItem(this.title, this.creator, this.imagePath, this.category);
// }

// List<CardItem> allCards = [
//   CardItem(
//     'Lomba Cerdas Cermat',
//     'Universitas Jambi',
//     'assets/images/example.png',
//     'Umum',
//   )
// ];
// List<CardItem> filteredCards = [];
