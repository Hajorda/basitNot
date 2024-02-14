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
    apiKey: 'AIzaSyCetvSSzJKzR93-qOAKAPK1Rnu3ihcCH2o',
    appId: '1:696578717581:web:482c32987b3c7f05e0afc4',
    messagingSenderId: '696578717581',
    projectId: 'basitnot',
    authDomain: 'basitnot.firebaseapp.com',
    storageBucket: 'basitnot.appspot.com',
    measurementId: 'G-TR65FC5TLD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_4ACew4NJbk7JiiBi1KWTAfk069kx_q0',
    appId: '1:696578717581:android:6b43ccf99f868761e0afc4',
    messagingSenderId: '696578717581',
    projectId: 'basitnot',
    storageBucket: 'basitnot.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAd9svHWDsx4JDmTtRA4TZle2DlJag7zM0',
    appId: '1:696578717581:ios:197fc885e6e43067e0afc4',
    messagingSenderId: '696578717581',
    projectId: 'basitnot',
    storageBucket: 'basitnot.appspot.com',
    iosBundleId: 'com.example.basitnot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAd9svHWDsx4JDmTtRA4TZle2DlJag7zM0',
    appId: '1:696578717581:ios:a0319f601062ef8be0afc4',
    messagingSenderId: '696578717581',
    projectId: 'basitnot',
    storageBucket: 'basitnot.appspot.com',
    iosBundleId: 'com.example.basitnot.RunnerTests',
  );
}
