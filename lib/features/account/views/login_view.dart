import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morafiq_al_halaqat/core/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                          labelText: 'البريد الإلكتروني',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
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
                          labelText: 'كلمة المرور',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال كلمة المرور';
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
                            controller.login(emailController.text.trim(),
                                passwordController.text.trim());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 112),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(color:praimaryColor)
                            : Text(
                          'تسجيل الدخول ',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.createAccount);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'لا تملك حساب ؟ ',
                          style: TextStyle(fontFamily: 'Somar_Regular', fontSize: 20, color: blackColor,fontWeight: FontWeight.w400,),
                          children: [
                            TextSpan(
                              text: " إنشاء حساب",
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
