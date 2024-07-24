import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';

import '../resources/app_styles.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.readOnly = false,
    this.obscureText = false,
    required this.validator,
    this.prefix,
    this.inputFormatters,
  });


  final String hint;

  final bool? enabled;

  final bool? readOnly;
  final TextEditingController? controller;

  final TextInputType keyboardType;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  final Widget? prefix;
  final bool obscureText;

  final inputFormatters ;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(20),
      color: const Color(0xFFD9D9D9),
      child: Center(
        child: TextFormField(
          enabled: enabled,
          readOnly: readOnly!,
          inputFormatters: inputFormatters,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          style: TextStyle(color: Colors.black,fontSize: getResponsiveFontSize(context, fontSize: 24)),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 27 , vertical: 19),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefix: prefix,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 24),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF919191)),
            border: InputBorder.none,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

void toast({required BuildContext context,
  required ToastificationType type,
  required String title,
  required String description,
  required IconData icon,
  required Color primaryColor,

}) {
  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 4),
    title:  Text(title),
    description: RichText(text:  TextSpan(text: description, style: const TextStyle(color: Colors.black))),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 500),
    animationBuilder: (context, animation, alignment, child) {
      return SlideTransition(
        position: CurvedAnimation(
          parent: animation,
          curve: Curves.fastLinearToSlowEaseIn,
        ).drive((Tween<Offset>(
          begin: const Offset(1.5, 0),
          end: const Offset(0, 0),
        ))),
        child: child,
      );
    },
    icon: Icon(icon),
    primaryColor: primaryColor,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: true,
    pauseOnHover: false,
    dragToClose: false,
    applyBlurEffect: false,
  );
}



class MyResponsiveGrid extends StatelessWidget {
  const MyResponsiveGrid({super.key, required this.itemBuilder, required this.itemCount});

  final int itemCount;
  final  Widget? Function(BuildContext, int) itemBuilder ;
  @override
  Widget build(BuildContext context) {

    // Set the default number of columns to 3.
    int columnsCount = 2;

    // Define the icon size based on the screen width

    // Use the ResponsiveUtils class to determine the device's screen size.
    if (ResponsiveUtils.isMobile(context)) {
      columnsCount = 1;
    } else if (ResponsiveUtils.isTablet(context)) {
      columnsCount = 2;
    }else if (ResponsiveUtils.isDesktop(context)) {
      columnsCount = 4;
    }

    // Build the grid view using the number of columns.
    return GridView.builder(
      // Set padding and spacing between cards.
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // Set the number of columns based on the device's screen size.
        crossAxisCount: columnsCount,
        // Set the aspect ratio of each card.
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      // Set the number of items in the grid view.
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      // Set the grid view to shrink wrap its contents.
      shrinkWrap: true,
      // Disable scrolling in the grid view.
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}


class ResponsiveUtils {
  // Check if the device is considered as mobile based on screen width.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 420; //576

  // Check if the device is considered as tablet based on screen width.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 420 &&
          MediaQuery.of(context).size.width <= 750; //1024

  // Check if the device is considered as desktop based on screen width.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200; //1366
}

class CustomTextInputPopUp extends StatelessWidget {
  CustomTextInputPopUp({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.readOnly = false,
    this.obscureText = false,
    required this.validator,
    this.prefix,
    this.inputFormatters,
  });


  final String hint;

  final bool? enabled;

  final bool? readOnly;
  final TextEditingController? controller;

  final TextInputType keyboardType;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  final Widget? prefix;
  final bool obscureText;

  final inputFormatters ;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  ShapeDecoration(
        color: const Color(0x4CD9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black.withOpacity(0.10000000149011612),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: TextFormField(
          enabled: enabled,
          readOnly: readOnly!,
          inputFormatters: inputFormatters,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          style: TextStyle(color: Colors.black,fontSize: getResponsiveFontSize(context, fontSize: 24)),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 27 , vertical: 19),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefix: prefix,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 24),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF919191)),
            border: InputBorder.none,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}