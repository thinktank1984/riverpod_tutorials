import 'package:flutter/foundation.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlockChangeNotifier extends ChangeNotifier {
  BlockChangeNotifier({this.count = 0,this.name1="",required List<String> items});
  //, this.childrenBlocks=[]);
  List<String>? items;
  int count;
  String name1;
  List<BlockChangeNotifier>? childrenBlocks;
  void increment() {
    count++;
    notifyListeners();
  } 
}

