import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:riverpod_counter_app_three_ways/pages/update_block_page.dart';
import 'package:riverpod_counter_app_three_ways/pages/update_block_page2.dart';
//import 'package:riverpod_counter_app_three_ways/pages/counter_state_notifier_page.dart';
//import 'package:riverpod_counter_app_three_ways/pages/counter_state_provider_page.dart';

const changeNotifierRoute = 'changeNotifier';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Enable Riverpod for the entire applications
    return ProviderScope(
      child: MaterialApp(
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          changeNotifierRoute: (context) => BlockChangeNotifierPage2(items: List<String>.generate(10000, (i) => 'Item $i'),),
          //stateNotifierRoute: (context) => CounterStateNotifierPage(),
          //stateProviderRoute: (context) => CounterStateProviderPage(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, changeNotifierRoute);
              },
              child: Text('Change Notifier'),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, stateNotifierRoute);
              },
              child: Text('State Notifier'),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, stateProviderRoute);
              },
              child: Text('State Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
