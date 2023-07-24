import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exp/family_modifire_exp.dart';
import 'package:riverpod_exp/future_provider_exp.dart';
import 'package:riverpod_exp/auto_dispose_exp.dart';
import 'package:riverpod_exp/change_notify_provider_exp.dart';
import 'package:riverpod_exp/provider_exp.dart';
import 'package:riverpod_exp/state_notify_provider_exp.dart';
import 'package:riverpod_exp/state_provider_exp.dart';
import 'package:riverpod_exp/stream_provider_exp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Riverpod Exp "),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          physics:const ClampingScrollPhysics(),
          padding:const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
          children: [
            const Center(
              child:  Text("Providers Exp",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
              ),),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProviderInRiverpod()));
                },
                child: const Text("Provider Exp")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const FutureProviderExp()));
                },
                child: const Text("Future Provider Exp")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const StateProviderExp()));
                },
                child: const Text("State Provider Exp")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const StreamProviderExp()));
                },
                child: const Text("Stream Provider Exp")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const StateNotifyProviderExp()));
                },
                child: const Text("State Notify Provider Exp")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ChangeNotifyProviderExp()));
                },
                child: const Text("Change Notify Provider Exp")),
            const SizedBox(height: 15,),
            const Center(
              child:  Text("Providers Modifiers Exp",
                style: TextStyle(
                fontSize: 25,
                color: Colors.black
              ),),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AutoDisposeExp()));
                },
                child: const Text("Auto Dispose Modifier Exp")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const FamilyModifierExp()));
                },
                child: const Text("Family Modifier Exp")),
          ],
        ),
      ),
    );
  }
}
