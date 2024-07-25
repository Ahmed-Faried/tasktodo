
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../Task Details/Cubit/TaskDetailsState.dart';
import 'AddTaskState.dart';


class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(InitialStateAddTaskScreen());

  static AddTaskCubit get(context) {
    return BlocProvider.of(context);
  }





  CreateTask({
    required String title,
    required String image,
    required String desc,
    required String priority,
    required String dueDate,
  }) {
    emit(CreateTaskLoadingState());
    DioHelper.postData(
        data: {
          'title': title,
          'desc': desc,
          'priority': priority,
          'dueDate': dueDate,
          'image': image,
        },
        url: "/todos"
    ).then((value) async {

      emit(CreateTaskSuccessState());
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
      emit(CreateTaskErrorState());
    });
  }









}




