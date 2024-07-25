

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_to_do_app/layout/HomePage/Cubit/HomePageState.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../Auth/SignIn/Cubit/SignInStates.dart';
import '../../Auth/SignIn/models/SigninModel.dart';
import '../Model/TaskModel.dart';


class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(InitialStateHomePageScreen());

  static HomePageCubit get(context) {
    return BlocProvider.of(context);
  }





  List<TaskModel> taskModel = [] ;

  Future<void> getList({required status}) async {

    emit(GetListLoadingState());
   await DioHelper.getDate(
        url: status
    ).then((value) async {
      taskModel = (value.data as List).map((e) => TaskModel.fromJson(e)).toList();

      print(token);
      print(taskModel);


      emit(GetListSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      if (onError is DioException) {
        if (onError.response != null) {
          print(onError.response);

        } else {
          print(onError.message);
        }
      } else {
        print(onError.toString());
      }
      emit(GetListErrorState());
    });
  }










}




