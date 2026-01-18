# 🔑 Get SHA-1 Certificate - Manual Steps

## 🎯 Current Status
- ✅ Firebase configured (`my-coool` project)
- ✅ `firebase_options.dart` generated
- ✅ `google-services.json` exists
- ⏳ Need SHA-1 certificate for Google Sign-In

## 📋 Manual SHA-1 Generation

### Step 1: Open Command Prompt
- Press `Win + R`
- Type `cmd` and press Enter
- Or open PowerShell as Administrator

### Step 2: Navigate to Android Folder
```cmd
cd "C:\Users\hp\Desktop\Projects\Flutter_Project\FACEBOOK-CLONEEE\facebook_clone\facebookclone\android"
```

### Step 3: Run Gradle Command
```cmd
gradlew.bat signingReport
```

### Step 4: Find SHA-1 in Output
Look for something like this:
```
Variant: debug
Config: debug
Store: C:\Users\[user]\.android\debug.keystore
Alias: AndroidDebugKey
MD5: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX
SHA1: A1:B2:C3:D4:E5:F6:G7:H8:I9:J0:K1:L2:M3:N4:O5:P6:Q7:R8:S9:T0  ← COPY THIS!
SHA-256: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX
```

**Copy the SHA1 value** (the long string with colons)

## 🔥 Step 5: Add SHA-1 to Firebase

1. **Go to Firebase Console**
   - https://console.firebase.google.com/
   - Select project: `my-coool`

2. **Go to Project Settings**
   - Click gear icon → Project Settings
   - Scroll to "Your apps" section

3. **Add SHA-1 Fingerprint**
   - Click on your Android app (`com.example.facebookclone`)
   - Click **"Add fingerprint"**
   - Paste the SHA-1 value
   - Click **"Save"**

## 🎯 Enable Google Sign-In

1. **Go to Authentication**
   - Firebase Console → Authentication
   - Click "Get started" if needed

2. **Enable Google Provider**
   - Sign-in method tab
   - Click "Google"
   - Toggle "Enable"
   - Select support email
   - Click "Save"

## 🚀 Test the App

After completing above steps:
```bash
flutter run
```

## 🎉 Expected Result

1. **App launches** → Facebook splash screen
2. **Login page** → "Continue with Google" button works
3. **Google Sign-In** → Authentication popup appears
4. **Success** → Main Facebook UI with your profile

## 🔧 Alternative: Use Android Studio

If command line doesn't work:
1. Open Android Studio
2. Open the `android` folder as a project
3. Terminal → `gradlew signingReport`

You're almost there! Just need the SHA-1 certificate! 🚀