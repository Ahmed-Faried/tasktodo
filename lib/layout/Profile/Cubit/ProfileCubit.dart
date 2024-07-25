

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../shared/components/constants.dart';
import '../models/ProfileModel.dart';
import 'ProfileStates.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialStateProfileScreen());

  static ProfileCubit get(context) {
    return BlocProvider.of(context);
  }



  ProfileModel? profileModel;

  Future<void> getProfileData() async{
    emit(ProfileLoadingState());
    await DioHelper.getDate(
        url: '/auth/profile',
    ).then((value) async {
      profileModel = ProfileModel.fromJson(value.data);
      print(profileModel?.address);
      emit(ProfileSuccessState());
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
      emit(ProfileErrorState());
    });
  }










}




