import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:penilaian_app/models/user_model.dart';
import 'package:penilaian_app/services/firestore.dart';

class TambahJuriPage extends StatefulWidget {
  const TambahJuriPage({super.key});

  @override
  State<TambahJuriPage> createState() => _TambahJuriPageState();
}

class _TambahJuriPageState extends State<TambahJuriPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Juri'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Nama Lengkap wajib diisi'
                    : null,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Email wajib diisi' : null,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Password wajib diisi'
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      showLoadingCircle();
                      try {
                        // Perform registration logic here
                        String email = emailController.text.trim();
                        String fullName = fullNameController.text.trim();
                        String password = passwordController.text;

                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        final newUser = UserModel(
                          uid: userCredential.user!.uid,
                          nama: fullName,
                          email: email,
                          role: 'juri',
                        );

                        firestoreService.addJuri(newUser);

                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: "admin.lkpm@gmail.com",
                            password: 'admin123');

                        if (context.mounted) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      } on FirebaseAuthException catch (e) {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                        debugPrint(e.toString());
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLoadingCircle() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
