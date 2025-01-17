import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bookit_flutter_project/app/constants/hive_table_constant.dart';
import 'package:bookit_flutter_project/features/auth/data/model/auth_hive_model.dart';

class HiveService {
  // Initialize Hive and register adapters
  static Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}/bookit_hive_db';
    Hive.init(path);

    // Register AuthHiveModel adapter
    Hive.registerAdapter(AuthHiveModelAdapter());

    // Debug: Print contents of the user box (for testing)
    var hiveService = HiveService();
    await hiveService.printHiveData(HiveTableConstant.userBox);
  }

  // Auth Queries
  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
    await box.close();
  }

  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
    await box.close();
  }

  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var allUsers = box.values.toList();
    await box.close();
    return allUsers;
  }

  Future<AuthHiveModel?> login(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    try {
      var user = box.values.firstWhere(
        (element) =>
            element.username == username && element.password == password,
      );
      await box.close();
      return user;
    } catch (e) {
      await box.close();
      return null; // Return null if no match is found
    }
  }

  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  Future<void> close() async {
    await Hive.close();
  }

  // Debugging method to print all data in a specified box
  Future<void> printHiveData(String boxName) async {
    var box = await Hive.openBox(boxName);
    print('Data in $boxName:');
    for (var key in box.keys) {
      print('Key: $key, Value: ${box.get(key)}');
    }
    await box.close();
  }
}
