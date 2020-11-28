import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../component/container_with_loading.dart';
import '../component/image.dart';
import '../loading_state_view_model.dart';
import '../user_view_model.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).signIn,
            style: Theme.of(context).textTheme.headline1),
      ),
      body: ContainerWithLoading(
        child: Column(
          children: [
            const Gap(16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: HookBuilder(builder: (context) {
                  final user = useProvider(
                      userViewModelProvider.select((value) => value.user));

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: loadProfileImage(user?.photoURL),
                              ))),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.displayName ?? L10n.of(context).displayName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Gap(10),
                            Text(
                              user?.email ?? L10n.of(context).email,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Gap(10),
                            Text(
                              user?.uid ?? L10n.of(context).uid,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
            const Gap(12),
            FlatButton(
              height: 64,
              color: Color(0xff4285f4),
              onPressed: () async {
                context.read(loadingStateProvider).whileLoading(() {
                  return context.read(userViewModelProvider).signIn();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.svgs.firebase.svg(width: 48, height: 48),
                    const Gap(8),
                    Text(L10n.of(context).googleSignIn,
                        style: Theme.of(context).textTheme.button)
                  ],
                ),
              ),
            ),
            const Gap(8),
            FlatButton(
              height: 64,
              color: Color(0xffc53829),
              onPressed: () => context.read(userViewModelProvider).signOut(),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(8),
                    Text(L10n.of(context).googleSignOut,
                        style: Theme.of(context).textTheme.button)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
