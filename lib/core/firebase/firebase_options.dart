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
    apiKey: 'AIzaSyClpQlH--GGpkfM9IP-xQJZT6geaAs8-Ns',
    appId: '1:994492665303:web:10dd81ba11ba2cac7f4f92',
    messagingSenderId: '994492665303',
    projectId: 'minimalist-social-app',
    authDomain: 'minimalist-social-app.firebaseapp.com',
    storageBucket: 'minimalist-social-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-F_dSJYHxqPVI27SyQQTZic1cw0jHMFs',
    appId: '1:994492665303:android:de36bc267c239fc77f4f92',
    messagingSenderId: '994492665303',
    projectId: 'minimalist-social-app',
    storageBucket: 'minimalist-social-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXqW17hcF16RP3nd4REYrbsk6hBPWNfic',
    appId: '1:994492665303:ios:107290bb87b892437f4f92',
    messagingSenderId: '994492665303',
    projectId: 'minimalist-social-app',
    storageBucket: 'minimalist-social-app.appspot.com',
    iosBundleId: 'com.example.minimalistSocialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXqW17hcF16RP3nd4REYrbsk6hBPWNfic',
    appId: '1:994492665303:ios:841b87d574b8cfcf7f4f92',
    messagingSenderId: '994492665303',
    projectId: 'minimalist-social-app',
    storageBucket: 'minimalist-social-app.appspot.com',
    iosBundleId: 'com.example.minimalistSocialApp.RunnerTests',
  );
}
