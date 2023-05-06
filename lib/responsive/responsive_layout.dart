import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  static String routeName = '/responsiveLayout';
  final Widget mobileBody;
  final Widget TabletBody;

  ResponsiveLayout({required this.mobileBody, required this.TabletBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < 600){
            return mobileBody;
          } else {
            return TabletBody;
          }
        }
    );
  }
}