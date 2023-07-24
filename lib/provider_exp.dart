import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



///  This is read only. Its user to carry payload over the tree of the app.
///  We just read data from the provider.

final providerExp = Provider<String>((ref) => "This is dummy provider Exp");

class ProviderInRiverpod extends ConsumerWidget {
  const ProviderInRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final providerData = ref.read(providerExp);
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Provider Exp With Riverpod"),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Text(providerData),
        ),
      ),
    );
  }
}
