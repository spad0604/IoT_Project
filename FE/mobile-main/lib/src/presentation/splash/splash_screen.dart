import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/di/di.dart';
import '../../config/navigation/app_router.dart';
import '../../config/remote_config.dart';
import '../../data/local/shared_preferences_manager.dart';
import '../../gen/assets.gen.dart';
import '../../service/app_ad_id_manager.dart';
import '../../shared/enum/ads/ad_remote_key.dart';
import '../../shared/mixin/ads_mixin.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    if (mounted) {
    }
    if (mounted) {
      await setInitScreen();
    }
  }

  Future<void> setInitScreen() async {
    final bool isFirstLaunch =
        await getIt<SharedPreferencesManager>().getIsFirstLaunch();
    if (isFirstLaunch && context.mounted) {
      AutoRouter.of(context).replace(LanguageRoute(isFirst: true));
    } else {
      AutoRouter.of(context).replace(const MyHomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          //error render
          // ListView()
        ],
      ),
    );
  }
}
