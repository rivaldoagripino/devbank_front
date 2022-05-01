import 'package:devbank_front/app/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: Theme.of(context).primaryColorLight,
        child: SingleChildScrollView(
          child: Form(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
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
                          height: 3.h,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Email'),
                            ),
                            onChanged: (value) {
                              registerController.registerModelRequest.email =
                                  value;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Username'),
                            ),
                            onChanged: (value) {
                              registerController.registerModelRequest.username =
                                  value;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('First Name'),
                            ),
                            onChanged: (value) {
                              registerController
                                  .registerModelRequest.firstName = value;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Last Name'),
                            ),
                            onChanged: (value) {
                              registerController.registerModelRequest.lastName =
                                  value;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Password'),
                            ),
                            onChanged: (value) {
                              registerController.registerModelRequest.password =
                                  value;
                            },
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
                        registerController
                            .signup(registerController.registerModelRequest);
                      },
                      child: Text('Register'),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
