import 'dart:io';

void main() {
  print('🔍 Checking Firebase Setup...\n');
  
  // Check if firebase_options.dart exists
  final firebaseOptions = File('lib/firebase_options.dart');
  if (firebaseOptions.existsSync()) {
    print('✅ firebase_options.dart found');
  } else {
    print('❌ firebase_options.dart NOT found');
    print('   Run: flutterfire configure');
  }
  
  // Check if google-services.json exists (Android)
  final googleServices = File('android/app/google-services.json');
  if (googleServices.existsSync()) {
    print('✅ google-services.json found');
  } else {
    print('❌ google-services.json NOT found');
    print('   Download from Firebase Console → Project Settings');
  }
  
  // Check if GoogleService-Info.plist exists (iOS)
  final googleServicePlist = File('ios/Runner/GoogleService-Info.plist');
  if (googleServicePlist.existsSync()) {
    print('✅ GoogleService-Info.plist found');
  } else {
    print('⚠️  GoogleService-Info.plist NOT found (iOS only)');
  }
  
  print('\n📋 Next Steps:');
  print('1. Create Firebase project at https://console.firebase.google.com/');
  print('2. Run: flutterfire configure');
  print('3. Enable Google Sign-In in Firebase Console');
  print('4. Get SHA-1: cd android && gradlew.bat signingReport');
  print('5. Add SHA-1 to Firebase Project Settings');
  print('6. Download google-services.json to android/app/');
  print('7. Run: flutter run');
  
  print('\n🎯 Current Status:');
  if (firebaseOptions.existsSync() && googleServices.existsSync()) {
    print('✅ Ready for Google Sign-In!');
  } else {
    print('⏳ Setup incomplete - follow steps above');
  }
}