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
    apiKey: 'AIzaSyBGZJrgycUNWhW-EXMin_2N2lxoqQrfQPM',
    appId: '1:523068078231:web:a0fbc41f5b4057495191d2',
    messagingSenderId: '523068078231',
    projectId: 'one-minutes-memo',
    authDomain: 'one-minutes-memo.firebaseapp.com',
    storageBucket: 'one-minutes-memo.appspot.com',
    measurementId: 'G-L17V591H7S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXLEUObnb7MPib2osyoRRxcjoygomV5dM',
    appId: '1:523068078231:android:1cb86f53e7cefda45191d2',
    messagingSenderId: '523068078231',
    projectId: 'one-minutes-memo',
    storageBucket: 'one-minutes-memo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBII9dmJKzNHSOl6SAlGhfhmRIIn7AwDg0',
    appId: '1:523068078231:ios:c9004be1a7b965b95191d2',
    messagingSenderId: '523068078231',
    projectId: 'one-minutes-memo',
    storageBucket: 'one-minutes-memo.appspot.com',
    iosBundleId: 'com.ktd.one.minutes.memo.oneMinutesMemo.personal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBII9dmJKzNHSOl6SAlGhfhmRIIn7AwDg0',
    appId: '1:523068078231:ios:0f5d898528b36b7d5191d2',
    messagingSenderId: '523068078231',
    projectId: 'one-minutes-memo',
    storageBucket: 'one-minutes-memo.appspot.com',
    iosClientId: '523068078231-rdafp6gic4vgpokd4boc265loqmekcuc.apps.googleusercontent.com',
    iosBundleId: 'com.ktd.one.minutes.memo.oneMinutesMemo',
  );
}
