import 'package:flutter/material.dart';
import 'package:foodmonkey/utils/Constants.dart';

class TrianglePainter extends CustomPainter{
  var msize;
  TrianglePainter({required this.msize});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = accent;

    var upPath = Path();
    upPath.moveTo(msize.width/3, 0);
    upPath.lineTo(msize.width, 0);
    upPath.lineTo(msize.width, msize.height/3);
    upPath.close();

    var downPath = Path();
    downPath.moveTo(0, (msize.height/3)*2);
    downPath.lineTo(0, msize.height);
    downPath.lineTo((msize.width/5)*3, msize.height);
    downPath.close();

    canvas.drawPath(upPath, paint);
    canvas.drawPath(downPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}