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
    apiKey: 'AIzaSyBUMHcJueWs9-7dDCKZu5qpT33mSLX_9BU',
    appId: '1:247231387059:web:eb65430d8028473e5fe7c6',
    messagingSenderId: '247231387059',
    projectId: 'tugasakhir-41d43',
    authDomain: 'tugasakhir-41d43.firebaseapp.com',
    databaseURL: 'https://tugasakhir-41d43-default-rtdb.firebaseio.com',
    storageBucket: 'tugasakhir-41d43.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWJ3q90-iaP63ukfiT9RO3Xswi3-6ejZk',
    appId: '1:247231387059:android:69134827008bf5725fe7c6',
    messagingSenderId: '247231387059',
    projectId: 'tugasakhir-41d43',
    databaseURL: 'https://tugasakhir-41d43-default-rtdb.firebaseio.com',
    storageBucket: 'tugasakhir-41d43.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvE0AxmIuEi2EViC6ZHeeDT2m8hSk7CRA',
    appId: '1:247231387059:ios:f578af36837d654a5fe7c6',
    messagingSenderId: '247231387059',
    projectId: 'tugasakhir-41d43',
    databaseURL: 'https://tugasakhir-41d43-default-rtdb.firebaseio.com',
    storageBucket: 'tugasakhir-41d43.appspot.com',
    iosBundleId: 'com.example.csvTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvE0AxmIuEi2EViC6ZHeeDT2m8hSk7CRA',
    appId: '1:247231387059:ios:8001985c746b301f5fe7c6',
    messagingSenderId: '247231387059',
    projectId: 'tugasakhir-41d43',
    databaseURL: 'https://tugasakhir-41d43-default-rtdb.firebaseio.com',
    storageBucket: 'tugasakhir-41d43.appspot.com',
    iosBundleId: 'com.example.csvTest.RunnerTests',
  );
}
