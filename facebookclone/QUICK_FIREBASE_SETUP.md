# Quick Firebase Setup for Google Sign-In

## 🚀 Quick Start (5 minutes)

### 1. Install FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

### 2. Create Firebase Project
- Go to [Firebase Console](https://console.firebase.google.com/)
- Click "Add project" → Enter name: `facebook-clone-app`
- Create project

### 3. Configure Firebase
```bash
cd facebookclone
flutterfire configure
```
- Select your project
- Choose platforms (Android/iOS)
- This creates `firebase_options.dart`

### 4. Enable Google Sign-In
- Firebase Console → Authentication → Sign-in method
- Enable Google provider
- Select support email

### 5. Add SHA-1 for Android
```bash
cd android
./gradlew signingReport
```
- Copy SHA-1 fingerprint
- Firebase Console → Project Settings → Add fingerprint

### 6. Test
```bash
flutter run
```

## ✅ What You'll See

1. **Facebook Splash Screen** (3 seconds)
   - Facebook logo with animation
   - Loading indicator
   - "from Meta" branding

2. **Login Page** (if not authenticated)
   - Facebook branding
   - "Continue with Google" button
   - Firebase status indicator

3. **Main App** (after login)
   - Home feed with posts and stories
   - Friends page with requests
   - Videos, Notifications, Menu pages
   - Bottom navigation

## 🔧 Current Features

- ✅ Custom Facebook splash screen
- ✅ Google Sign-In authentication
- ✅ 5 main pages with dummy data
- ✅ Facebook-style UI design
- ✅ Authentication state management
- ✅ Works without Firebase (demo mode)

## 📱 App Flow

```
Splash Screen (3s)
    ↓
Login Page (if not authenticated)
    ↓
Main App with Bottom Navigation:
├── Home (posts, stories)
├── Friends (requests, suggestions)  
├── Videos (video feed)
├── Notifications (activity feed)
└── Menu (profile, settings)
```

## 🎨 Splash Screen Features

- Animated Facebook logo
- Smooth fade and scale transitions
- Loading indicator
- Meta branding at bottom
- 3-second duration with smooth transition

The splash screen will show every time the app launches, then transition to either the login page or main app based on authentication status.