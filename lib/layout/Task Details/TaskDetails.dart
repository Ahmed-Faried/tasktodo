import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:task_to_do_app/layout/Task%20Details/Cubit/TaskDetailsState.dart';
import 'package:task_to_do_app/shared/resources/app_styles.dart';
import 'package:task_to_do_app/shared/resources/color_manager.dart';

import '../../generated/assets.dart';
import '../HomePage/Model/TaskModel.dart';
import 'Cubit/TaskDetailsCubit.dart';
import 'Model/TaskDetailsModel.dart';

class TaskDetails extends StatefulWidget {
  final TaskModel taskModel;

  TaskDetails({super.key, required this.taskModel});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  @override
  Widget build(BuildContext context) {
    var cubit = TaskDetailsCubit.get(context) ;
    return BlocProvider(
      create: (BuildContext context) => TaskDetailsCubit()..getTaskID(id: widget.taskModel.id),
      child: BlocConsumer<TaskDetailsCubit, TaskDetailsState>(
        listener: (BuildContext context, TaskDetailsState state) {
        },
        builder: (BuildContext context, TaskDetailsState state) {

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
                          cubit.taskDetailsModel!.title ?? "",
                          style: AppStyles.styleDMSansBold24.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          cubit.taskDetailsModel!.desc ?? "",
                          style: AppStyles.styleDMSansRegular14,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 24, right: 12, top: 7, bottom: 7),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF0ECFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("End Date"),
                                  Text(cubit.taskDetailsModel!.createdAt ?? ""),
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
                        Container(
                          decoration: ShapeDecoration(
                            color: Color(0xFFF0ECFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.flag, color: Color(0xFF5F33E1)),
                                SizedBox(width: 10),
                                Text(
                                  cubit.taskDetailsModel!.priority ?? "",
                                  style: AppStyles.styleDMSansBold16.copyWith(color: const Color(0xFF5F33E1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: QrImageView(
                            data: cubit.taskDetailsModel!.id ?? "",
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
        },
      ),
    );
  }
}