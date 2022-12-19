import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_list/model/task_model.dart';
import 'package:get_storage/get_storage.dart';
class TaskModelController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  TextEditingController? tasktitle;

  @override
  void onInit() {
    tasktitle = TextEditingController();
    // save tasks list in storage
    var box = GetStorage();
    if (box.read('tasks') !=null){
      var list = box.read('tasks');
      for(var task in list){
          tasks.add(TaskModel.fromJson(task));
      }
    }
    ever(tasks, (value){
      box.write('tasks', tasks.toJson());
    });
    super.onInit();
  }
}