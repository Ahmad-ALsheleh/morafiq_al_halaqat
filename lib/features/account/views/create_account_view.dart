import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../controllers/create_account_controller.dart';

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
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text(
                            'البريد الإلكتروني',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال البريد الإلكتروني';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 9),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text(
                            'إنشاء كلمة المرور',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال كلمة المرور';
                          } else if (value.length < 6) {
                            return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 9),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text(
                            'تأكيد كلمة المرور',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء تأكيد كلمة المرور';
                          } else if (value != passwordController.text) {
                            return 'كلمة المرور غير متطابقة';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 71),
                    Padding(
                      padding: EdgeInsets.symmetric(),
                      child: Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                          if (_formKey.currentState!.validate()) {
                            controller.createAccount(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 112),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                          'إنشاء الحساب',
                          style: TextStyle(fontSize: 31, fontWeight: FontWeight.w500),
                        ),
                      )),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'لديك حساب بالفعل؟ ',
                          style: TextStyle(fontFamily: 'Somar_Regular', fontSize: 20, color: blackColor,fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: "تسجيل الدخول",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 85),
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
