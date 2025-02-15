
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:momagictask/app/core/utils/size_extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Ui {
  Ui._();
  static GetSnackBar successSnackBar({String title = 'Success', required String message}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.titleLarge!.merge(const TextStyle(color: Colors.white))),
      messageText: Text(message, style: Get.textTheme.bodySmall!.merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: const Icon(Icons.check_circle_outline, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 5),
    );
  }

  static GetSnackBar errorSnackBar({String title = 'Something went wrong!', required String message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.titleLarge!.merge(const TextStyle(color: Colors.white))),
      messageText: Text(message.tr, style: Get.textTheme.bodySmall!.merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.remove_circle_outline, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }
  //
  // static GetSnackBar authenticationErrorSnackBar({required String title, required String message}) {
  //   Get.log("[$title] $message", isError: true);
  //   return GetSnackBar(
  //     titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(TextStyle(color: Get.theme.primaryColor))),
  //     messageText: Text(message.tr, style: Get.textTheme.caption!.merge(TextStyle(color: Get.theme.primaryColor))),
  //     snackPosition: SnackPosition.BOTTOM,
  //     margin: const EdgeInsets.all(20),
  //     backgroundColor: Colors.redAccent,
  //     icon: Icon(Icons.remove_circle_outline, size: 32, color: Get.theme.primaryColor),
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
  //     borderRadius: 8,
  //     duration: const Duration(seconds: 5),
  //   );
  // }
  //
  // static GetSnackBar defaultSnackBar({String title = 'Alert', required String message}) {
  //   Get.log("[$title] $message", isError: false);
  //   return GetSnackBar(
  //     titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(TextStyle(color: Get.theme.hintColor))),
  //     messageText: Text(message, style: Get.textTheme.caption!.merge(TextStyle(color: Get.theme.focusColor))),
  //     snackPosition: SnackPosition.BOTTOM,
  //     margin: const EdgeInsets.all(20),
  //     backgroundColor: Get.theme.primaryColor,
  //     borderColor: Get.theme.focusColor.withOpacity(0.1),
  //     icon: Icon(Icons.warning_amber_rounded, size: 32, color: Get.theme.hintColor),
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
  //     borderRadius: 8,
  //     duration: const Duration(seconds: 5),
  //   );
  // }
  //
  static GetSnackBar notificationSnackBar({String title = 'Notification', required String message}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.titleLarge!.merge(const TextStyle(color: Colors.white))),
      messageText: Text(message, style: Get.textTheme.bodySmall!.merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: const Icon(Icons.notifications_none, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }


  static BoxFit getBoxFit(String boxFit) {
    switch (boxFit) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'none':
        return BoxFit.none;
      case 'scale_down':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  static AlignmentDirectional getAlignmentDirectional(String alignmentDirectional) {
    switch (alignmentDirectional) {
      case 'top_start':
        return AlignmentDirectional.topStart;
      case 'top_center':
        return AlignmentDirectional.topCenter;
      case 'top_end':
        return AlignmentDirectional.topEnd;
      case 'center_start':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.topCenter;
      case 'center_end':
        return AlignmentDirectional.centerEnd;
      case 'bottom_start':
        return AlignmentDirectional.bottomStart;
      case 'bottom_center':
        return AlignmentDirectional.bottomCenter;
      case 'bottom_end':
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.bottomEnd;
    }
  }

  static CrossAxisAlignment getCrossAxisAlignment(String textPosition) {
    switch (textPosition) {
      case 'top_start':
        return CrossAxisAlignment.start;
      case 'top_center':
        return CrossAxisAlignment.center;
      case 'top_end':
        return CrossAxisAlignment.end;
      case 'center_start':
        return CrossAxisAlignment.center;
      case 'center':
        return CrossAxisAlignment.center;
      case 'center_end':
        return CrossAxisAlignment.center;
      case 'bottom_start':
        return CrossAxisAlignment.start;
      case 'bottom_center':
        return CrossAxisAlignment.center;
      case 'bottom_end':
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }



  static SizedBox customButton(
      {String? text,
      VoidCallback? press,
      Color? color,
      double width = double.infinity,
      double height = 56,
      double radius = 20,
      double fontSize = 18.0,
      Color textColor = Colors.white}) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          backgroundColor: color,
        ),
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }

  static InputDecoration getInputDecoration({String hintText = '', String? errorText, IconData? iconData, Widget? suffixIcon, Widget? suffix}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.bodySmall,
      prefixIcon: iconData != null ? Icon(iconData, color: Get.theme.focusColor).marginOnly(right: 14) : const SizedBox(),
      prefixIconConstraints: iconData != null ? const BoxConstraints.expand(width: 38, height: 38) : const BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(0),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  static Widget customSuffixIcon({svgIcon}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        20,
        20,
        20,
      ),
      child: Image.asset(
        svgIcon,
        height: 18,
      ),
    );
  }

  static Widget shimmerLoader({double? width = 200, double? height = 100, double? radius, Color? baseColor, Color? highlightColor}) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Get.theme.highlightColor,
      highlightColor: highlightColor ?? Get.theme.splashColor,
      child: Container(
          height: height, width: width, decoration: BoxDecoration(color: Get.theme.cardColor, borderRadius: BorderRadius.circular(radius ?? 8))),
    );
  }

  static customLottieLoader() {
    return Container(
      child: const Center(
        child: Image(
          image: AssetImage(
            'assets/loading.gif',
          ),
        ),
      ),
    );
  }

  static customLoader() {
    return SpinKitDoubleBounce(
      color: Get.theme.primaryColor,
    );
  }

  static customDialogLoader() {
    return Get.dialog(SpinKitDoubleBounce(
      color: Get.theme.primaryColor,
    ));
  }





  static noDataFound({String title = 'No data found', String url = 'assets/noData.json',double? width,double? height}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height??500,
          width: width??500,
          child: Lottie.asset(url),
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Get.theme.disabledColor,
            ),
          ),
        )
      ],
    );
  }

  static showAwesomeDialog(String title, String description, Color? color, VoidCallback? onTap,
      {bool showClose = false, bool isBarrierDismiss = true, String type = 'info', String okay = 'Yes, Proceed',
      double? width
      }) {
    return AwesomeDialog(
      context: Get.context!,
      dialogType: type == 'info' ? DialogType.infoReverse :type == 'success' ?DialogType.success:type == 'error' ?DialogType.error: DialogType.noHeader,
      borderSide: BorderSide(
        color: Get.theme.primaryColor,
        width: 1,
      ),
      btnOkColor: color ?? Colors.yellow.shade500,
      width: Get.size.width,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
      dismissOnTouchOutside: isBarrierDismiss,
      dismissOnBackKeyPress: false,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,

      title: title,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      desc: description,
      descTextStyle: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      showCloseIcon: false,

      btnCancel: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.p),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.p),
                ),
              ),
              child: Text(
                okay,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: (width ?? 200 * .03).h,
          ),
          showClose
              ? SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16.p),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.p),
                      ),
                    ),
                    child: Text(
                      'No, Close',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: (width ?? 200 * .03).h,
          ),
        ],
      ),

      // btnCancelOnPress: () {
      //   Get.back();
      // },
    ).show();
  }



 static void showCustomBottomSheet({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String message,
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                height: 5,
                width: 25,
                decoration: BoxDecoration(
                    color: Color(0xffD7D7D7),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: iconColor.withOpacity(0.2),
                      ),
                      child: Icon(
                        icon,
                        size: 30.0,
                        color: iconColor,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        onPressed: onButtonPressed,
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
