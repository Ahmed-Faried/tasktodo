import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../generated/assets.dart';
import '../../../shared/resources/app_styles.dart';
import '../../../shared/resources/color_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 450,
                child: Center(
                    child: Image.asset(
                  Assets.imagesOnBoarding,
                ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    textAlign: TextAlign.start,
                    style: AppStyles.styleDMSansBold24,
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IntlPhoneField(
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintStyle: AppStyles.styleDMSansRegular14,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFBABABA),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFBABABA),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFBABABA),
                                width: 1,
                              ),
                            ),
                          ),
                          languageCode: "en",
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            print('Country changed to: ' + country.name);
                          },
                        ),
                        const SizedBox(height: 12),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFBABABA)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintStyle: AppStyles.styleDMSansRegular14,
                                hintText: "Password...",
                                suffixIcon: Icon(Icons.visibility_off_rounded),
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: AppStyles.styleDMSansBold19,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn’t have any account? ",
                        style: AppStyles.styleDMSansRegular14,
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: const Text(
                          "Sign Up here",
                          style: TextStyle(
                            color: Color(0xFF5F33E1),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            height: 0.10,
                            letterSpacing: 0.20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
