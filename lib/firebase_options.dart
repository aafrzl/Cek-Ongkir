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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA80K5fpQzERbnayKQvee8DnD8LFI-Mw50',
    appId: '1:832716280171:android:754c45a63545cd966bfc2e',
    messagingSenderId: '832716280171',
    projectId: 'jccbootcamp-2c701',
    storageBucket: 'jccbootcamp-2c701.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNG5fdXT03RDhplgbzGskQDqi-Xec2pfc',
    appId: '1:832716280171:ios:3e95b7b429f81d926bfc2e',
    messagingSenderId: '832716280171',
    projectId: 'jccbootcamp-2c701',
    storageBucket: 'jccbootcamp-2c701.appspot.com',
    androidClientId: '832716280171-iptnvob3potjaj6t7jkd32knhhhbu498.apps.googleusercontent.com',
    iosClientId: '832716280171-r90rir2ulr77mt7sgnbgdf2gpndhvr1u.apps.googleusercontent.com',
    iosBundleId: 'com.ongkirapp.ongkirapp',
  );
}
