import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_to_do_app/layout/AddTask/Cubit/AddTaskState.dart';
import 'package:task_to_do_app/shared/resources/app_styles.dart';
import 'package:task_to_do_app/shared/resources/color_manager.dart';

import '../../shared/components/components.dart';
import '../Auth/SignUp/SignUpScreen.dart';
import 'Cubit/AddTaskCubit.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {


  String? selectedExperienceLevel;
  final List<String> experienceLevels = ['Low', 'medium', 'hard'];
  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController  titleController = TextEditingController();
  TextEditingController  desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)  =>AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit , AddTaskState>(
        builder: (BuildContext context, AddTaskState state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(title: "Add new task",),
          body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  SizedBox(height: 16,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF5F33E1)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Icon(Icons.image , color: ColorManager.primary,),
                        const SizedBox(width: 5,),
                        Text("Add Img", style: AppStyles.styleDMSansBold19.copyWith(color: ColorManager.primary),),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Task title" ,style: AppStyles.styleDMSansRegular12,),
                  SizedBox(height: 8,),
                  CustomTextFromField(
                    hint: 'Enter title here...',
                    controller: titleController,

                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'title is Empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  Text("Task Description" ,style: AppStyles.styleDMSansRegular12,),
                  SizedBox(height: 16,),
                  PhysicalModel(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      minLines: 5,
                      maxLines: 10,
                      controller: desController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      maxLength: 1500,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter description here...';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize:24),
                      decoration: const InputDecoration(
                        contentPadding:  EdgeInsets.all(15),
                        hintText: "Enter description here...",
                        hintStyle:  AppStyles.styleDMSansRegular14,
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
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Priority" ,style: AppStyles.styleDMSansRegular12,),
                  SizedBox(height: 8,),
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
                  SizedBox(height: 16,),
                  Text("Due date" ,style: AppStyles.styleDMSansRegular12,),
                  SizedBox(height: 8,),
                  InkWell(
                    onTap: (){
                      selectDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 24 , right: 12 , top: 12 , bottom: 12),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF0ECFF).withOpacity(.5),
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
                              selectedDate == null ?
                              Text("choose due date...", style: AppStyles.styleDMSansRegular14,):
                              Text(selectedDate.toString()),
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
                  ),
                  SizedBox(height: 30,),

                  InkWell(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        AddTaskCubit.get(context).CreateTask(
                            title: titleController.text,
                            image: "image",
                            desc: desController.text,
                            priority: selectedExperienceLevel.toString(),
                            dueDate: selectedDate.toString());

                      }

                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Add task",
                          textAlign: TextAlign.center,
                          style: AppStyles.styleDMSansBold19,
                        ),
                      ),
                    ),
                  ),





                ],
              ),
            ),
          ),
        ),
        listener: (BuildContext context, AddTaskState state) {  },
      ),
    );
  }
}
