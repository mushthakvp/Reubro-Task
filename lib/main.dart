import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reubro/app/home/home_scree.dart';
import 'app/provider/providers.dart';
import 'app/routes/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Providers.providers());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Routes.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomeScreen(),
    );
  }
}
