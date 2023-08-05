import 'package:anyideas/constants/data_types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount {
  late int id;
  late String token;
  late AuthLevel authlv;

  late String name;

  static final UserAccount _instance = UserAccount._internal();

  UserAccount._internal();

  factory UserAccount(){
    return _instance;
  }

  init() {
    _instance.id = -1;
    _instance.token = "NA";
    _instance.authlv = AuthLevel.guest;

    _instance.name = "Guest";

    // loadData();
  }

  update(Map json){
    _instance.id = json['id'];
    _instance.token = json['token'];
    _instance.authlv = AuthLevel.values[json['authlv']];
    _instance.name = json['name'];

    // saveData();
  }

  Future saveData() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt('shared_id', _instance.id);
    await sharedPrefs.setString('shared_token', _instance.token);
    await sharedPrefs.setInt('shared_authlv', _instance.authlv.index);
  }

  loadData() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    _instance.id = sharedPrefs.getInt('shared_id') ?? -1;
    _instance.token = sharedPrefs.getString('shared_token') ?? "NA";
    _instance.authlv = sharedPrefs.getInt('shared_authlv') as AuthLevel;
  }
}