import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_list/control/controller/task_controller.dart';
import 'package:task_list/model/task_model.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var taskcontroller = Get.find<TaskModelController>();
    var uuid =const Uuid(); // generate auto unic id
    return Scaffold(
      backgroundColor: const Color(0xff3c4249),
      body: ListView(
        children: [
          _Header(width: width),/// Herder Section :  Time
         _AddTasksection(width: width, taskcontroller: taskcontroller, uuid: uuid),/// Divider : Add Buttton
          /// text field
          _CustomTextFeild(width: width, taskcontroller: taskcontroller,uuid: uuid),
          /// Task List
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: width,
            height: 300,
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
                          Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                checkColor: Colors.white,
                                activeColor: const Color(0xfff56369),
                                onChanged: (value) {
                                  taskcontroller.tasks[index].status =! taskcontroller.tasks[index].status!;
                                  Get.find<TaskModelController>().tasks[index] = taskcontroller.tasks[index];
                                },
                                value:taskcontroller.tasks[index].status,),
                              // #
                              const Padding(
                                padding: EdgeInsets.only(left: 3,right: 5),
                                child: Text("#",style: TextStyle(color: Color(0xffc6c6c6)),),
                              ),
                              /// task title
                              Text(taskcontroller.tasks[index].tasktitle.toString(),
                                style: TextStyle(color: taskcontroller.tasks[index].status! ? const Color(0xfff56369): const Color(0xffc6c6c6),
                                    decoration: taskcontroller.tasks[index].status!? TextDecoration.lineThrough :TextDecoration.none),)
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              taskcontroller.tasks.removeAt(index);
                            },
                            child: Icon(Icons.delete,color: Colors.grey[500],size: 20,),
                          )
                        ],
                      ),
                    ),
                  );
                }),)
          )
        ],
      ),
    );
  }
}

// text field
class _CustomTextFeild extends StatelessWidget {
  const _CustomTextFeild({
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
      height: 50,
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
            hintStyle: TextStyle(color: Colors.grey[700]),
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
          )
        ),
      ),
    ),);
  }
}
// Divider : Add Buttton
class _AddTasksection extends StatelessWidget {
  const _AddTasksection({
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
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ///Divider
        Container(width: width,height: 2, color: const Color(0xff2d333a),),
        /// AddButon
        Container(
        alignment: const Alignment(0.84,0),
        child:GestureDetector(
          onTap: (){
            taskcontroller.tasks.add(TaskModel(
              tasktitle:taskcontroller.tasktitle!.text ,
              status: false,
              id: uuid.v4(),
            ));
            taskcontroller.tasktitle?.clear();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xfff56369)),
            child: const Center(child: Icon(Icons.add,color: Colors.white,),),
          ),
        ),),


      ],
    );
  }
}
// Herder Section :  Time
class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      child: Padding(
        padding:  const EdgeInsets.only(left: 15,right: 40,top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             ///Time
             Text(DateFormat.yMMMMd().format(DateTime.now()),
               style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),
             Obx(() => Text("${Get.find<TaskModelController>().tasks.length} AllTasks",style: const TextStyle(fontSize: 12,color: Colors.white),))

           ],),
            /// Today
            const Padding(
              padding:  EdgeInsets.only(top: 10),
              child: Text("Today",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
