import 'package:flutter/material.dart';
import 'package:task_to_do_app/generated/assets.dart';
import 'package:task_to_do_app/shared/resources/app_styles.dart';
import 'package:task_to_do_app/shared/resources/color_manager.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: SingleChildScrollView(
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
                    onTap: (){
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
                    onTap: (){
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
                    onTap: (){
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
                    onTap: (){
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
              CustomCardHomePage(
                title: "Grocery Shopping Shopping Shopping",
                date: "12/30/2024",
                description: "This application is designed for sssda",
                importance: "Low",
                processTitle: "wanting",
                colorFlag: Colors.blue,
                colorProcessTitle: Colors.redAccent,
                colorTextProcessTitle: Colors.red,),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
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
            },
            child: const Icon(Icons.add , color: Colors.white,size: 40,),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

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
     required this.colorFlag,
     required this.colorProcessTitle,
     required this.colorTextProcessTitle,
  });

  String title;
  String description;
  String processTitle;
   Color colorProcessTitle;
   Color colorTextProcessTitle;
  String importance;
  String date;
  Color colorFlag ;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Expanded(
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
                     Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        [
                           Expanded(child: Text(title,overflow: TextOverflow.ellipsis, style: AppStyles.styleDMSansBold16.copyWith(color: Colors.black),)),
                           SizedBox(width: 5,),
                           Container(
                              decoration: BoxDecoration(
                                color: colorProcessTitle,
                                borderRadius: BorderRadius.circular(5)
                              )
                              ,child:  Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Center(child: Text(processTitle ,style: AppStyles.styleDMSansMedium12.copyWith(color:colorTextProcessTitle ),)),
                              )),
                        ],
                      ),
                    ),
                      Expanded(
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        [
                          Expanded(child: Text(description, style: AppStyles.styleDMSansRegular14 , overflow: TextOverflow.ellipsis,)),
                        ],
                                                 ),
                     ),
                      Expanded(
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        [
                          Row(
                            children: [
                              Icon(Icons.flag , color: colorFlag,),
                              Text(importance , style: AppStyles.styleDMSansMedium12.copyWith(color: colorFlag)),
                            ],
                          ),
                          Text(date , style: AppStyles.styleDMSansRegular12,),

                        ],
                                           ),
                     ),

                  ],
                ),
              ),
              const SizedBox(width: 12,),
              const Column(
                children: [
                  Icon(Icons.list_rounded ,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
