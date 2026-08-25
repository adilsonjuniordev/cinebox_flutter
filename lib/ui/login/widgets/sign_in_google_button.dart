import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';

class SignInGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const SignInGoogleButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: .center,
        children: [
          Align(
            alignment: .centerLeft,
            child: Visibility(
              visible: !isLoading,
              replacement: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.darkGrey,
                    strokeWidth: 1.5,
                  ),
                ),
              ),
              child: Align(
                alignment: .centerLeft,
                child: Image.asset(R.assetsImagesGoogleLogoPng),
              ),
            ),
          ),

          Text(
            !isLoading ? 'Entrar com Google' : 'Realizando login...',
            style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
