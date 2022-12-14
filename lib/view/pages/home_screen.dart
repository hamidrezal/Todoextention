import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
     body: Container(
       width: 600,
       height: 900,
       decoration: BoxDecoration(
         color: Colors.grey[300],
         borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(width*0.03),
         bottomRight: Radius.circular(width*0.03),
       ),),
       child: ListView(
         children: [
           /// AppBar
           _customAppbar(height: height, width: width),
          ///Task Listview
          Container(
            width: width,
            height: 700,
            child:  ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            /// bottom right shadow is darker
                            BoxShadow(color: Colors.grey.shade500,
                                offset: Offset(4,4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            /// top left shadow is darker
                            const BoxShadow(color: Colors.white,
                                offset: Offset(-4,-4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ],
                          color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(width*0.013)
                      ),
                      width: width,
                      height: 200,

                    ),
                  );
                }),
          )

         ],
       ),
     ),
    );
  }
}
/// Custom AppBar
class _customAppbar extends StatelessWidget {
  const _customAppbar({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.1,
      decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width*0.03),
            bottomRight: Radius.circular(width*0.03),
          ),

      ),
      child: Column(children: [
        Padding(
          padding:  EdgeInsets.only(left: width*0.02,top: height*0.02),
          child: Row(
            children: [
              Text("All",style: TextStyle(color: Colors.white,fontSize: width*0.013),),
              const Text(" tasks",style: TextStyle(color: Colors.white))
            ],
          ),
        )
      ],),);
  }
}

