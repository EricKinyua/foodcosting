import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:foodcosting/screens/chef/chef_screen.dart';
import 'package:foodcosting/screens/manager/manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, AsyncSnapshot snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return ManagerScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
