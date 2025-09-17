import 'sign_up_screen.dart';
import '../main.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                // Logo
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Icon(Icons.event, size: 60, color: Colors.deepPurple),
                ),
                SizedBox(height: 24),
                Text('FindMyEvent', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Sign in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 24),
                // Email
                TextField(
                  decoration: InputDecoration(
                    hintText: 'abc@email.com',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                SizedBox(height: 16),
                // Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Your password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    suffixIcon: Icon(Icons.visibility_off_outlined),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() => rememberMe = val ?? false);
                          },
                        ),
                        Text('Remember Me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add authentication logic here
                      // Demo interests for quick login
                      List<String> demoInterests = [
                        'Technical', 'Cultural', 'Workshops', 'Seminars', 'Sports', 'Fest'
                      ];
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(selectedInterests: demoInterests),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF6B35),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SIGN IN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('OR', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 16),
                // Social Buttons
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.g_mobiledata, color: Colors.red),
                    label: Text('Login with Google'),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    label: Text('Login with Facebook'),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Text('Sign up', style: TextStyle(color: Color(0xFFFF6B35), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
