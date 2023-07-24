import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderExp extends ConsumerWidget {
  const StateProviderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var stateData = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider Exp'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Text(stateData.toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.state).state++;
        },
        child: const Center(child: Icon(Icons.add)),
      ),
    );
  }
}

/// this is state provider for state initially it will return 0 then it can return the value as per over request.
/// As i write code for counter increment on press button.
/// On tap fab button in will increase by 1.

final counterStateProvider = StateProvider((ref) => 0);
