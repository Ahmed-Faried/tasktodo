import 'dart:developer';

import 'package:flutter/material.dart';

import 'size_config.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({super.key, required this.mobileLayout, required this.tabletLayout, required this.desktopLayout});

  final WidgetBuilder mobileLayout , tabletLayout , desktopLayout ;
  @override
  Widget build(BuildContext context) {
    log(MediaQuery.sizeOf(context).width.toString());
    return LayoutBuilder(
      builder: (context , constrains){
        if(constrains.maxWidth < SizeConfig.tablet){
          return mobileLayout(context);
        }
        else{
          return desktopLayout(context);
        }
      },
    );
  }
}
