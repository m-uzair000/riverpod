import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderExp extends ConsumerWidget {
  const FutureProviderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var futureData = ref.watch(futureProviderRef);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Future Provider Exp'),
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
    );
  }

}

/// make a future provider that returns String type of value
/// when provider is load them is will cashing the data

final futureProviderRef = FutureProvider<String>((ref) => futureDataGenerator());

///  This method will give us future data

Future<String> futureDataGenerator() async {
return await Future.delayed(const Duration(seconds: 3),()=>"Future Data");
}
