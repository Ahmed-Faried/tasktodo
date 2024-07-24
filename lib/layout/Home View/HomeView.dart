import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/resources/adaptive_layout.dart';
import '../../shared/resources/color_manager.dart';
import '../../shared/resources/size_config.dart';
import 'cubit/homeview_cubit.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SelectionArea(
        child: Scaffold(
          key: scaffoldState,
          appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
              ? AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: (){
                if(HomeViewCubit.get(context).locale == const Locale('ar')) {
                  context.read<HomeViewCubit>().cachedLanguageCode('en');
                } else {
                  context.read<HomeViewCubit>().cachedLanguageCode('ar');
                }
              },
                mouseCursor: SystemMouseCursors.click,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                icon:  Icon(
                  Icons.language_outlined,
                  color: ColorManager.primary,
                ),)
            ],
            leading: IconButton(
                onPressed: (){
                  scaffoldState.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu)),
          )
              : null,
          backgroundColor: Colors.white,
          body: AdaptiveLayout(
            mobileLayout: (context)  => const Scaffold(
              backgroundColor: Colors.red,),
            tabletLayout: (context)  => const Scaffold(
              backgroundColor: Colors.red,
            ),
            desktopLayout: (context) => const Scaffold(
              backgroundColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
