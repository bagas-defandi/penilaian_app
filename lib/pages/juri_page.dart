import 'package:flutter/material.dart';
import 'package:penilaian_app/components/app_drawer.dart';

class JuriPage extends StatelessWidget {
  const JuriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Juri'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Text('Tes'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/tambah-juri");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
