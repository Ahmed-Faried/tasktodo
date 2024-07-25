

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../models/SigninModel.dart';
import 'SignInStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialStateLoginScreen());

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  var passwordController = TextEditingController();




  bool isPassword = true;
  IconData showPassword = Icons.visibility_off_rounded;

  void changePasswordRegister() {
    isPassword = !isPassword;
    showPassword = isPassword ? Icons.visibility_off_rounded : Icons.visibility;

    emit(ChangePasswordIconRegister());
  }
   late SignInModel signInModel ;

  login({
    required String phone,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
        data: {
          'phone': phone,
          'password': password
        },
        url: '/auth/login'
    ).then((value) async {
      signInModel = SignInModel.fromJson(value.data);
      CacheHelper.saveData(key: 'Token', value: signInModel.accessToken );
      token = CacheHelper.getData(key: 'Token');
      print(token);




      emit(LoginSuccessState(signInModel));
    }).catchError((onError) {
      print(onError.toString());
      if (onError is DioException) {
        if (onError.response != null) {

        } else {
          print(onError.message);
        }
      } else {
        print(onError.toString());
      }
      emit(LoginErrorState(onError.response!.data['message']));
    });
  }










}




