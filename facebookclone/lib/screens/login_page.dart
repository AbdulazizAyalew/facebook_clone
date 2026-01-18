import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    
    if (!authService.isFirebaseAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Firebase is not configured. Please set up Firebase to use authentication.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    
    try {
      print('🔑 Starting Google Sign-In...');
      final result = await authService.signInWithGoogle();
      
      if (result != null) {
        print('✅ Google Sign-In successful: ${result.user?.email}');
        // The AuthWrapper will automatically redirect to main app
      } else {
        print('❌ Google Sign-In cancelled by user');
      }
    } catch (e) {
      print('❌ Google Sign-In error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign in: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Facebook logo
                const Icon(
                  Icons.facebook,
                  size: 80,
                  color: Color(0xFF1877F2),
                ),
                const SizedBox(height: 20),
                
                // App name
                const Text(
                  'facebook',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1877F2),
                  ),
                ),
                const SizedBox(height: 60),
                
                // Firebase status indicator
                if (!authService.isFirebaseAvailable)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning, color: Colors.orange[700], size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Firebase not configured. Authentication disabled.',
                            style: TextStyle(
                              color: Colors.orange[700],
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                // Google Sign In Button
                _isLoading
                    ? const CircularProgressIndicator(
                        color: Color(0xFF1877F2),
                      )
                    : ElevatedButton.icon(
                        onPressed: _handleGoogleSignIn,
                        icon: Image.network(
                          'https://www.google.com/favicon.ico',
                          height: 24,
                          width: 24,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.login, size: 24);
                          },
                        ),
                        label: Text(
                          authService.isFirebaseAvailable 
                              ? 'Continue with Google'
                              : 'Setup Required',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                
                // Skip authentication button (for demo purposes)
                if (!authService.isFirebaseAvailable)
                  TextButton(
                    onPressed: () {
                      // This will trigger the main app to show since no auth is required
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    child: const Text(
                      'Continue without authentication (Demo Mode)',
                      style: TextStyle(
                        color: Color(0xFF1877F2),
                        fontSize: 14,
                      ),
                    ),
                  ),
                
                const SizedBox(height: 40),
                
                // Terms and privacy
                Text(
                  'By continuing, you agree to our Terms of Service\nand Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
