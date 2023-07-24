import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FamilyModifierExp extends ConsumerWidget {
  const FamilyModifierExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var futureData = ref.watch(futureProviderRef("Test Value"));
    return Scaffold(
      appBar: AppBar(
        title:const Text('Auto Dispose Exp'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: futureData.when(data: (data){
            return Text(data);
          }, error: (error,stackTrace){
            return Text(error.toString());
          }, loading:(){
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );  }
}

/// make a future provider that returns String type of value
/// when provider is load them is will cashing the data
/// just (.autoDispose) modifier will dispose provider from memory
final futureProviderRef = FutureProvider.autoDispose.family<String,String>((ref,perm) => futureDataGenerator(perm));

///  This method will give us future data

Future<String> futureDataGenerator(String perm) async {
  return await Future.delayed(const Duration(seconds: 2),()=>"value = $perm");
}
