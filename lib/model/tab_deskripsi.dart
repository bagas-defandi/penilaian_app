import 'package:flutter/material.dart';
import 'package:penilaian_app/theme.dart';

class BuildDeskripsi extends StatefulWidget {
  const BuildDeskripsi({super.key});

  @override
  State<BuildDeskripsi> createState() => _BuildDeskripsiState();
}

class _BuildDeskripsiState extends State<BuildDeskripsi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/example_Poster.png'),
                  Text(
                    "Gambar Lomba",
                    style: extraBoldTextStyle2.copyWith(
                      color: PrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 35),
          Text("Lomba Cerdas Cermat",
              style: boldtTextStyle2.copyWith(color: Colors.black)),
          Text("Universitas Jambi",
              style: lightTextStyle1.copyWith(color: Colors.black)),
          const SizedBox(height: 40),
          Text("Deskripsi",
              style: extraBoldTextStyle1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
          Text(
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod hic velit perspiciatis, labore quos deleniti praesentium ullam dolore fugiat optio. Aliquam pariatur odit animi nesciunt eligendi atque repudiandae perferendis autem.',
            style: lightTextStyle1.copyWith(color: Colors.black),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
