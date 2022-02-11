import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/localization/locale_keys.g.dart';
import 'package:flutter_base_project/core/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tr(LocaleKeys.counterLabel),
            ),
            const CounterWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(Providers.homeViewModel).increase(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends ConsumerStatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends ConsumerState<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    final _counterViewModel = ref.watch(Providers.homeViewModel);

    return Text(
      _counterViewModel.counter.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
