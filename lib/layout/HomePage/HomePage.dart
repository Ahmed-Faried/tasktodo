import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_to_do_app/generated/assets.dart';
import 'package:task_to_do_app/layout/HomePage/Cubit/HomePageCubit.dart';
import 'package:task_to_do_app/layout/HomePage/Cubit/HomePageState.dart';
import 'package:task_to_do_app/layout/Profile/Profile.dart';
import 'package:task_to_do_app/shared/resources/app_styles.dart';
import 'package:task_to_do_app/shared/resources/color_manager.dart';
import '../AddTask/AddTask.dart';
import '../Task Details/TaskDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int index = 1 ;

  void changeList(value){
    setState(() {
      index = value ;
    });
  }
    List<String> states =
    [
      "inprogress",
      "waiting",
      "finished"
];

  @override
  Widget build(BuildContext context) {

    var cubit = HomePageCubit.get(context);


    return BlocProvider(
      create: (BuildContext context) => HomePageCubit()..getList(status: "/todos") ,
      child: BlocConsumer<HomePageCubit ,HomePageState>(
        builder: (BuildContext context, HomePageState state) => Scaffold(
          appBar: AppBar(
            leading: Text(" Logo", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),

            actions:
            [

              IconButton(
                icon:  Icon(Icons.person , color: Colors.black,),
                tooltip: 'Profile',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  Profile()));

                },
              ),
              IconButton(
                icon:  Icon(Icons.logout , color: ColorManager.primary,),
                tooltip: 'logout',
                onPressed: () {

                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const Text("My Tasks", style: AppStyles.styleDMSansBold16,),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        InkWell(
                          onTap: ()async{
                            await cubit.getList(status: "/todos");

                            changeList(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: ShapeDecoration(
                              color: index == 1 ? Color(0xFF5F33E1) : Color(0xFFF0ECFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),                child: Center(child: Text("All" , style: index == 1 ? AppStyles.styleDMSansBold16 : AppStyles.styleDMSansBold16 ,)),
                          ),
                        ),
                        InkWell(
                          onTap: ()async{
                             await cubit.getList(status: "/todos?status=inprogress");


                            changeList(2);

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: ShapeDecoration(
                              color: index == 2 ? Color(0xFF5F33E1) : Color(0xFFF0ECFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),                child: Center(child: Text("Inpogress", style: AppStyles.styleDMSansRegular16)),
                          ),
                        ),
                        InkWell(
                          onTap: ()async{
                           await cubit.getList(status: "/todos?status=waiting");

                            changeList(3);

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: ShapeDecoration(
                              color: index == 3 ? Color(0xFF5F33E1) : Color(0xFFF0ECFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),),
                            child: Center(child: Text("Waiting", style: AppStyles.styleDMSansRegular16)),
                          ),
                        ),
                        InkWell(
                          onTap: ()async{
                            await cubit.getList(status: "/todos?status=finished");

                            changeList(4);

                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: ShapeDecoration(
                              color: index == 4 ? Color(0xFF5F33E1) : Color(0xFFF0ECFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Center(child: Text("Finished" , style: AppStyles.styleDMSansRegular16)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                     Expanded(
                       child: Container(

                         child: ListView.builder(
                           scrollDirection: Axis.vertical,
                            itemCount: cubit.taskModel.length,
                            itemBuilder: (context, index) {

                              return    InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (Context) =>  TaskDetails(taskModel:cubit.taskModel[index])));
                                  cubit.taskModel[index].id;
                                },
                                child: CustomCardHomePage(
                                  title: cubit.taskModel[index].title??"",
                                  date: DateFormat('MM/dd/yyyy').format(cubit.taskModel[index].createdAt)??"",
                                  description: cubit.taskModel[index].desc??"",
                                  importance: cubit.taskModel[index].priority??"",
                                  processTitle: cubit.taskModel[index].status??"",
                                  ),
                              );
                            },
                          ),
                       ),
                     )


                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.small(
                shape: const CircleBorder(),
                backgroundColor: const Color(0xffEBE5FF),
                onPressed: () {

                },
                child: Image.asset(Assets.imagesQr),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: ColorManager.primary,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (Context) => const AddTask()));
                },
                child: const Icon(Icons.add , color: Colors.white,),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        ),
        listener: (BuildContext context, HomePageState state) {  },
      ),
    );
  }
}

class CustomCardHomePage extends StatelessWidget {
   CustomCardHomePage({
    super.key,
     required this.title,
     required this.date,
     required this.description,
     required this.importance,
     required this.processTitle,

  });

  String title;
  String description;
  String processTitle;
  String importance;
  var date;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children:
          [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 30,
                    child: Image.asset(Assets.imagesMarket ,))
              ],
            ),
            SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children:
                     [
                        Expanded(child: Text(title,overflow: TextOverflow.ellipsis, style: AppStyles.styleDMSansBold16.copyWith(color: Colors.black),)),
                        SizedBox(width: 5,),
                        Container(
                           decoration: BoxDecoration(
                             color: processTitle == 'waiting'
                                ? const Color(0xFFFFE4F2)
                                : processTitle == 'inprogress'
                                ? const Color(0xFFF0ECFF)
                                : const Color(0xFFE3F2FF),
                             borderRadius: BorderRadius.circular(5)
                           )
                           ,child:  Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 5),
                             child: Center(child: Text(processTitle ,style: AppStyles.styleDMSansMedium12.copyWith(color:importance == 'low' ||
                                 importance == 'Low'
                                 ? const Color(0xFF0087FF)
                                 : importance == 'medium'
                                 ? const Color(0xFF5F33E1)
                                 : const Color(0xFFFF7D53), ),)),
                           )),
                     ],
                                         ),
                    Expanded(child: Text(description, style: AppStyles.styleDMSansRegular14 , overflow: TextOverflow.ellipsis,)),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:
                     [
                       Row(
                         children: [
                           Icon(Icons.flag , color:importance == 'low' ||
                               importance == 'Low'
                               ? const Color(0xFF0087FF)
                               : importance == 'medium'
                               ? const Color(0xFF5F33E1)
                               : const Color(0xFFFF7D53),),
                           Text(importance , style: AppStyles.styleDMSansMedium12.copyWith(color: importance == 'low' ||
                               importance == 'Low'
                               ? const Color(0xFF0087FF)
                               : importance == 'medium'
                               ? const Color(0xFF5F33E1)
                               : const Color(0xFFFF7D53),)),
                         ],
                       ),
                       Text(date.toString() , style: AppStyles.styleDMSansRegular12,),

                     ],
                                        ),

                ],
              ),
            ),
            const SizedBox(width: 12,),
             Column(
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {

                    }
                    else if (value == 'delete') {

                    }
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
                          // cubit.deleteTask(taskId: widget.taskModel.id ?? '');
                        },
                      ),
                    ];
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
