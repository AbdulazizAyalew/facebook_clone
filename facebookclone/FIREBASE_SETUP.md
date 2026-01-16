# Firebase Setup Guide for Facebook Clone

## Prerequisites
- Flutter SDK installed
- Firebase CLI installed (`npm install -g firebase-tools`)
- A Google account

## Step 1: Install Dependencies

Run this command in the `facebookclone` directory:
```bash
flutter pub get
```

## Step 2: Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

## Step 3: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Enter project name (e.g., "facebook-clone")
4. Disable Google Analytics (optional)
5. Click "Create project"

## Step 4: Configure Firebase for Flutter

Run this command in the `facebookclone` directory:
```bash
flutterfire configure
```

This will:
- Ask you to select your Firebase project
- Automatically configure Android and iOS apps
- Generate `firebase_options.dart` file

## Step 5: Enable Google Sign-In in Firebase

1. In Firebase Console, go to **Authentication** > **Sign-in method**
2. Click on **Google** provider
3. Toggle **Enable**
4. Select a support email
5. Click **Save**

## Step 6: Configure Android for Google Sign-In

### Get SHA-1 Certificate Fingerprint

Run this command in the `facebookclone/android` directory:
```bash
cd android
./gradlew signingReport
```

On Windows:
```bash
cd android
gradlew.bat signingReport
```

Copy the **SHA-1** fingerprint from the output.

### Add SHA-1 to Firebase

1. In Firebase Console, go to **Project Settings**
2. Scroll down to **Your apps** section
3. Click on your Android app
4. Click **Add fingerprint**
5. Paste the SHA-1 fingerprint
6. Click **Save**

### Download google-services.json

1. In Firebase Console, go to **Project Settings**
2. Under **Your apps**, find your Android app
3. Click **Download google-services.json**
4. Place it in `facebookclone/android/app/` directory

## Step 7: Confi