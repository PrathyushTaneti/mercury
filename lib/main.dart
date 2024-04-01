import 'package:flutter/material.dart';
import 'package:mercury/pages/start_page.dart';

void main() => runApp(const Application());

class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mercury',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
          useMaterial3: true),
      initialRoute: "/",
      routes: {"/": (context) => const StartPage()},
    );
  }
}
