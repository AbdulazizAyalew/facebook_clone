# 🔐 Google Sign-In Setup Guide

## Step 1: Create Firebase Project

1. **Go to Firebase Console**
   - Visit: https://console.firebase.google.com/
   - Click "Add project"

2. **Create Project**
   - Project name: `Facebook Clone App`
   - Project ID: `facebook-clone-app-[your-initials]` (e.g., `facebook-clone-app-js`)
   - Disable Google Analytics (optional)
   - Click "Create project"

## Step 2: Configure FlutterFire

Run this command and select your newly created project:

```bash
flutterfire configure
```

- Select your Firebase project from the list
- Choose platforms: Android, iOS (if needed)
- This will create `lib/firebase_options.dart`

## Step 3: Enable Google Sign-In in Firebase

1. **Go to Authentication**
   - In Firebase Console → Authentication
   - Click "Get started"

2. **Enable Google Sign-In**
   - Go to "Sign-in method" tab
   - Click on "Google" provider
   - Toggle "Enable"
   - Select a support email from dropdown
   - Click "Save"

## Step 4: Get SHA-1 Certificate (Android)

Run this command to get your SHA-1 fingerprint:

```bash
cd android
./gradlew signingReport
```

On Windows:
```bash
cd android
gradlew.bat signingReport
```

**Copy the SHA-1 fingerprint** from the output (look for `debug` variant).

## Step 5: Add SHA-1 to Firebase

1. **Go to Project Settings**
   - Firebase Console → Project Settings (gear icon)
   - Scroll to "Your apps" section

2. **Add Fingerprint**
   - Click on your Android app
   - Click "Add fingerprint"
   - Paste the SHA-1 fingerprint
   - Click "Save"

## Step 6: Download Configuration Files

### For Android:
1. In Project Settings → Your apps
2. Click "Download google-services.json"
3. Place it in `android/app/` directory

### For iOS (if needed):
1. Download "GoogleService-Info.plist"
2. Place it in `ios/Runner/` directory

## Step 7: Test Google Sign-In

```bash
flutter run
```

## Expected Behavior:

1. **App launches** → Shows Facebook splash screen
2. **Login page** → Shows "Continue with Google" button
3. **Tap button** → Opens Google sign-in flow
4. **Sign in** → Redirects to main Facebook UI
5. **User data** → Shows your Google profile info

## Troubleshooting:

### "Firebase not configured" error:
- Make sure `lib/firebase_options.dart` exists
- Run `flutterfire configure` again

### Google Sign-In fails:
- Check SHA-1 fingerprint is added correctly
- Ensure `google-services.json` is in `android/app/`
- Make sure Google Sign-In is enabled in Firebase Console

### Build errors:
```bash
flutter clean
flutter pub get
flutter run
```

## Quick Commands Summary:

```bash
# 1. Configure Firebase
flutterfire configure

# 2. Get SHA-1 (Windows)
cd android && gradlew.bat signingReport

# 3. Test the app
flutter run
```

Once complete, your Facebook clone will have fully functional Google Sign-In! 🎉