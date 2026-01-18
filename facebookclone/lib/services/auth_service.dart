import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth? _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isFirebaseAvailable = false;
  Stream<User?>? _authStateStream;

  AuthService() : _auth = _initializeFirebaseAuth() {
    _isFirebaseAvailable = _auth != null;
    // Cache the auth state stream to prevent multiple subscriptions
    if (_isFirebaseAvailable) {
      _authStateStream = _auth!.authStateChanges();
    }
  }

  static FirebaseAuth? _initializeFirebaseAuth() {
    try {
      return FirebaseAuth.instance;
    } catch (e) {
      print('Firebase Auth not available: $e');
      return null;
    }
  }

  // Check if Firebase is available
  bool get isFirebaseAvailable => _isFirebaseAvailable;

  // Get current user
  User? get currentUser {
    try {
      return _auth?.currentUser;
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

  // Auth state changes stream - cached to prevent multiple subscriptions
  Stream<User?> get authStateChanges {
    return _authStateStream ?? Stream.value(null);
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    if (!isFirebaseAvailable) {
      throw Exception('Firebase is not configured. Please set up Firebase to use authentication.');
    }

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      return await _auth!.signInWithCredential(credential);
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    if (!isFirebaseAvailable) {
      return;
    }

    try {
      await Future.wait([
        _auth!.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
