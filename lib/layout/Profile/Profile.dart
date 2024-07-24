import 'package:flutter/material.dart';
import 'package:task_to_do_app/shared/resources/app_styles.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children:
          [
            CustomProfileContainer(title: "Name",data: "Ahmed faried",),
            CustomProfileContainer(title: "Phone",data: "+20 1151031054",),
            CustomProfileContainer(title: "Level",data: "Senior",),
            CustomProfileContainer(title: "Years of experience",data: "7 years",),
            CustomProfileContainer(title: "Location",data: "Fayyum, Egypt",),
          ],
        ),
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
    String data ;
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
