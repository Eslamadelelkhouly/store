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
    apiKey: 'AIzaSyAz9ZBI6jcc8cSirOukRy959hPee5CHS0s',
    appId: '1:797477995947:web:1030b8d8843f0560e3feee',
    messagingSenderId: '797477995947',
    projectId: 'store-26c4d',
    authDomain: 'store-26c4d.firebaseapp.com',
    storageBucket: 'store-26c4d.firebasestorage.app',
    measurementId: 'G-8HZMCEYPQJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhQ-nqPZSseJ_ov5moXXnjxMfMc18rfrU',
    appId: '1:797477995947:android:f62f3bd30bbbc8dbe3feee',
    messagingSenderId: '797477995947',
    projectId: 'store-26c4d',
    storageBucket: 'store-26c4d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUpYSEMOVOAmXuMJ6G-02_A0pF5u9EA_4',
    appId: '1:797477995947:ios:3a01981df8b44f15e3feee',
    messagingSenderId: '797477995947',
    projectId: 'store-26c4d',
    storageBucket: 'store-26c4d.firebasestorage.app',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUpYSEMOVOAmXuMJ6G-02_A0pF5u9EA_4',
    appId: '1:797477995947:ios:3a01981df8b44f15e3feee',
    messagingSenderId: '797477995947',
    projectId: 'store-26c4d',
    storageBucket: 'store-26c4d.firebasestorage.app',
    iosBundleId: 'com.example.store',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAz9ZBI6jcc8cSirOukRy959hPee5CHS0s',
    appId: '1:797477995947:web:edd1ab0e30a0380ae3feee',
    messagingSenderId: '797477995947',
    projectId: 'store-26c4d',
    authDomain: 'store-26c4d.firebaseapp.com',
    storageBucket: 'store-26c4d.firebasestorage.app',
    measurementId: 'G-PNV45SL76Y',
  );
}
