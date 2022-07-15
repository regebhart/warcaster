import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:warcaster/models/game.dart';

import '../models/faction.dart';
import '../models/gamedata.dart';

class GameProvider with ChangeNotifier {
  late bool dataread;
  late GameData _fullGameData;
  late Game _game;
  late Faction _faction;

  GameData get fullGameData => _fullGameData;
  Game get game => _game;
  Faction get faction => _faction;

  GameProvider() {
    dataread = false;
  }

  readFullGameData() async {
    if (!dataread) {
      dataread = true;
      String data = await rootBundle.loadString('json/list.json');
      var jsonData = jsonDecode(data);
      _fullGameData = GameData.fromJson(jsonData);
      print('-------------------------------------------------------------done---------------------------------------------');
    }
    return _fullGameData;
  }

  setGame(Game newGame) {
    _game = newGame;
  }

  setFaction(Faction newFaction) {
    _faction = newFaction;
    notifyListeners();
  }
}
