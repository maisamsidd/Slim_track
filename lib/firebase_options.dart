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
    apiKey: 'AIzaSyAnLBQd5XqUWNDYrIQiwf7o3x9oS8_Ts-o',
    appId: '1:818741741246:web:117fd75338b99a703480ef',
    messagingSenderId: '818741741246',
    projectId: 'slim-track-42171',
    authDomain: 'slim-track-42171.firebaseapp.com',
    storageBucket: 'slim-track-42171.appspot.com',
    measurementId: 'G-RNZRTRPN5M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDeZLQ7YIJmjvMYLyWn3Y_AWdEj2HbKWc',
    appId: '1:818741741246:android:7020a83fe24bbc403480ef',
    messagingSenderId: '818741741246',
    projectId: 'slim-track-42171',
    storageBucket: 'slim-track-42171.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByOmx8aAZwrbCHwijxQJ_oWxLSTgPBNVo',
    appId: '1:818741741246:ios:abd03019af3202ea3480ef',
    messagingSenderId: '818741741246',
    projectId: 'slim-track-42171',
    storageBucket: 'slim-track-42171.appspot.com',
    iosBundleId: 'com.example.slimTrack',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByOmx8aAZwrbCHwijxQJ_oWxLSTgPBNVo',
    appId: '1:818741741246:ios:abd03019af3202ea3480ef',
    messagingSenderId: '818741741246',
    projectId: 'slim-track-42171',
    storageBucket: 'slim-track-42171.appspot.com',
    iosBundleId: 'com.example.slimTrack',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnLBQd5XqUWNDYrIQiwf7o3x9oS8_Ts-o',
    appId: '1:818741741246:web:a4982e5cdab78f8c3480ef',
    messagingSenderId: '818741741246',
    projectId: 'slim-track-42171',
    authDomain: 'slim-track-42171.firebaseapp.com',
    storageBucket: 'slim-track-42171.appspot.com',
    measurementId: 'G-CHKQXGB035',
  );
}
