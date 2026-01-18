# 🎨 Facebook Assets Generation Guide

## Quick Asset Creation

### Option 1: Use the HTML Generator (Recommended)

1. **Open the asset generator:**
   ```bash
   # Open the HTML file in your browser
   start generate_facebook_assets.html
   ```

2. **Download the assets:**
   - Click "Download App Icon" → Save as `assets/icons/facebook_icon.png`
   - Click "Download Splash Logo" → Save as `assets/images/facebook_splash_logo.png`

### Option 2: Manual Creation

Create two PNG files with these specifications:

#### App Icon (`assets/icons/facebook_icon.png`)
- **Size:** 1024x1024 pixels
- **Background:** Facebook Blue (#1877F2)
- **Content:** White "f" letter, centered, bold font
- **Format:** PNG with no transparency

#### Splash Logo (`assets/images/facebook_splash_logo.png`)
- **Size:** 200x200 pixels
- **Background:** Transparent
- **Content:** Rounded blue square with white "f" letter
- **Format:** PNG with transparency

### Option 3: Use Online Tools

1. **Canva or Figma:**
   - Create 1024x1024 design
   - Blue background (#1877F2)
   - White "f" in center
   - Export as PNG

2. **App Icon Generators:**
   - Use online app icon generators
   - Upload a Facebook-style design
   - Download all sizes

## Generate Native Assets

After creating the PNG files:

```bash
# Install dependencies
flutter pub get

# Generate app icons
dart run flutter_launcher_icons

# Generate splash screen
dart run flutter_native_splash:create
```

## Verify Assets

Check these files are created:
- `android/app/src/main/res/mipmap-*/launcher_icon.png`
- `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- `android/app/src/main/res/drawable*/launch_background.xml`

## Test the Results

```bash
flutter run
```

You should see:
1. **Facebook app icon** in your device's app drawer
2. **Facebook splash screen** when the app launches
3. **Custom splash screen** with animations after native splash

## Troubleshooting

### Assets not found error:
```bash
# Make sure files exist
ls assets/icons/facebook_icon.png
ls assets/images/facebook_splash_logo.png

# Regenerate if needed
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```

### Icon not updating:
```bash
# Clean and rebuild
flutter clean
flutter pub get
dart run flutter_launcher_icons
flutter run
```

## Current Configuration

Your `pubspec.yaml` is configured for:
- ✅ App icon generation for Android, iOS, Web, Windows
- ✅ Native splash screen with Facebook blue background
- ✅ Android 12+ splash screen support
- ✅ Dark mode splash screen support

The assets will be automatically applied to all platforms!