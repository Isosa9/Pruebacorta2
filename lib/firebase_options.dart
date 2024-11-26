// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBU1tm_YVyr7SDhCecpSDH8DtRIqgbFu1Y',
    appId: '1:100396912828:web:619fb79b72760cbb2b80b9',
    messagingSenderId: '100396912828',
    projectId: 'pruebacorta-26417',
    authDomain: 'pruebacorta-26417.firebaseapp.com',
    storageBucket: 'pruebacorta-26417.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQl9gcf-Xn_Qlit_Z58cEX5r_OthDBP9Q',
    appId: '1:100396912828:android:55241079d3c226e02b80b9',
    messagingSenderId: '100396912828',
    projectId: 'pruebacorta-26417',
    storageBucket: 'pruebacorta-26417.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDat99hvj3-Z1GbrvugbsM-_gBruQ0M-KU',
    appId: '1:100396912828:ios:296e7ffd6ee11f362b80b9',
    messagingSenderId: '100396912828',
    projectId: 'pruebacorta-26417',
    storageBucket: 'pruebacorta-26417.firebasestorage.app',
    iosBundleId: 'com.example.flutterMetodopruebaisis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDat99hvj3-Z1GbrvugbsM-_gBruQ0M-KU',
    appId: '1:100396912828:ios:296e7ffd6ee11f362b80b9',
    messagingSenderId: '100396912828',
    projectId: 'pruebacorta-26417',
    storageBucket: 'pruebacorta-26417.firebasestorage.app',
    iosBundleId: 'com.example.flutterMetodopruebaisis',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBU1tm_YVyr7SDhCecpSDH8DtRIqgbFu1Y',
    appId: '1:100396912828:web:de8e8764bedb9e802b80b9',
    messagingSenderId: '100396912828',
    projectId: 'pruebacorta-26417',
    authDomain: 'pruebacorta-26417.firebaseapp.com',
    storageBucket: 'pruebacorta-26417.firebasestorage.app',
  );
}