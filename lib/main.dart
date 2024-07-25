import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_to_do_app/layout/Auth/SignIn/LoginScreen.dart';
import 'package:task_to_do_app/layout/HomePage/HomePage.dart';
import 'package:task_to_do_app/shared/bloc_observer.dart';
import 'package:task_to_do_app/shared/components/constants.dart';
import 'package:task_to_do_app/shared/network/local/cache_helper.dart';
import 'package:task_to_do_app/shared/network/remote/dio_helper.dart';
import 'package:task_to_do_app/shared/resources/app_localizations.dart';
import 'package:task_to_do_app/shared/resources/color_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'layout/AddTask/AddTask.dart';
import 'layout/Auth/SignIn/Cubit/SignInCubit.dart';
import 'layout/Auth/SignUp/Cubit/SignUpCubit.dart';
import 'layout/Home View/cubit/homeview_cubit.dart';
import 'layout/HomePage/Cubit/HomePageCubit.dart';
import 'layout/Profile/Cubit/ProfileCubit.dart';
import 'layout/Task Details/TaskDetails.dart';
import 'layout/onBoarding/onBoarding.dart';

Future<void> main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.inti();
  await CacheHelper.init();
  runApp(const MyApp());
  token = CacheHelper.getData(key: 'Token');

  await Future.delayed(Duration.zero);
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    fullScreen: false,
    // minimumSize: Size(1200, 800),// Set the desired window size (width, height)
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.isFullScreen();
    await windowManager.setFullScreen(false);
    await windowManager.focus();
    // await windowManager.setSize(const Size(1200, 800));
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeViewCubit>(create: (context) => HomeViewCubit()..getSavedLanguage()),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => ProfileCubit()..getProfileData()),
        BlocProvider(create: (BuildContext context) => SignUpCubit()),
        BlocProvider(create: (BuildContext context) => HomePageCubit()..getList(status: "/todos" ),),



    ],
      child: BlocConsumer<HomeViewCubit, HomeViewState>(
        builder: (BuildContext context, HomeViewState state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: HomeViewCubit.get(context).locale,
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocal, supportedLocales) {
            for (var locale in supportedLocales) {
              if (deviceLocal != null &&
                  deviceLocal.languageCode == locale.languageCode) {
                return deviceLocal;
              }
            }
            return supportedLocales.first;
          },
          theme: ThemeData(
            colorScheme:
            ColorScheme.fromSeed(seedColor: ColorManager.primary),
            useMaterial3: true,
          ),
          title: 'ToDoApp',
          home:SignInScreen(),
          // home:   AnimatedSplashScreen(
          //   splash: Image.asset(Assets.imagesLogo),
          //   nextScreen:   Profile(),
          //   splashTransition: SplashTransition.fadeTransition,
          //   backgroundColor:  const Color(0xff5F33E1),
          //   splashIconSize: 45,
          //   duration: 5000,
          // ),
        ),
        listener: (BuildContext context, HomeViewState state) {  },
      ),);
  }
}

