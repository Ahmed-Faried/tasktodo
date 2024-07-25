import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task_to_do_app/layout/Home%20View/HomeView.dart';
import 'package:task_to_do_app/layout/HomePage/HomePage.dart';
import 'package:toastification/toastification.dart';

import '../../../generated/assets.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/resources/app_styles.dart';
import '../../../shared/resources/color_manager.dart';
import '../SignUp/SignUpScreen.dart';
import 'Cubit/SignInCubit.dart';
import 'Cubit/SignInStates.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var  phoneValue  ;

   var     cubit = LoginCubit.get(context) ;
    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (BuildContext context,  state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.imagesOnBoarding,
                  
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
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
                              phoneValue = phone.completeNumber.toString() ;
                            },
                            initialCountryCode: "EG",
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

                                controller: cubit.passwordController,
                                keyboardType:  TextInputType.visiblePassword ,
                                validator: (V){
                                  if(V!.isEmpty){
                                    return"Password is null ";

                                  }
                                },
                                obscureText: cubit.isPassword,

                                decoration:  InputDecoration(
                                  hintStyle: AppStyles.styleDMSansRegular14,
                                  hintText: "Password...",
                                  border: InputBorder.none,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: IconButton(
                                      onPressed: () {
                                        cubit.changePasswordRegister();
                                      },
                                      icon: Icon(cubit.showPassword),
                                    ),
                                  ),

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
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          cubit.login(
                              phone: phoneValue.toString(),
                              password: cubit.passwordController.text);
                          print(phoneValue.toString());
                          print(cubit.passwordController.text);
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>  SignUpScreen()));
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
      ),
      listener: (BuildContext context,  state)  {
        if (state is LoginSuccessState){
          toast(context: context, type: ToastificationType.info, title: 'Login', description: 'Success ', icon: Icons.done, primaryColor: Color(0xff6D5ED2));
          print(token);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   HomePage()),  );

        }else if (state is LoginErrorState){

          toast(context: context, type: ToastificationType.info, title: 'Login', description: state.LoginerrorModel ?? "", icon: Icons.error_outline_sharp, primaryColor: Color(0xff6D5ED2));
        }

      },
    );
  }
}
