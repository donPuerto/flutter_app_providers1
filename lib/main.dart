import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'pages/home_page.dart';
// import 'pages/counter_page.dart';
import 'pages/counter_page.dart';
import 'pages/todo_page.dart';
// import 'providers/counter_provider.dart';
import 'providers/counter_provider.dart';
import 'providers/todo_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const CounterPage(),
    const TodoPage(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.countertops),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Todo',
            ),
          ],
        ),
      ),
    );
  }
}
