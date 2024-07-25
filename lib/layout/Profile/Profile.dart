import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_to_do_app/generated/assets.dart';
import 'package:task_to_do_app/layout/Profile/Cubit/ProfileCubit.dart';
import 'package:task_to_do_app/layout/Profile/Cubit/ProfileStates.dart';
import 'package:task_to_do_app/shared/resources/app_styles.dart';

import '../../shared/components/components.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context) ;
    return  BlocProvider(
      create: (BuildContext context) =>ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit ,ProfileStates>(
        builder: (BuildContext context, ProfileStates state) {

          return Scaffold(
            appBar: CustomAppBar(title: "Profile",),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children:
                [
                  CustomProfileContainer(title: "Name",data: cubit.profileModel?.displayName ??"",),
                  Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  height: 68,
                  padding: const EdgeInsets.symmetric(horizontal: 15,),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Phone",
                                style: AppStyles.styleDMSansMedium12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                cubit.profileModel?.username??"",
                                style: AppStyles.styleDMSansBold18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: cubit.profileModel!.username));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('تم نسخ النص إلى الحافظة')),
                            );
                          },
                          child: Icon(Icons.copy))

                    ],
                  ),
                ),
              ),
                  CustomProfileContainer(title: "Phone",data: cubit.profileModel?.username??"",),
                  CustomProfileContainer(title: "Level",data: cubit.profileModel?.level??"",),
                  CustomProfileContainer(title: "Years of experience",data: cubit.profileModel?.experienceYears.toString()??"",),
                  CustomProfileContainer(title: "Location",data: cubit.profileModel?.address??"",),
                ],
              ),
            ),
        );},
        listener: (BuildContext context, ProfileStates state) {  },
      ),
    );
  }
}

class CustomProfileContainer extends StatelessWidget {
  CustomProfileContainer({
    super.key,
    required this.title,
    required this.data

  });
    String title ;
    var data ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        decoration: ShapeDecoration(
          color: Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: AppStyles.styleDMSansMedium12,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: Text(
                data,
                style: AppStyles.styleDMSansBold18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


