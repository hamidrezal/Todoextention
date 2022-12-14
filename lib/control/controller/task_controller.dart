import 'package:get/get.dart';
import 'package:task_list/model/task_model.dart';

class TaskModelController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
}