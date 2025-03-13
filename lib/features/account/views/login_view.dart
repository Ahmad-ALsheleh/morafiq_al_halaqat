import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morafiq_al_halaqat/core/constant.dart';

import 'create_account_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          label: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'البريد الإلكتروني',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 9),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          label: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'كلمة المرور',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 71),
                    Padding(
                      padding: EdgeInsets.symmetric(),
                      child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 112),
                             shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                             ),
                          ),
                          child: Text(
                            'تسجيل الدخول ',
                            style: TextStyle(
                              fontSize: 31,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                    SizedBox(height: 5),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('لا تملك حساب ؟',style: TextStyle(fontSize: 20),),
                          TextButton(
                            onPressed: () {
                              Get.off(CreateAccountView());
                            },
                            child: Text(
                              "إنشاء حساب",
                              style: TextStyle(
                                color: blackColoe,
                                fontSize: 20,fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
