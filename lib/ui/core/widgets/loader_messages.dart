import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderAndMessages<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var _isOpen = false;

  void showLoader() {
    if (!_isOpen) {
      _isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => LoadingAnimationWidget.threeArchedCircle(
          color: Colors.white,
          size: 60,
        ),
      );
    }
  }

  void hideLoader() {
    if (_isOpen) {
      _isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showSnackbar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showErrorSnackbar(String message) =>
      _showSnackbar(message, AppColors.redColor);

  void showSuccessSnackbar(String message) =>
      _showSnackbar(message, Colors.green);

  void showInfoSnackbar(String message) =>
      _showSnackbar(message, Colors.lightBlue);
}
