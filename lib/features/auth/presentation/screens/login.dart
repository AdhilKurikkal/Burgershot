import 'package:burgershort/core/utilities/responsive.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailCtrl = TextEditingController();
    final _pwCtrl = TextEditingController();

    final isMobile = Responsive.isMobile(context);
    final horizontalPadding = isMobile ? 16.0 : 60.0;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 24,
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // optional logo / title
                Image.asset('assets/images/generated-image-2_transparent.png'),
                SizedBox(height: isMobile ? 12 : 24),

                // Email
                TextField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: isMobile ? 12 : 22),

                // Password
                TextField(
                  controller: _pwCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: isMobile ? 16 : 24),

                // Actions
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: wire login logic via providers
                      final email = _emailCtrl.text.trim();
                      final password = _pwCtrl.text.trim();
                      debugPrint('Login with $email, $password');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 12 : 16,
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: Responsive.scaleWidth(context, 16),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: isMobile ? 8 : 16),
                TextButton(
                  onPressed: () {
                    // TODO: Forgot password logic
                  },
                  child: const Text('Forgot password?'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isMobile ? 8.0 : 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You don't have an account?"),
              TextButton(
                onPressed: () {
                  // TODO: navigate to sign up
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
