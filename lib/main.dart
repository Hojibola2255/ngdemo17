import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ngdemo17/pages/home_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB2fksX8TPhjuepMJiVAeJ6rkYefF3kEyg',
      appId: '1:418277085596:android:d0808ad763330014613859',
      messagingSenderId: '418277085596',
      projectId: 'ngdemo17-f4ff2',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
