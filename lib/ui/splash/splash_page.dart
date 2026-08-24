import 'package:cinebox_flutter/ui/core/themes/resource.dart';
import 'package:cinebox_flutter/ui/core/widgets/loader_messages.dart';
import 'package:cinebox_flutter/ui/splash/commands/check_user_logged_command.dart';
import 'package:cinebox_flutter/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with LoaderAndMessages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider).checkLoginAndRedirect();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkUserLoggedCommandProvider, (_, next) {
      next.whenOrNull(
        data: (data) {
          final path = switch (data) {
            true => '/home',
            false => '/login',
            _ => '',
          };

          if (path.isNotEmpty && context.mounted) {
            Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
          }
        },

        error: (error, stackTrace) {
          if (context.mounted) {
            showErrorSnackbar('Erro ao verificar login');
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          }
        },
      );
    });

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
          Center(
            child: Image.asset(
              R.assetsImagesLogoPng,
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
