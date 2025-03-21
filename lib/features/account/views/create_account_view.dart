import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../controllers/create_account_controller.dart';
import 'login_view.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final CreateAccountController controller = Get.put(CreateAccountController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo.png',
                width: 150,
                height: 150,
              ),
              Text(
                'مرافق الحلقات',
                style: TextStyle(
                    color: praimaryColor,
                    fontFamily: 'Somar_Regular',
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          label: Text(
                            'البريد الإلكتروني',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 9),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          label: Text(
                            'إنشاء كلمة المرور',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 9),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          label: Text(
                            'تأكيد كلمة المرور',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 71),
                    Padding(
                      padding: EdgeInsets.symmetric(),
                      child: ElevatedButton(

                          onPressed: () async {
                            var  controller =
                            Get.find<CreateAccountController>();

                            await controller.createAccount(emailController.text, passwordController.text);
                            Get.off(LoginView());

                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 112),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          child: Text(
                            'إنشاء الحساب',
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                    SizedBox(height: 5),

                    SizedBox(height: 80),
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
