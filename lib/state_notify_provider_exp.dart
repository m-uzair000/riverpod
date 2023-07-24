import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifyProviderExp extends ConsumerWidget {
  const StateNotifyProviderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var stateNotifierData = ref.watch(stateNotifyProviderRef);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notify Provider Exp'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(child: Text(stateNotifierData.toString())),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(stateNotifyProviderRef.notifier).increment();
            },
            child: const Center(child: Icon(Icons.add)),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(stateNotifyProviderRef.notifier).decrement();
            },
            child: const Center(
                child: Text(
              "-",
              style: TextStyle(fontSize: 40),
            )),
          )
        ],
      ),
    );
  }
}

/// make state notify provider

final stateNotifyProviderRef =
    StateNotifierProvider((ref) => CounterStateNotifier());

/// make state notify

class CounterStateNotifier extends StateNotifier {
  CounterStateNotifier() : super(0);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}
