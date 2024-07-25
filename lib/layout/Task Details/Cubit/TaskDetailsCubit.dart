
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../Model/TaskDetailsModel.dart';
import 'TaskDetailsState.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(InitialStateTaskDetailsScreen());

  static TaskDetailsCubit get(context) {
    return BlocProvider.of(context);
  }




  TaskDetailsModel? taskDetailsModel ;

  Future<void> getTaskID({
    required String id,

  }) async {
    emit(CreateTaskLoadingScreen());
   await DioHelper.getDate(

        url: "/todos/$id"
    ).then((value) async {
      taskDetailsModel = TaskDetailsModel.fromJson(value.data);

      emit(CreateTaskSuccessScreen());
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
      emit(CreateTaskErrorScreen());
    });
  }
}


