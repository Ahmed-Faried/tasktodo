import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../generated/assets.dart';
import '../../../shared/resources/app_styles.dart';
import '../../../shared/resources/color_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController() ;
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  String? selectedExperienceLevel;
  final List<String> experienceLevels = ['fresh', 'junior', 'midLevel', 'senior'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250,
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
                        CustomTextFromField(
                          hint: 'Name...',
                          controller: name,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is Empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        IntlPhoneField(

                          focusNode: focusNode,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
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
                        const SizedBox(height: 5),
                        CustomTextFromField(
                          hint: 'Years of experience...',
                          controller: name,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Years of experience is Empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFFBABABA),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFFBABABA),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFFBABABA),
                                width: 1,
                              ),
                            ),
                          ),
                          hint: Text('Select Experience Level'),
                          value: selectedExperienceLevel,
                          items: experienceLevels.map((String level) {
                            return DropdownMenuItem<String>(
                              value: level,
                              child: Text(level),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedExperienceLevel = newValue;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextFromField(
                          hint: 'Address...',
                          controller: name,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address is Empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextFromField(
                          hint: 'Password...',
                          controller: name,
                          suffixIcon: Icon(Icons.visibility_off_rounded),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Empty';
                            }
                            return null;
                          },
                        ),

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

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.readOnly = false,
    this.obscureText = false,
    required this.validator,
    this.prefix,
    this.inputFormatters,
  });

  final String hint;

  final bool? enabled;

  final bool? readOnly;
  final TextEditingController? controller;

  final TextInputType keyboardType;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  final Widget? prefix;
  final bool obscureText;

  final inputFormatters ;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          enabled: enabled,
          readOnly: readOnly!,
          inputFormatters: inputFormatters,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,

          decoration:  InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefix: prefix,
            hintText: hint,
            hintStyle: AppStyles.styleDMSansRegular14,

            border: InputBorder.none,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ));
  }
}
