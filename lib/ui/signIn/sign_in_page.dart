import 'package:app/gen/assets.gen.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/component/loading/container_with_loading.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:app/ui/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(appThemeProvider);
    final l10n = useL10n();
    final user =
        useProvider(userViewModelProvider.select((value) => value.user));
    final userViewModel = context.read(userViewModelProvider);
    final loading = context.read(loadingStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.signIn,
          style: theme.textTheme.h60.bold().rotunda(),
        ),
      ),
      body: ContainerWithLoading(
        child: Column(
          children: [
            const Gap(16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: theme.appColors.divider),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: profileImageProvider(user?.imageUrl),
                        ),
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? l10n.displayName,
                            style: theme.textTheme.h50,
                          ),
                          const Gap(10),
                          Text(
                            user?.email ?? l10n.email,
                            style: theme.textTheme.h30,
                          ),
                          const Gap(10),
                          Text(
                            user?.userId ?? l10n.uid,
                            style: theme.textTheme.h30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Gap(12),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: theme.appColors.signIn,
              ),
              onPressed: () {
                loading.whileLoading(() async {
                  return context.read(userViewModelProvider).signIn();
                });
              },
              icon: Assets.svgs.firebase.svg(width: 24),
              label: Text(
                l10n.googleSignIn,
                style: theme.textTheme.h50.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const Gap(8),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: theme.appColors.signOut,
              ),
              onPressed: userViewModel.signOut,
              child: Text(
                l10n.googleSignOut,
                style: theme.textTheme.h50.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
