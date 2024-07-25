import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:task_to_do_app/shared/resources/app_styles.dart';
import 'package:task_to_do_app/shared/resources/color_manager.dart';

import '../../generated/assets.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}
String? selectedExperienceLevel;
final List<String> experienceLevels = ['fresh', 'junior', 'midLevel', 'senior'];

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.imagesTaskImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Grocery Shopping App",
                    style: AppStyles.styleDMSansBold24.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'This application is designed for super shops. By using \nthis application they can enlist all their products in one \nplace and can deliver. Customers will get a one-stop \nsolution for their daily shopping.',
                    style: AppStyles.styleDMSansRegular14,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 24 , right: 12 , top: 7 , bottom: 7),
                    decoration: ShapeDecoration(
                      color: Color(0xFFF0ECFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("End Date"),
                            Text("30 June, 2022"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: ColorManager.primary,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField<String>(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Icon( Icons.arrow_drop_down_rounded, size: 30, color: ColorManager.primary,),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,

                      filled: true,
                      fillColor: Color(0xFFF0ECFF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFF0ECFF),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFF0ECFF),
                          width: 1,
                        ),
                      ),
                    ),
                    hint: Padding(
                      padding: EdgeInsets.only(left: 24 , right: 12 ,),
                      child: Text('Inprogress' , style: AppStyles.styleDMSansBold16.copyWith(color: const Color(0xFF5F33E1)),),
                    ),
                    value: selectedExperienceLevel,
                    items: experienceLevels.map((String level) {
                      return DropdownMenuItem<String>(
                        value: level,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24 , right: 12 ,),
                          child: Text(level),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedExperienceLevel = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField<String>(

                    icon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Icon( Icons.arrow_drop_down_rounded, size: 30, color: ColorManager.primary,),
                    ),

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Color(0xFFF0ECFF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFF0ECFF),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFF0ECFF),
                          width: 1,
                        ),
                      ),
                    ),
                    hint: Padding(

                      padding: EdgeInsets.only(left: 24 , right: 12 ,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.flag , color: Color(0xFF5F33E1),),
                          SizedBox(width: 10,),
                          Text('Medium Priority' , style: AppStyles.styleDMSansBold16.copyWith(color: const Color(0xFF5F33E1)),),
                        ],
                      ),
                    ),
                    value: selectedExperienceLevel,
                    items: experienceLevels.map((String level) {
                      return DropdownMenuItem<String>(
                        value: level,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24 , right: 12 ,),
                          child: Text(level),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedExperienceLevel = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: QrImageView(
                      data: 'This is a simple QR code',
                      version: QrVersions.auto,
                      size: 320,
                      gapless: true,
                    ),
                  )

                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
