

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../models/SignupModel.dart';
import 'SignUpStates.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialStateRegisterScreen());

  static SignUpCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController nameController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController();
  TextEditingController yearsOfExperienceController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? selectedExperienceLevel;
  final List<String> experienceLevels = ['fresh', 'junior', 'midLevel', 'senior'];



  bool isPassword = true;
  IconData showPassword = Icons.visibility_off_rounded;

  void changePasswordRegister() {
    isPassword = !isPassword;
    showPassword = isPassword ? Icons.visibility_off_rounded : Icons.visibility;

    emit(ChangePasswordIconRegister());
  }



   late SignUpModel signUpModel ;

  Register({
    required String phone,
    required String displayName,
    required int experienceYears,
    required String address,
    required String level,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
        data: {
          'phone': phone,
          'displayName': displayName,
          'experienceYears': experienceYears,
          'address': address,
          'level': level,
          'password': password
        },
        url: "/auth/register"
    ).then((value) async {
      signUpModel = SignUpModel.fromJson(value.data);
      await CacheHelper.saveData(key: 'Token', value: signUpModel.accessToken);
      token = CacheHelper.getData(key: 'Token');
      print(token);

      emit(RegisterSuccessState());
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
      emit(RegisterErrorState(onError.response?.data['message'].toString()));
    });
  }










}




