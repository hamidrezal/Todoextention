import 'package:get/get.dart';
import 'package:task_list/control/controller/task_controller.dart';

class TaskListbinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TaskModelController());
  }
}