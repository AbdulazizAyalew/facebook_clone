# Firebase Setup Guide for Google Sign-In

## Step 1: Install Dependencies

```bash
cd facebookclone
flutter pub get
```

## Step 2: Install Firebase CLI

```bash
npm install -g firebase-tools
```

## Step 3: Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

## Step 4: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click **"Add project"**
3. Enter project name: `facebook-clone-app`
4. Disable Google Analytics (optional)
5. Click **"Create project"**

## Step 5: Configure Firebase for Flutter

Run this command in the `facebookclone` directory:

```bash
flutterfire configure
```

This will:
- Ask you to select your Firebase project
- Automatically configure Android and iOS apps
- Generate `firebase_options.dart` file
- Update your app configuration

## Step 6: Enable Authentication

1. In Firebase Console, go to **Authentication**
2. Click **"Get started"**
3. Go to **"Sign-in method"** tab
4. Click on **Google** provider
5. Toggle **"Enable"**
6. Select a support email from dropdown
7. Click **"Save"**

## Step 7: Configure Android for Google Sign-In

### Get SHA-1 Certificate Fingerprint

```bash
cd facebookclone/android
./gradlew signingReport
```

On Windows:
```bash
cd facebookclone/android
gradlew.bat signingReport
```

Look for the **SHA-1** fingerprint in the output (usually under `debug` variant).

### Add SHA-1 to Firebase

1. In Firebase Console, go to **Project Settings** (gear icon)
2. Scroll down to **"Your apps"** section
3. Click on your Android app
4. Click **"Add fingerprint"**
5. Paste the SHA-1 fingerprint
6. Click **"Save"**

## Step 8: Download Configuration Files

### For Android:
1. In Firebase Console → Project Settings
2. Under **"Your apps"**, find your Android app
3. Click **"Download google-services.json"**
4. Place it in `facebookclone/android/app/` directory

### For iOS (if needed):
1. Download **"GoogleService-Info.plist"**
2. Place it in `facebookclone/ios/Runner/` directory

## Step 9: Test the Setup

```bash
cd facebookclone
flutter run
```

## Troubleshooting

### Common Issues:

1. **"Firebase not configured" error**
   - Make sure `firebase_options.dart` exists in `lib/`
   - Run `flutterfire configure` again

2. **Google Sign-In fails**
   - Check SHA-1 fingerprint is added correctly
   - Ensure `google-services.json` is in the right location
   - Make sure Google Sign-In is enabled in Firebase Console

3. **Build errors**
   - Run `flutter clean` then `flutter pub get`
   - Check that all configuration files are in place

### Verify Setup:

1. **Check files exist:**
   - `lib/firebase_options.dart`
   - `android/app/google-services.json`

2. **Check Firebase Console:**
   - Authentication → Sign-in method → Google (Enabled)
   - Project Settings → Your apps → SHA-1 fingerprint added

3. **Test authentication:**
   - Run the app
   - Tap "Continue with Google"
   - Should open Google sign-in flow

## Success!

Once configured, your app will:
- Show the Facebook splash screen
- Redirect to login page if not authenticated
- Allow Google Sign-In
- Redirect to main Facebook UI after successful login
- Remember login state between app launches

## Optional: Add App Icons

Replace the placeholder logo:
1. Add a real Facebook logo PNG to `assets/images/facebook_logo.png`
2. Run `flutter pub run flutter_native_splash:create` to update splash screen