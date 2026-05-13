import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showLoadingDialog(
    BuildContext context, {
    bool isDisable = false,
  }) {
    showDialog(
      barrierDismissible: isDisable,
      context: context,
      builder: (context) => PopScope(
        canPop: isDisable,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [CircularProgressIndicator()],
          ),
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMassage(BuildContext context, String massage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Text(
          massage,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static void showToast(BuildContext context, String message, Color color) {
    final fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
