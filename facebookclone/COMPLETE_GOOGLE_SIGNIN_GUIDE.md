# 🚀 Complete Google Sign-In Setup Guide

## 🎯 What You'll Achieve
After following this guide, your Facebook clone will have:
- ✅ Google Sign-In authentication
- ✅ User profile data from Google
- ✅ Automatic login state management
- ✅ Secure authentication flow

## 📋 Prerequisites
- ✅ FlutterFire CLI installed (`flutterfire --version` works)
- ✅ Google account for Firebase Console
- ✅ Facebook clone app ready

---

## Step 1: Create Firebase Project

### 1.1 Go to Firebase Console
- Open: https://console.firebase.google.com/
- Sign in with your Google account

### 1.2 Create New Project
- Click **"Add project"**
- Project name: `Facebook Clone App`
- Project ID: `facebook-clone-app-[random]` (Firebase will suggest)
- **Disable** Google Analytics (not needed)
- Click **"Create project"**
- Wait for project creation (30-60 seconds)

---

## Step 2: Configure FlutterFire

### 2.1 Run FlutterFire Configure
```bash
cd facebookclone
flutterfire configure
```

### 2.2 Select Options
- **Select project**: Choose your newly created project
- **Platforms**: Select Android (and iOS if needed)
- **Confirm**: Press Enter to continue

### 2.3 Verify Files Created
Check that `lib/firebase_options.dart` was created:
```bash
dart check_firebase_setup.dart
```

---

## Step 3: Enable Google Sign-In

### 3.1 Go to Authentication
- Firebase Console → **Authentication**
- Click **"Get started"**

### 3.2 Enable Google Provider
- Go to **"Sign-in method"** tab
- Click on **"Google"** provider
- Toggle **"Enable"**
- **Support email**: Select your email from dropdown
- Click **"Save"**

---

## Step 4: Get SHA-1 Certificate

### 4.1 Generate SHA-1 (Windows)
```bash
cd android
gradlew.bat signingReport
```

Or use the batch script:
```bash
get_sha1.bat
```

### 4.2 Find SHA-1 in Output
Look for something like:
```
Variant: debug
Config: debug
Store: C:\Users\[user]\.android\debug.keystore
Alias: AndroidDebugKey
MD5: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX
SHA1: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX  ← Copy this!
SHA-256: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX
```

**Copy the SHA1 value** (the long string with colons)

---

## Step 5: Add SHA-1 to Firebase

### 5.1 Go to Project Settings
- Firebase Console → **Project Settings** (gear icon)
- Scroll to **"Your apps"** section

### 5.2 Add Fingerprint
- Click on your **Android app** (should show package name)
- Click **"Add fingerprint"**
- Paste the **SHA-1** value
- Click **"Save"**

---

## Step 6: Download Configuration

### 6.1 Download google-services.json
- Still in Project Settings → Your apps
- Click **"Download google-services.json"**
- Save the file

### 6.2 Place Configuration File
- Move `google-services.json` to `facebookclone/android/app/`
- **Important**: Must be in `android/app/` folder, not `android/`

---

## Step 7: Test Google Sign-In

### 7.1 Verify Setup
```bash
dart check_firebase_setup.dart
```
Should show: ✅ Ready for Google Sign-In!

### 7.2 Run the App
```bash
flutter run
```

### 7.3 Test Sign-In Flow
1. App launches → Facebook splash screen
2. Login page appears → "Continue with Google" button
3. Tap button → Google sign-in popup
4. Sign in with Google account
5. App redirects to main Facebook UI
6. Your Google profile info appears in menu

---

## 🔧 Troubleshooting

### Problem: "Firebase not configured"
**Solution:**
```bash
flutterfire configure
# Make sure lib/firebase_options.dart exists
```

### Problem: Google Sign-In fails silently
**Solution:**
- Check SHA-1 is added correctly in Firebase
- Ensure `google-services.json` is in `android/app/`
- Make sure Google Sign-In is enabled in Firebase Console

### Problem: Build errors
**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

### Problem: "Sign-in failed" error
**Solution:**
- Verify SHA-1 fingerprint matches exactly
- Check internet connection
- Try signing in with different Google account

---

## 📱 Expected User Experience

### First Time User:
1. **Splash Screen** → Facebook logo with animation
2. **Login Page** → Clean interface with Google button
3. **Google Sign-In** → Native Google authentication
4. **Main App** → Full Facebook UI with user's Google profile

### Returning User:
1. **Splash Screen** → Facebook logo
2. **Main App** → Directly to Facebook UI (auto-login)

---

## 🎉 Success Indicators

You'll know it's working when:
- ✅ No "Firebase not configured" warnings
- ✅ Google Sign-In button is clickable
- ✅ Google authentication popup appears
- ✅ After sign-in, you see the main Facebook UI
- ✅ Menu page shows your Google profile name
- ✅ App remembers login between sessions

---

## 📞 Need Help?

If you encounter issues:
1. Run `dart check_firebase_setup.dart` to verify setup
2. Check Firebase Console for any error messages
3. Ensure all files are in correct locations
4. Try `flutter clean && flutter pub get`

Your Facebook clone will have professional-grade authentication once complete! 🚀