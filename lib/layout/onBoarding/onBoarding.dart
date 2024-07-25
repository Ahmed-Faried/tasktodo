import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../shared/resources/app_styles.dart';
import '../../shared/resources/color_manager.dart';
import '../Auth/SignIn/LoginScreen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        children:
        [
          Image.asset(Assets.imagesOnBoarding ,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const Text(
                    "Task Management & \n To-Do List",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleDMSansBold24,
                ),
                const SizedBox(height: 16),
                 const Text(
                    "This productive tool is designed to help \n you better manage your task \n project-wise conveniently!"
                    , textAlign: TextAlign.center,
                    style: AppStyles.styleDMSansRegular14,
                ),
                const SizedBox(height: 32),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  SignInScreen()));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(12)

                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Let’s Start", textAlign: TextAlign.center,
                            style: AppStyles.styleDMSansBold19,
                            ),
                        const SizedBox(width: 8,),
                        Image.asset(Assets.imagesArrowLeft ,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )

        ],

      ),
    );
  }
}
