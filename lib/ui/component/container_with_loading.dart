import 'package:app/ui/component/loading.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContainerWithLoading extends StatelessWidget {
  const ContainerWithLoading({required Widget child}) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _child,
      HookBuilder(builder: (context) {
        final state = useProvider(loadingStateProvider);
        return state.isLoading ? const Loading() : const SizedBox();
      })
    ]);
  }
}
