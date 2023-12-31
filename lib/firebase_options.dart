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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC7Q4MCV1amB_aCJnAQPqlaAzdU5Y7QBdY',
    appId: '1:759272314808:web:cbc540963934ac4876e14d',
    messagingSenderId: '759272314808',
    projectId: 'jpflutter4b',
    authDomain: 'jpflutter4b.firebaseapp.com',
    storageBucket: 'jpflutter4b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyOQvvFI2q8RR5VREKnUUAT_YBJDbYcoE',
    appId: '1:759272314808:android:6ba151b033a20ee276e14d',
    messagingSenderId: '759272314808',
    projectId: 'jpflutter4b',
    storageBucket: 'jpflutter4b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChm_ic9Q8HIgN4xhv8xc3hZzicF8U8gQA',
    appId: '1:759272314808:ios:f01a29fbcd35a4df76e14d',
    messagingSenderId: '759272314808',
    projectId: 'jpflutter4b',
    storageBucket: 'jpflutter4b.appspot.com',
    iosBundleId: 'com.example.newapp8',
  );
}
