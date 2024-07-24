import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_to_do_app/shared/bloc_observer.dart';
import 'package:task_to_do_app/shared/network/local/cache_helper.dart';
import 'package:task_to_do_app/shared/network/remote/dio_helper.dart';
import 'package:task_to_do_app/shared/resources/app_localizations.dart';
import 'package:task_to_do_app/shared/resources/color_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'layout/Auth/SignIn/LoginScreen.dart';
import 'layout/Auth/SignUp/SignUpScreen.dart';
import 'layout/Home View/cubit/homeview_cubit.dart';

Future<void> main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.inti();
  await CacheHelper.init();
  runApp(const MyApp());

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
      BlocProvider<HomeViewCubit>(
        create: (context) => HomeViewCubit()
          ..getSavedLanguage()
      ),


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
          home:   SignUpScreen(),
          // home:   AnimatedSplashScreen(
          //   splash: Image.asset(Assets.imagesLogo),
          //   nextScreen:  OnBoarding(),
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

// getNotificationStream({required BuildContext context}) {
//   return Stream.periodic(const Duration(minutes: 30), (i) {
//     HomeViewCubit.get(context).getNotification();
//   });
// }
//
// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//
//     return Future.error('Location services are disabled.');
//   }
//
//   permission = await Geolocator.checkPermission();
//   await Geolocator.requestPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       Geolocator.openLocationSettings();
//
//       Geolocator.requestPermission();
//       return Future.error('Location permissions are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//
//   return await Geolocator.getCurrentPosition();
// }