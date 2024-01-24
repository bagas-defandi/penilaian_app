// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBfnfGV5oZx1oavvGI3PU1yJn2xWKLhEoU',
    appId: '1:167173489590:web:a348c4237a6353a3027717',
    messagingSenderId: '167173489590',
    projectId: 'specto-app',
    authDomain: 'specto-app.firebaseapp.com',
    storageBucket: 'specto-app.appspot.com',
    measurementId: 'G-2VTTNKQ7LF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNbkKTT5AofKNqqgTtlfGv_aIhq6e0qW8',
    appId: '1:167173489590:android:2dc98b2733d71197027717',
    messagingSenderId: '167173489590',
    projectId: 'specto-app',
    storageBucket: 'specto-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcVAWCX9HVgaHaOYJ0zH7_fLrPxT6YRHE',
    appId: '1:167173489590:ios:4e38ee5b260b9ce4027717',
    messagingSenderId: '167173489590',
    projectId: 'specto-app',
    storageBucket: 'specto-app.appspot.com',
    iosBundleId: 'com.example.penilaianApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcVAWCX9HVgaHaOYJ0zH7_fLrPxT6YRHE',
    appId: '1:167173489590:ios:cb1d4cee966d23b7027717',
    messagingSenderId: '167173489590',
    projectId: 'specto-app',
    storageBucket: 'specto-app.appspot.com',
    iosBundleId: 'com.example.penilaianApp.RunnerTests',
  );
}