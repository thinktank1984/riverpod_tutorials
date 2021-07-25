import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../block_notifies.dart';

final _counterProvider = ChangeNotifierProvider<BlockChangeNotifier>((ref) {
  return BlockChangeNotifier(items: List<String>.generate(10000, (i) => 'Item $i'));
});
// final _counterProvider = ChangeNotifierProvider<BlockChangeNotifier>((ref) {
//   return BlockChangeNotifier();
// });

class BlockChangeNotifierPage2 extends ConsumerWidget {
  final List<String> items;
  const BlockChangeNotifierPage2({Key? key,required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(_counterProvider);
    //final counter1 = ref.watch(_counterProvider1);
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Notifier Page'),
      ),
      body:ListView.builder(
          itemCount: counter.items?.length,
          itemBuilder: (context, index) {
            return Row(
              children: [Text(counter.items![index])],
            );
          },
        ),
      //floatingActionButton: MyFloatingButton(),
    );
  }
}

class MyWidgets extends ConsumerWidget {
  const MyWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(_counterProvider);
    return Row(
      children: [
        Text('Count: ${counter.count}'),
        FloatingActionButton(
          onPressed: () {
            ref.read(_counterProvider).increment();
          },
          child: Icon(Icons.add),
        ),
      ],
    ); //floatingActionButton:
  }
}

class MyFloatingButton1 extends ConsumerWidget {
  const MyFloatingButton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(_counterProvider).increment();
      },
      child: Icon(Icons.add),
    );
  }
}
