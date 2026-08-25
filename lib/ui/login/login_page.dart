import 'package:cinebox_flutter/ui/core/themes/resource.dart';
import 'package:cinebox_flutter/ui/login/commands/login_with_google_command.dart';
import 'package:cinebox_flutter/ui/login/login_view_model.dart';
import 'package:cinebox_flutter/ui/login/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.assetsImagesBgLoginPng,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.only(top: 108),
            child: Column(
              spacing: 48,
              children: [
                Image.asset(
                  R.assetsImagesLogoPng,
                  width: 200,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(loginWithGoogleCommandProvider);
                      return SignInGoogleButton(
                        isLoading: state.isLoading,
                        onPressed: () {
                          final viewModel = ref.read(loginViewModelProvider);
                          viewModel.googleLogin();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
