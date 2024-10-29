import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/utility/permission_utils.dart';
import 'package:kualiva_merchant_mb/common/utility/lelog.dart';
import 'package:kualiva_merchant_mb/common/utility/video_constant.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoPlayerController;
  bool _hasVideoCompleted = false;

  @override
  void initState() {
    super.initState();
    LeLog.pd(this, initState, "First initialized");
    _videoPlayerController =
        VideoPlayerController.asset(VideoConstant.splashVideo);
    _videoPlayerController.setVolume(0.0);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.addListener(_videoListener);
    });
    _videoPlayerController.play();
    LeLog.pd(this, initState, "Last initialized");
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_videoListener);
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _videoListener() async {
    if (_videoPlayerController.value.position ==
        const Duration(seconds: 0, minutes: 0, hours: 0)) {
      LeLog.pd(this, _videoListener, "Video Started");
    }

    if (_videoPlayerController.value.position ==
            _videoPlayerController.value.duration &&
        !_hasVideoCompleted) {
      _hasVideoCompleted = true;
      LeLog.pd(this, _videoListener, "Video Ended");
      if (await PermissionUtils.checkDevicePermission()) {
        if (!mounted) return;
      } else {
        if (!mounted) return;
        Navigator.pushNamed(context, AppRoutes.signInScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: ThemeData.light(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _videoSplash(context),
    );
  }

  Widget _videoSplash(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? FittedBox(
            fit: BoxFit.contain,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: SizedBox(
                width: 250.h,
                height: 250.h,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
