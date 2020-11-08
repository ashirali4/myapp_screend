class match_entry_model{
  String _winteamkey;

  String get winteamkey => _winteamkey;

  set swinteamkey(String value) {
    _winteamkey = value;
  }

  String _points;
  String _matchid;

  match_entry_model(this._winteamkey, this._points, this._matchid);

  String get points => _points;

  set points(String value) {
    _points = value;
  }

  String get matchid => _matchid;

  set matchid(String value) {
    _matchid = value;
  }

}