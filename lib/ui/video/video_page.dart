import 'package:app/gen/assets.gen.dart';
import 'package:app/ui/hook/use_asset_vide_player_controller.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends HookWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(appThemeProvider);
    final l10n = useL10n();
    final videoController = useAssetVideoController(
      asset: Assets.videos.bigbuckbunny,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.video,
          style: theme.textTheme.h60.bold().rotunda(),
        ),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(videoController),
        ),
      ),
    );
  }
}
