import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/local/cache_helper.dart';



part 'homeview_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());

  static HomeViewCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;


  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNav());
  }


  Locale locale = const Locale('ar');

  Future<String> getCachedSavedLanguage() async {
    final String? cachedLanguageCode = await CacheHelper.getData(key: 'LOCALE');
    if (cachedLanguageCode != null) {
      debugPrint('cachedLanguageCode');
      return cachedLanguageCode;
    } else {
      debugPrint('cachedLanguageCodeEn');
      return 'en';
    }
  }

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await getCachedSavedLanguage();
    locale = Locale(cachedLanguageCode);
    emit(ChangeLocalState());
  }

  Future<void> cachedLanguageCode(String languageCode) async {
    CacheHelper.saveData(key: 'LOCALE', value: languageCode);
    locale = Locale(languageCode);
    emit(ChangeLocalState());
  }

  //
  // NotificationsModel? notification ;
  // Future<void> getNotification() async {
  //   emit(LoadingGetNotification());
  //   await DioHelper.getDate(url: '${AppStrings.getAllUsers}/notifications').then((value) {
  //     notification = NotificationsModel.fromJson(value.data);
  //     emit(SuccessGetNotification());
  //   }).catchError((onError) {
  //     if (kDebugMode) {
  //       print(onError.toString());
  //     }
  //     if (onError is DioException) {
  //       debugPrint(onError.response!.data['message']);
  //       debugPrint(onError.message);
  //       emit(ErrorGetNotification(onError.response!.data['message']));
  //     }
  //   });
  // }



  // Future<void> deleteNotification({required String id}) async {
  //   emit(LoadingDeleteNotification());
  //   await DioHelper.deleteData(url: '${AppStrings.getAllUsers}/notifications/$id').then((value) {
  //     emit(SuccessDeleteNotification());
  //   }).catchError((onError) {
  //     if (onError is DioException) {
  //       debugPrint(onError.response!.data['message']);
  //       debugPrint(onError.message);
  //       emit(ErrorDeleteNotification(onError.response!.data['message']));
  //     }
  //   });
  // }
}
