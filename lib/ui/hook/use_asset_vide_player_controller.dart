import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useAssetVideoController({
  required String asset,
  String? package,
  bool autoPlay = false,
  bool looping = false,
}) {
  return use(
    _AssetVideoPlayerControllerHook(
      asset: asset,
      package: package,
      autoPlay: autoPlay,
      looping: looping,
      keys: [asset, package, autoPlay, looping],
    ),
  );
}

class _AssetVideoPlayerControllerHook extends Hook<VideoPlayerController> {
  const _AssetVideoPlayerControllerHook({
    required this.asset,
    this.package,
    required this.autoPlay,
    required this.looping,
    List<Object?>? keys,
  }) : super(keys: keys);

  final String asset;
  final String? package;
  final bool autoPlay;
  final bool looping;

  @override
  _AssetVideoPlayerControllerHookState createState() =>
      _AssetVideoPlayerControllerHookState();
}

class _AssetVideoPlayerControllerHookState
    extends HookState<VideoPlayerController, _AssetVideoPlayerControllerHook> {
  late final VideoPlayerController _controller =
      VideoPlayerController.asset(hook.asset, package: hook.package);

  @override
  void initHook() {
    _controller
      ..initialize()
      ..setLooping(hook.looping);

    if (hook.autoPlay) {
      _controller.play();
    }
  }

  @override
  VideoPlayerController build(BuildContext context) => _controller;

  @override
  void dispose() => _controller.dispose();
}
