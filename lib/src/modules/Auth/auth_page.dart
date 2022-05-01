import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 80.w,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 90,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Username'),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Password'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    print("teste");
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New user?'),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Signup',
                          style: TextStyle(
                              color: Color.fromARGB(255, 36, 142, 228)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
