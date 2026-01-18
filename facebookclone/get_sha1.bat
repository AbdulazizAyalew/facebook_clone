@echo off
echo 🔑 Getting SHA-1 Certificate Fingerprint...
echo.

cd android
echo Running gradlew signingReport...
echo.

gradlew.bat signingReport

echo.
echo 📋 Look for the SHA-1 fingerprint in the output above
echo 📝 Copy the SHA-1 value and add it to Firebase Project Settings
echo 🌐 Firebase Console → Project Settings → Your Apps → Add Fingerprint
echo.
pause