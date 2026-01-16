# Facebook Clone - Setup Instructions

## What's Included

This Facebook clone includes:
- **Home Page**: Stories, create post section, and news feed with dummy posts
- **Friends Page**: Friend requests and friend suggestions
- **Videos Page**: Video feed with thumbnails
- **Notifications Page**: Notification feed with different types
- **Menu Page**: Profile section and app settings
- **Authentication**: Google Sign-In with Firebase (needs configuration)

## Quick Start (Without Firebase)

To see the UI without authentication:

1. Install dependencies:
```bash
cd facebookclone
flutter pub get
```

2. Temporarily disable Firebase to preview UI:
   - Comment out Firebase initialization in `lib/main.dart`
   - Or skip to Firebase setup below

## Firebase Setup (Required for Authentication)

### 1. Install FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

### 2. Create Firebase Project
- Go to [Firebase Console](https://console.firebase.google.com/)
- Create a new project
- Enable Google Sign-In in Authentication section

### 3. Configure Firebase
```bash
cd facebookclone
flutterfire configure
```

### 4. Enable Google Sign-In
- In Firebase Console → Authentication → Sign-in method
- Enable Google provider
- Add SHA-1 fingerprint for Android (see below)

### 5. Get SHA-1 for Android
```bash
cd android
./gradlew signingReport
```
Copy the SHA-1 and add it to Firebase Project Settings

### 6. Run the App
```bash
flutter run
```

## Features

### Home Page
- Create post section with Live, Photo, Room options
- Stories carousel (Create Story + user stories)
- News feed with posts showing:
  - User profile
  - Post content
  - Images
  - Like/Comment/Share counts
  - Action buttons

### Friends Page
- Friend requests with Confirm/Delete buttons
- People you may know with Add Friend button
- Mutual friends count

### Videos Page
- Video thumbnails with duration
- Channel information
- View counts and timestamps

### Notifications Page
- Filter tabs (All, Unread, Mentions)
- Different notification types with icons
- Unread indicators
- New vs Earlier sections

### Menu Page
- User profile section
- Quick access to Friends, Saved, Groups, etc.
- Settings & Privacy options
- Logout functionality

## Dummy Data

All pages use dummy data defined in:
- `lib/models/post_model.dart` - Posts
- `lib/models/story_model.dart` - Stories
- `lib/models/friend_model.dart` - Friends and requests

## Customization

To customize the UI:
1. Edit dummy data in model files
2. Modify colors in individual page files
3. Adjust layouts in screen files
4. Change Facebook blue: `Color(0xFF1877F2)`

## Notes

- All images use placeholders (grey boxes with icons)
- Replace with real images by updating image URLs
- Authentication redirects work automatically once Firebase is configured
- Bottom navigation switches between all 5 pages
