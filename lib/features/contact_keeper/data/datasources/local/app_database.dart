import 'package:contact_keeper/features/contact_keeper/data/datasources/local/DAO/contact_dao.dart';
import 'package:contact_keeper/features/contact_keeper/data/models/contact_model.dart';
import 'package:floor/floor.dart';

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ContactModel])
abstract class AppDatabase extends FloorDatabase {
  ContactDao get contactDao;
}
