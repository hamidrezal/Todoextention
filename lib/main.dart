import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_list/control/binding/TaskListBinding.dart';
import 'package:task_list/view/pages/home_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const TodoExtention());
}

class TodoExtention extends StatelessWidget {
  const TodoExtention({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     initialBinding: TaskListbinding(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}