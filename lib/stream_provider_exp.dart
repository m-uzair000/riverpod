import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderExp extends ConsumerWidget {
  const StreamProviderExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    var streamData = ref.watch(streamProviderRef);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider Exp'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child:streamData.when(data: (data){
            return Text(data.toString());
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

/// here i am going to make a stream provider.
final streamProviderRef = StreamProvider((ref) => numberStream());

/// this function will return the stream of number after every 2 seconds.
Stream<int> numberStream(){
  return Stream<int>.periodic(const Duration(milliseconds: 500),(number)=>number);
}
