import 'package:flutter/material.dart';
import 'package:shared_prefrence_session/screens/money_tracker_screen.dart';
import 'package:shared_prefrence_session/service/shared_prefrence_helper.dart';

import '../components/text_login_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Hello Jim, please Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(
                      'assets/images/money.png',
                      width: 100,
                      height: 150,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextLoginField(Icons.email, 'Email', emailController,
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.endsWith('@gmail.com')) {
                        return 'Email must end with @gmail.com';
                      }
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextLoginField(Icons.lock, 'Password', passwordController,
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'password must be 8 characters or more';
                      }
                    }),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green.shade200),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            SharedPreferenceHelper.saveData(
                                key: "Email", value: emailController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MoneyTrackerScreen(),
                                ));
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        const Text(
                          'you don`t have an account yet ?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.green.shade200),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
