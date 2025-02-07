import 'package:dusty_dust/model/m_stat.dart';
import 'package:dusty_dust/screen/s_home.dart';
import 'package:flutter/material.dart';
import 'package:dusty_dust/constant/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([MStatSchema], directory: dir.path);

  GetIt.I.registerSingleton<Isar>(isar);

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const SHome(),
      ),
    ),
  );
}
