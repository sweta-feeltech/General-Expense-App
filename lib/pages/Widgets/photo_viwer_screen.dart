import 'package:flutter/material.dart';
import 'package:general_expense_app/Utils/api_end_points.dart';
import 'package:photo_view/photo_view.dart';


class PhotoViwerScreen extends StatefulWidget {
  final String path;
  const PhotoViwerScreen({Key? key, required this.path}) : super(key: key);

  @override
  State<PhotoViwerScreen> createState() => _PhotoViwerScreenState();
}

class _PhotoViwerScreenState extends State<PhotoViwerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
            child: PhotoView(
              imageProvider: NetworkImage("${BASEIMAGEURL}${widget.path}"),
            )
        ),
      ),


    );
  }
}
