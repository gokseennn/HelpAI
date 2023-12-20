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
    apiKey: 'AIzaSyB26d2Y7-q8M5z9xOf2M1SmSFsHc6UsRMA',
    appId: '1:570810258490:web:4a4338a2ecefc9dd611103',
    messagingSenderId: '570810258490',
    projectId: 'helpai-8b12b',
    authDomain: 'helpai-8b12b.firebaseapp.com',
    storageBucket: 'helpai-8b12b.appspot.com',
    measurementId: 'G-WJXZ8YHZ37',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOhYjHMk60nC4m4TBmNEsB47QXYqZzc_M',
    appId: '1:570810258490:android:f1b44a1d2c6ac0ce611103',
    messagingSenderId: '570810258490',
    projectId: 'helpai-8b12b',
    storageBucket: 'helpai-8b12b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvUuiuquf7r9C3uXpkdCn8sM51lzOgrNM',
    appId: '1:570810258490:ios:e1b60bacf264eaa7611103',
    messagingSenderId: '570810258490',
    projectId: 'helpai-8b12b',
    storageBucket: 'helpai-8b12b.appspot.com',
    iosBundleId: 'com.example.helpai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvUuiuquf7r9C3uXpkdCn8sM51lzOgrNM',
    appId: '1:570810258490:ios:75efc2db1d23fb8f611103',
    messagingSenderId: '570810258490',
    projectId: 'helpai-8b12b',
    storageBucket: 'helpai-8b12b.appspot.com',
    iosBundleId: 'com.example.helpai.RunnerTests',
  );
}
