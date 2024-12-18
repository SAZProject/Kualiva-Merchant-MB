import 'package:bounce/bounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/utility/lelog.dart';
import 'package:motion/motion.dart';
// import 'package:kualiva_merchant_mb/common/utility/permission_utils.dart';
// import 'package:kualiva_merchant_mb/common/utility/video_constant.dart';
// import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late VideoPlayerController _videoPlayerController;
  // bool _hasVideoCompleted = false;

  double _logoHeight = 200.0;

  @override
  void initState() {
    super.initState();
    LeLog.pd(this, initState, "First initialized");
    _checkPermission();
    _startBounceAnimation();
    // _videoPlayerController =
    //     VideoPlayerController.asset(VideoConstant.splashVideo);
    // _videoPlayerController.setVolume(0.0);
    // _videoPlayerController.initialize().then((value) {
    //   setState(() {});
    //   _videoPlayerController.addListener(_videoListener);
    // });
    // _videoPlayerController.play();
    // LeLog.pd(this, initState, "Last initialized");
  }

  @override
  void dispose() {
    // _videoPlayerController.removeListener(_videoListener);
    // _videoPlayerController.dispose();
    super.dispose();
  }

  // void _videoListener() async {
  //   if (_videoPlayerController.value.position ==
  //       const Duration(seconds: 0, minutes: 0, hours: 0)) {
  //     LeLog.pd(this, _videoListener, "Video Started");
  //   }

  //   if (_videoPlayerController.value.position ==
  //           _videoPlayerController.value.duration &&
  //       !_hasVideoCompleted) {
  //     _hasVideoCompleted = true;
  //     LeLog.pd(this, _videoListener, "Video Ended");
  //     if (await PermissionUtils.checkDevicePermission()) {
  //       if (!mounted) return;
  //       Navigator.pushNamed(context, AppRoutes.signInScreen);
  //     } else {
  //       if (!mounted) return;
  //       Navigator.pushNamed(context, AppRoutes.signInScreen);
  //     }
  //   }
  // }

  void _checkPermission() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.signInScreen, (route) => false);
      },
    );
  }

  void _startBounceAnimation() {
    setState(() {
      _logoHeight = 100.h; // Set the target height for the bounce animation
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _logoHeight = 200.h; // Reset the height after the bounce animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _imageSplash(context),
    );
  }

  Widget _imageSplash(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceOut,
            width: 200.h,
            height: _logoHeight.h,
            child: Motion(
              shadow: const ShadowConfiguration(color: Colors.transparent),
              glare: GlareConfiguration.fromElevation(50),
              child: Bounce(
                child: Center(
                  child: Image.asset(
                    ImageConstant.appLogo,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.all(5.h),
            child: Text(
              context.tr("splash.app_title"),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  // Widget _videoSplash(BuildContext context) {
  //   return _videoPlayerController.value.isInitialized
  //       ? FittedBox(
  //           fit: BoxFit.contain,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(25.0),
  //             child: SizedBox(
  //               width: 250.h,
  //               height: 250.h,
  //               child: VideoPlayer(_videoPlayerController),
  //             ),
  //           ),
  //         )
  //       : const Center(child: CircularProgressIndicator());
  // }
}
