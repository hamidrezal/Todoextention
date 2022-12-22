import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_list/control/controller/task_controller.dart';
import 'package:uuid/uuid.dart';
import 'package:task_list/view/widgets/textfield_widgets.dart';

import '../shapes/CustomDrawShape.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var taskcontroller = Get.find<TaskModelController>();
    var uuid =const Uuid(); // generate auto unic id
    return Scaffold(
      backgroundColor: const Color(0xff00091f),
      body:  ListView(
        children: [
          _Header(width: width,taskcontroller: taskcontroller,uuid: uuid,),/// Herder Section :  Time
          /// Task ListView
          Stack(
            children: [
              Container(
                height: 450,
                child: CustomShape(),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 50,left: 10,right: 10),
                  width: width,
                  height: 350,
                  child: Obx(()=>ListView.builder(
                      itemCount: taskcontroller.tasks.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
                          child: SizedBox(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  /// Checkbox
                                  Container(
                                    width: 8,
                                    height: 8,
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      side: const BorderSide(color: Color(0xfff56369)),
                                      checkColor: Colors.white,
                                      activeColor: const Color(0xfff56369),
                                      onChanged: (value) {
                                        taskcontroller.tasks[index].status =! taskcontroller.tasks[index].status!;
                                        Get.find<TaskModelController>().tasks[index] = taskcontroller.tasks[index];
                                      },
                                      value:taskcontroller.tasks[index].status,),
                                  ),
                                  /// #
                                  const Padding(
                                    padding: EdgeInsets.only(left:10,right: 5),
                                    child: Text("#",style: TextStyle(color: Color(0xffc6c6c6)),),
                                  ),
                                  /// task title
                                  SizedBox(
                                    width: width*0.7,
                                    child: Text(taskcontroller.tasks[index].tasktitle.toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: taskcontroller.tasks[index].status! ? const Color(0xfff56369): const Color(0xffc6c6c6),
                                          decoration: taskcontroller.tasks[index].status!? TextDecoration.lineThrough :TextDecoration.none),),
                                  )
                                ],
                                ),
                                /// delete icon
                                GestureDetector(
                                  onTap: (){taskcontroller.tasks.removeAt(index);},
                                  child: Icon(Icons.delete,color: Colors.grey[500],size: 20,),
                                )
                              ],
                            ),
                          ),
                        );
                      }),)
              ),
            ],
          ),
          /// text field
          CustomTextFeild(width: width, taskcontroller: taskcontroller,uuid: uuid),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.width,
    required this.taskcontroller,
    required this.uuid,
  }) : super(key: key);

  final double width;
  final TaskModelController taskcontroller;
  final Uuid uuid;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 70,
      child: Padding(
        padding:  const EdgeInsets.only(left: 15,right: 15,top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             ///Time
             Text(DateFormat.yMMMMd().format(DateTime.now()),
               style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),
               //_AddTasksection(width: width, taskcontroller: taskcontroller, uuid: uuid),/// Add Buttton
           ],),
            /// Task counter
             Padding(
              padding:  EdgeInsets.only(top: 5),
              child: Obx(() => Text("${Get.find<TaskModelController>().tasks.length} AllTasks",style: const TextStyle(fontSize: 12,color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
