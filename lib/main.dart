import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/mais_receitas.dart';
import 'package:mais_receitas/firebase_options.dart';

const favoriteBox = ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  var favoriteBox = await Hive.openBox<String>('favoriteBox');
  runApp(const MaisReceitas());
}

