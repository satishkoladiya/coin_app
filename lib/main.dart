import 'package:coin_app/consts/app_const.dart';
import 'package:coin_app/models/models.dart';
import 'package:coin_app/utils/cache_manager.dart';
import 'package:coin_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialiseHive();

  runApp(const MyApp());
}

Future<void> initialiseHive() async {
  // initialize hive
  await Hive.initFlutter();
  // register hive adapter
  Hive.registerAdapter(CryptoAdapter());
  Hive.registerAdapter(PlatformAdapter());
  //box
  Box<Crypto> cryptoCacheBox = await Hive.openBox(AppConstant.cacheBox);
  await Hive.openBox<Crypto>(AppConstant.favoritesBox);
  //repos
  CacheManager.cachedBox = cryptoCacheBox;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
