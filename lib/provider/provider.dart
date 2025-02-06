import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

final isarProvider = Provider<Isar>((ref) => GetIt.I<Isar>());
