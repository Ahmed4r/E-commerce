import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';

class Dialogutils {
  static void showLoading({
    required BuildContext context,
    required String loadingLabel,
    bool barrierDismissible = false,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Appcolors.primaryColor,
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                  width: 20), // Adds spacing between the indicator and text
              Expanded(
                child: Text(
                  loadingLabel,
                  style: TextStyle(fontSize: 18, color: Appcolors.whiteColor),
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void showMessage({
    required BuildContext context,
    required String content,
    String title = 'message', // Added default title
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Appcolors.primaryColor,
          title: Text(title,
              style: TextStyle(fontSize: 22, color: Appcolors.whiteColor)),
          content: Text(
            content,
            style: TextStyle(fontSize: 18, color: Appcolors.whiteColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog on button press
              },
              child: Text('OK', style: TextStyle(color: Appcolors.whiteColor)),
            ),
          ],
        );
      },
    );
  }
}
