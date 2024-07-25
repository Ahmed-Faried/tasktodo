import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task_to_do_app/layout/Auth/SignUp/Cubit/SignUpCubit.dart';
import 'package:task_to_do_app/layout/Auth/SignUp/Cubit/SignUpStates.dart';
import 'package:toastification/toastification.dart';

import '../../../generated/assets.dart';
import '../../../shared/components/components.dart';
import '../../../shared/resources/app_styles.dart';
import '../../../shared/resources/color_manager.dart';
import '../SignIn/Cubit/SignInStates.dart';
import '../SignIn/LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var  phoneValue  ;
    var cubit = SignUpCubit.get(context);
    return BlocConsumer<SignUpCubit ,SignUpStates>(
      builder: (BuildContext context, SignUpStates state) =>  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                children: [
                  Image.asset(
                    Assets.imagesOnBoarding,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 250,),
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
                                controller: cubit.nameController,
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
                                initialCountryCode: "EG",
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
                                  phoneValue = phone.completeNumber.toString() ;
                                },
                                onCountryChanged: (country) {
                                  print('Country changed to: ' + country.name);
                                },
                              ),
                              const SizedBox(height: 5),
                              CustomTextFromField(
                                hint: 'Years of experience...',
                                controller: cubit.yearsOfExperienceController,
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
                                value: cubit.selectedExperienceLevel,
                                items: cubit.experienceLevels.map((String level) {
                                  return DropdownMenuItem<String>(
                                    value: level,
                                    child: Text(level),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    cubit.selectedExperienceLevel = newValue;
                                  });
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomTextFromField(
                                hint: 'Address...',
                                controller: cubit.addressController,
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
                                obscureText: cubit.isPassword,
                                hint: 'Password...',
                                controller: cubit.passwordController,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: IconButton(
                                    onPressed: () {
                                      cubit.changePasswordRegister();
                                    },
                                    icon: Icon(cubit.showPassword),
                                  ),
                                ),
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
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              cubit.Register(
                                  password: cubit.passwordController.text,
                                  displayName: cubit.nameController.text,
                                  phone: phoneValue.toString(),
                                  experienceYears: int.parse(cubit.yearsOfExperienceController.text),
                                  address: cubit.addressController.text,
                                  level: cubit.selectedExperienceLevel.toString()
                              );

                            }

                          },
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>  SignInScreen()));

                              },
                              child: const Text(
                                "Sign In here",
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      listener: (BuildContext context, SignUpStates state) {
        if (state is RegisterSuccessState ){
          toast(context: context, type: ToastificationType.info, title: 'Register', description: 'Success ', icon: Icons.done, primaryColor: Color(0xff6D5ED2));
        }else if (state is RegisterErrorState){
          toast(context: context, type: ToastificationType.info, title: 'Register', description: 'Error ', icon: Icons.error_outline_sharp, primaryColor: Color(0xff6D5ED2));
        }
      },
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
