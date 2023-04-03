import 'package:flutter/material.dart';
import 'package:poc/screens/addMoney.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:poc/screens/history.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List screens = [
    const History(),
    const AddMoney(),
  ];
  List navBarItems = [
    {
      "index": 0,
      "title": "History",
      "icon": Icons.access_time_rounded,
    },
    {
      "index": 1,
      "title": "Add Money",
      "icon": Icons.account_balance_wallet_rounded
    }
  ];
  int indexValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(indexValue),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.085,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: navBarItems
                    .map((e) => InkWell(
                          onTap: () {
                            setState(() {
                              indexValue = e['index'];
                            });
                          },
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  e['icon'],
                                  color: indexValue == e['index']
                                      ? Colors.blue
                                      : Colors.grey,
                                  size: 30,
                                ),
                                Text(
                                  e['title'],
                                  style: TextStyle(
                                      color: indexValue == e['index']
                                          ? Colors.blue
                                          : Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
