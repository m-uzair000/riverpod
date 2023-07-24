import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotifyProviderExp extends ConsumerWidget {
  const ChangeNotifyProviderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var changeNotifierData = ref.watch(changeNotifierProviderRef);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notify Provider Exp'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(child: Text(changeNotifierData.count.toString())),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(changeNotifierProviderRef.notifier).increment();
            },
            child: const Center(child: Icon(Icons.add)),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(changeNotifierProviderRef.notifier).decrement();
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

final changeNotifierProviderRef = ChangeNotifierProvider((ref) => CounterChangeNotifyProvider());

class CounterChangeNotifyProvider extends ChangeNotifier{
  int count = 0;

  void increment() {
    count = count + 1;
    notifyListeners();
  }

  void decrement() {
    count = count - 1;
    notifyListeners();
  }
}
