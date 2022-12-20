import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../control/controller/task_controller.dart';
import '../../model/task_model.dart';

// text field
class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    Key? key,
    required this.width,
    required this.taskcontroller,
    required this.uuid,
  }) : super(key: key);
  final Uuid uuid;
  final double width;
  final TaskModelController taskcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child:Container(
        width: width,
        height: 45,
        decoration: BoxDecoration(
            color: const Color(0xff343a3f),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
              controller: taskcontroller.tasktitle,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              onSubmitted: (value){
                taskcontroller.tasks.add(TaskModel(
                  tasktitle:taskcontroller.tasktitle!.text ,
                  status: false,
                  id: uuid.v4(),
                ));
                taskcontroller.tasktitle?.clear();
              },
              decoration: InputDecoration(
                hintText: "Enter Your Task",
                hintStyle: TextStyle(color: Colors.grey[700],fontSize: 14),
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
              )
          ),
        ),
      ),);
  }
}