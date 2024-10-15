import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshly/constants.dart';
import 'package:freshly/screens/main_screen.dart';
import 'package:freshly/widgets/login&sign_up_widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/login&sign_up_widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Please enter your account here',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                CustomFormTextField(
                  onChange: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 20.0),
                CustomFormTextField(
                  onChange: (data) {
                    password = data;
                  },
                  obscureText: true,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.visibility_outlined),
                ),
                const SizedBox(height: 30.0),
                CustomBotton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await signUpUser();

                        // عرض SnackBar عند نجاح التسجيل
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account created successfully!'),
                            backgroundColor: kPrimaryColor,
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainView(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        String errorMessage;
                        if (e.code == 'weak-password') {
                          errorMessage = 'The password provided is too weak.';
                        } else if (e.code == 'email-already-in-use') {
                          errorMessage =
                              'The account already exists for that email.';
                        } else if (e.code == 'invalid-email') {
                          errorMessage = 'The email provided is invalid.';
                        } else {
                          errorMessage =
                              'An unexpected error occurred: ${e.message}';
                        }

                        // عرض SnackBar عند حدوث خطأ
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } catch (e) {
                        // عرض SnackBar عند حدوث خطأ غير معروف
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error occurred: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                  titel: isLoading ? 'Loading...' : 'Sign up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
