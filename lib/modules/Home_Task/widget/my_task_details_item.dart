import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/models/TasksModel/TasksModel.dart';
import 'package:tasky/modules/Home_Task/cubit/hometask_cubit.dart';
import 'package:tasky/shared/resources/asset_manager.dart';

import '../../Task_Details/task_details_screen.dart';

class MyTaskDetailsItem extends StatefulWidget {
  const MyTaskDetailsItem({super.key, required this.taskModel});

  final TasksModel taskModel;

  @override
  State<MyTaskDetailsItem> createState() => _MyTaskDetailsItemState();
}

class _MyTaskDetailsItemState extends State<MyTaskDetailsItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTaskCubit, HomeTaskState>(
      listener: (context, state) {
        var cubit = HomeTaskCubit.get(context) ;
        if (state is DeleteTaskSuccessState) {
          CherryToast.success(
            title: const Text('Task Deleted Successfully'),
            animationType: AnimationType.fromTop,
          ).show(context);

          if(cubit.i == 0){
            cubit.getTasks();
          }else if(cubit.i == 1){
            cubit.getTasks(status: 'inprogress');
          }else if(HomeTaskCubit.get(context).i == 2){
            cubit.getTasks(status: 'waiting');
          }else if(HomeTaskCubit.get(context).i == 3){
            cubit.getTasks(status: 'finished');
          }

        } else if (state is DeleteTaskErrorState) {
          CherryToast.error(
            title: Text(state.message),
            animationType: AnimationType.fromTop,
          ).show(context);
        }
      },
      builder: (context, state) {
        var cubit = HomeTaskCubit.get(context);
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            TaskDetailsScreen(taskModel: widget.taskModel)));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(ImageAssets.imageItemTask),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.taskModel.title ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Color(0xFF24252C),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: ShapeDecoration(
                              color: widget.taskModel.status == 'waiting'
                                  ? const Color(0xFFFFE4F2)
                                  : widget.taskModel.status == 'inprogress'
                                  ? const Color(0xFFF0ECFF)
                                  : const Color(0xFFE3F2FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.taskModel.status ?? '',
                                  style: TextStyle(
                                    color: widget.taskModel.status == 'waiting'
                                        ? const Color(0xFFFF7D53)
                                        : widget.taskModel.status ==
                                        'inprogress'
                                        ? const Color(0xFF5F33E1)
                                        : const Color(0xFF0087FF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(widget.taskModel.desc ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Color(0x9924252C),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.flag_outlined,
                                size: 12,
                                color: widget.taskModel.priority == 'low' ||
                                    widget.taskModel.priority == 'Low'
                                    ? const Color(0xFF0087FF)
                                    : widget.taskModel.priority == 'medium'
                                    ? const Color(0xFF5F33E1)
                                    : const Color(0xFFFF7D53),
                              ),
                              Text(
                                widget.taskModel.priority ?? '',
                                style: TextStyle(
                                  color: widget.taskModel.priority == 'low' ||
                                      widget.taskModel.priority == 'Low'
                                      ? const Color(0xFF0087FF)
                                      : widget.taskModel.priority == 'medium'
                                      ? const Color(0xFF5F33E1)
                                      : const Color(0xFFFF7D53),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.taskModel.createdAt!.split('T')[0],
                            style: const TextStyle(
                              color: Color(0x9924252C),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {} else if (value == 'delete') {}
                  },
                  icon: const Icon(Icons.more_vert),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                          value: 'edit',
                          child: Opacity(
                            opacity: 0.87,
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Color(0xFF00060D),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: const Opacity(
                          opacity: 0.87,
                          child: Text(
                            'Delete',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFFF7D53),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        onTap: () {
                          cubit.deleteTask(taskId: widget.taskModel.id ?? '');
                        },
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
