import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
  var path = Path();
  path.lineTo(0, size.height);
  
  // first left curve
  final firstcurve = Offset(0, size.height - 20);
  final firstlastcurve = Offset(30 , size.height - 20);

  path.quadraticBezierTo(firstcurve.dx, firstcurve.dy, firstlastcurve.dx, firstlastcurve.dy);


 // centre straight line
  final secondcurve = Offset(0, size.height - 20);
  final secondlastcurve = Offset(size.width - 30 , size.height - 20);

  path.quadraticBezierTo(secondcurve.dx, secondcurve.dy, secondlastcurve.dx, secondlastcurve.dy);


  //last right side curve
  final lastcurve = Offset(size.width, size.height - 20);
  final lasttlastcurve = Offset(size.width , size.height);

  path.quadraticBezierTo(lastcurve.dx, lastcurve.dy, lasttlastcurve.dx, lasttlastcurve.dy);



  path.lineTo( size.width,0);
  path.close();
  return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}