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
    apiKey: 'AIzaSyBeVeAaO14UEOrqB-lKsE730L08QSUMqfo',
    appId: '1:363121053378:web:54c9a28ad6516dc9ebf55b',
    messagingSenderId: '363121053378',
    projectId: 'bus-ticketing-system-37cd5',
    authDomain: 'bus-ticketing-system-37cd5.firebaseapp.com',
    storageBucket: 'bus-ticketing-system-37cd5.appspot.com',
    measurementId: 'G-VJXMQ5S1E4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCofYtLAfZdkQZj65nCvLx1rJErVkToGfE',
    appId: '1:363121053378:android:1967b49fe10ce668ebf55b',
    messagingSenderId: '363121053378',
    projectId: 'bus-ticketing-system-37cd5',
    storageBucket: 'bus-ticketing-system-37cd5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEcXoybl0Ox2tilLn-4HYPJ6c8qPjbFkk',
    appId: '1:363121053378:ios:c77bd265ef656347ebf55b',
    messagingSenderId: '363121053378',
    projectId: 'bus-ticketing-system-37cd5',
    storageBucket: 'bus-ticketing-system-37cd5.appspot.com',
    iosClientId: '363121053378-sb7pol3122v7ra3qn3meh96g08qa8mn8.apps.googleusercontent.com',
    iosBundleId: 'com.ticketing.ticketingsystem',
  );
}
