import 'package:flutter/cupertino.dart';


class CustomShape extends StatelessWidget {
  const CustomShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(width, (width*1.49).toDouble()),
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8183333,size.height*0.6876895);
    path_0.lineTo(size.width*0.03148148,size.height*0.6876895);
    path_0.lineTo(size.width*0.03148148,size.height*0.08847875);
    path_0.arcToPoint(Offset(size.width*0.07629630,size.height*0.05603405),radius: Radius.elliptical(size.width*0.04847222, size.height*0.03253169),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.7717593,size.height*0.02071837);
    path_0.arcToPoint(Offset(size.width*0.8183333,size.height*0.04985707),radius: Radius.elliptical(size.width*0.04351852, size.height*0.02920706),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff4f5464).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.03148148,size.height*0.7810154);
    path_1.lineTo(size.width*0.9100741,size.height*0.7810154);
    path_1.lineTo(size.width*0.9100741,size.height*0.06881680);
    path_1.arcToPoint(Offset(size.width*0.8580741,size.height*0.03627890),radius: Radius.elliptical(size.width*0.04859259, size.height*0.03261248),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(size.width*0.06362963,size.height*0.06400696);
    path_1.arcToPoint(Offset(size.width*0.03148148,size.height*0.08731668),radius: Radius.elliptical(size.width*0.03478704, size.height*0.02334700),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff30394c).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Color(0xff242d41).withOpacity(1.0);
    canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*0.03147222,size.height*0.07228436,size.width*0.9370648,size.height*0.9070718),bottomRight: Radius.circular(size.width*0.03806481),bottomLeft:  Radius.circular(size.width*0.03806481),topLeft:  Radius.circular(size.width*0.03806481),topRight:  Radius.circular(size.width*0.03806481)),paint_2_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}