// To parse this JSON data, do
//
//     final loadMatchesApiModel = loadMatchesApiModelFromJson(jsonString);

import 'dart:convert';

LoadMatchesApiModel loadMatchesApiModelFromJson(String str) => LoadMatchesApiModel.fromJson(json.decode(str));

String loadMatchesApiModelToJson(LoadMatchesApiModel data) => json.encode(data.toJson());

class LoadMatchesApiModel {
  LoadMatchesApiModel({
    this.success,
    this.result,
  });

  int success;
  List<Result> result;

  factory LoadMatchesApiModel.fromJson(Map<String, dynamic> json) => LoadMatchesApiModel(
    success: json["success"] == null ? null : json["success"],
    result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.eventKey,
    this.eventDate,
    this.eventTime,
    this.eventHomeTeam,
    this.homeTeamKey,
    this.eventAwayTeam,
    this.awayTeamKey,
    this.eventHalftimeResult,
    this.eventFinalResult,
    this.eventFtResult,
    this.eventPenaltyResult,
    this.eventStatus,
    this.countryName,
    this.leagueName,
    this.leagueKey,
    this.leagueRound,
    this.leagueSeason,
    this.eventLive,
    this.eventStadium,
    this.eventReferee,
    this.homeTeamLogo,
    this.awayTeamLogo,
    this.eventCountryKey,
    this.leagueLogo,
    this.countryLogo,
    this.eventHomeFormation,
    this.eventAwayFormation,
    this.goalscorers,
    this.substitutes,
    this.cards,
    this.lineups,
    this.statistics,
  });

  String eventKey;
  DateTime eventDate;
  String eventTime;
  String eventHomeTeam;
  String homeTeamKey;
  String eventAwayTeam;
  String awayTeamKey;
  String eventHalftimeResult;
  String eventFinalResult;
  String eventFtResult;
  String eventPenaltyResult;
  String eventStatus;
  String countryName;
  String leagueName;
  String leagueKey;
  String leagueRound;
  String leagueSeason;
  String eventLive;
  String eventStadium;
  String eventReferee;
  String homeTeamLogo;
  String awayTeamLogo;
  String eventCountryKey;
  String leagueLogo;
  String countryLogo;
  String eventHomeFormation;
  String eventAwayFormation;
  List<Goalscorer> goalscorers;
  List<Substitute> substitutes;
  List<Card> cards;
  Lineups lineups;
  List<Statistic> statistics;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    eventKey: json["event_key"] == null ? null : json["event_key"],
    eventDate: json["event_date"] == null ? null : DateTime.parse(json["event_date"]),
    eventTime: json["event_time"] == null ? null : json["event_time"],
    eventHomeTeam: json["event_home_team"] == null ? null : json["event_home_team"],
    homeTeamKey: json["home_team_key"] == null ? null : json["home_team_key"],
    eventAwayTeam: json["event_away_team"] == null ? null : json["event_away_team"],
    awayTeamKey: json["away_team_key"] == null ? null : json["away_team_key"],
    eventHalftimeResult: json["event_halftime_result"] == null ? null : json["event_halftime_result"],
    eventFinalResult: json["event_final_result"] == null ? null : json["event_final_result"],
    eventFtResult: json["event_ft_result"] == null ? null : json["event_ft_result"],
    eventPenaltyResult: json["event_penalty_result"] == null ? null : json["event_penalty_result"],
    eventStatus: json["event_status"] == null ? null : json["event_status"],
    countryName: json["country_name"] == null ? null : json["country_name"],
    leagueName: json["league_name"] == null ? null : json["league_name"],
    leagueKey: json["league_key"] == null ? null : json["league_key"],
    leagueRound: json["league_round"] == null ? null : json["league_round"],
    leagueSeason: json["league_season"] == null ? null : json["league_season"],
    eventLive: json["event_live"] == null ? null : json["event_live"],
    eventStadium: json["event_stadium"] == null ? null : json["event_stadium"],
    eventReferee: json["event_referee"] == null ? null : json["event_referee"],
    homeTeamLogo: json["home_team_logo"] == null ? null : json["home_team_logo"],
    awayTeamLogo: json["away_team_logo"] == null ? null : json["away_team_logo"],
    eventCountryKey: json["event_country_key"] == null ? null : json["event_country_key"],
    leagueLogo: json["league_logo"] == null ? null : json["league_logo"],
    countryLogo: json["country_logo"] == null ? null : json["country_logo"],
    eventHomeFormation: json["event_home_formation"] == null ? null : json["event_home_formation"],
    eventAwayFormation: json["event_away_formation"] == null ? null : json["event_away_formation"],
    goalscorers: json["goalscorers"] == null ? null : List<Goalscorer>.from(json["goalscorers"].map((x) => Goalscorer.fromJson(x))),
    substitutes: json["substitutes"] == null ? null : List<Substitute>.from(json["substitutes"].map((x) => Substitute.fromJson(x))),
    cards: json["cards"] == null ? null : List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
    lineups: json["lineups"] == null ? null : Lineups.fromJson(json["lineups"]),
    statistics: json["statistics"] == null ? null : List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "event_key": eventKey == null ? null : eventKey,
    "event_date": eventDate == null ? null : "${eventDate.year.toString().padLeft(4, '0')}-${eventDate.month.toString().padLeft(2, '0')}-${eventDate.day.toString().padLeft(2, '0')}",
    "event_time": eventTime == null ? null : eventTime,
    "event_home_team": eventHomeTeam == null ? null : eventHomeTeam,
    "home_team_key": homeTeamKey == null ? null : homeTeamKey,
    "event_away_team": eventAwayTeam == null ? null : eventAwayTeam,
    "away_team_key": awayTeamKey == null ? null : awayTeamKey,
    "event_halftime_result": eventHalftimeResult == null ? null : eventHalftimeResult,
    "event_final_result": eventFinalResult == null ? null : eventFinalResult,
    "event_ft_result": eventFtResult == null ? null : eventFtResult,
    "event_penalty_result": eventPenaltyResult == null ? null : eventPenaltyResult,
    "event_status": eventStatus == null ? null : eventStatus,
    "country_name": countryName == null ? null : countryName,
    "league_name": leagueName == null ? null : leagueName,
    "league_key": leagueKey == null ? null : leagueKey,
    "league_round": leagueRound == null ? null : leagueRound,
    "league_season": leagueSeason == null ? null : leagueSeason,
    "event_live": eventLive == null ? null : eventLive,
    "event_stadium": eventStadium == null ? null : eventStadium,
    "event_referee": eventReferee == null ? null : eventReferee,
    "home_team_logo": homeTeamLogo == null ? null : homeTeamLogo,
    "away_team_logo": awayTeamLogo == null ? null : awayTeamLogo,
    "event_country_key": eventCountryKey == null ? null : eventCountryKey,
    "league_logo": leagueLogo == null ? null : leagueLogo,
    "country_logo": countryLogo == null ? null : countryLogo,
    "event_home_formation": eventHomeFormation == null ? null : eventHomeFormation,
    "event_away_formation": eventAwayFormation == null ? null : eventAwayFormation,
    "goalscorers": goalscorers == null ? null : List<dynamic>.from(goalscorers.map((x) => x.toJson())),
    "substitutes": substitutes == null ? null : List<dynamic>.from(substitutes.map((x) => x.toJson())),
    "cards": cards == null ? null : List<dynamic>.from(cards.map((x) => x.toJson())),
    "lineups": lineups == null ? null : lineups.toJson(),
    "statistics": statistics == null ? null : List<dynamic>.from(statistics.map((x) => x.toJson())),
  };
}

class Card {
  Card({
    this.time,
    this.homeFault,
    this.card,
    this.awayFault,
  });

  String time;
  String homeFault;
  String card;
  String awayFault;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    time: json["time"] == null ? null : json["time"],
    homeFault: json["home_fault"] == null ? null : json["home_fault"],
    card: json["card"] == null ? null : json["card"],
    awayFault: json["away_fault"] == null ? null : json["away_fault"],
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? null : time,
    "home_fault": homeFault == null ? null : homeFault,
    "card": card == null ? null : card,
    "away_fault": awayFault == null ? null : awayFault,
  };
}

class Goalscorer {
  Goalscorer({
    this.time,
    this.homeScorer,
    this.score,
    this.awayScorer,
    this.scoreInfo,
  });

  String time;
  String homeScorer;
  String score;
  String awayScorer;
  String scoreInfo;

  factory Goalscorer.fromJson(Map<String, dynamic> json) => Goalscorer(
    time: json["time"] == null ? null : json["time"],
    homeScorer: json["home_scorer"] == null ? null : json["home_scorer"],
    score: json["score"] == null ? null : json["score"],
    awayScorer: json["away_scorer"] == null ? null : json["away_scorer"],
    scoreInfo: json["score_info"] == null ? null : json["score_info"],
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? null : time,
    "home_scorer": homeScorer == null ? null : homeScorer,
    "score": score == null ? null : score,
    "away_scorer": awayScorer == null ? null : awayScorer,
    "score_info": scoreInfo == null ? null : scoreInfo,
  };
}

class Lineups {
  Lineups({
    this.homeTeam,
    this.awayTeam,
  });

  Team homeTeam;
  Team awayTeam;

  factory Lineups.fromJson(Map<String, dynamic> json) => Lineups(
    homeTeam: json["home_team"] == null ? null : Team.fromJson(json["home_team"]),
    awayTeam: json["away_team"] == null ? null : Team.fromJson(json["away_team"]),
  );

  Map<String, dynamic> toJson() => {
    "home_team": homeTeam == null ? null : homeTeam.toJson(),
    "away_team": awayTeam == null ? null : awayTeam.toJson(),
  };
}

class Team {
  Team({
    this.startingLineups,
    this.substitutes,
    this.coaches,
    this.missingPlayers,
  });

  List<StartingLineup> startingLineups;
  List<StartingLineup> substitutes;
  List<Coach> coaches;
  List<dynamic> missingPlayers;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    startingLineups: json["starting_lineups"] == null ? null : List<StartingLineup>.from(json["starting_lineups"].map((x) => StartingLineup.fromJson(x))),
    substitutes: json["substitutes"] == null ? null : List<StartingLineup>.from(json["substitutes"].map((x) => StartingLineup.fromJson(x))),
    coaches: json["coaches"] == null ? null : List<Coach>.from(json["coaches"].map((x) => Coach.fromJson(x))),
    missingPlayers: json["missing_players"] == null ? null : List<dynamic>.from(json["missing_players"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "starting_lineups": startingLineups == null ? null : List<dynamic>.from(startingLineups.map((x) => x.toJson())),
    "substitutes": substitutes == null ? null : List<dynamic>.from(substitutes.map((x) => x.toJson())),
    "coaches": coaches == null ? null : List<dynamic>.from(coaches.map((x) => x.toJson())),
    "missing_players": missingPlayers == null ? null : List<dynamic>.from(missingPlayers.map((x) => x)),
  };
}

class Coach {
  Coach({
    this.coache,
    this.coacheCountry,
  });

  String coache;
  String coacheCountry;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
    coache: json["coache"] == null ? null : json["coache"],
    coacheCountry: json["coache_country"] == null ? null : json["coache_country"],
  );

  Map<String, dynamic> toJson() => {
    "coache": coache == null ? null : coache,
    "coache_country": coacheCountry == null ? null : coacheCountry,
  };
}

class StartingLineup {
  StartingLineup({
    this.player,
    this.playerNumber,
    this.playerPosition,
    this.playerCountry,
  });

  String player;
  String playerNumber;
  String playerPosition;
  String playerCountry;

  factory StartingLineup.fromJson(Map<String, dynamic> json) => StartingLineup(
    player: json["player"] == null ? null : json["player"],
    playerNumber: json["player_number"] == null ? null : json["player_number"],
    playerPosition: json["player_position"] == null ? null : json["player_position"],
    playerCountry: json["player_country"] == null ? null : json["player_country"],
  );

  Map<String, dynamic> toJson() => {
    "player": player == null ? null : player,
    "player_number": playerNumber == null ? null : playerNumber,
    "player_position": playerPosition == null ? null : playerPosition,
    "player_country": playerCountry == null ? null : playerCountry,
  };
}

class Statistic {
  Statistic({
    this.type,
    this.home,
    this.away,
  });

  String type;
  String home;
  String away;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
    type: json["type"] == null ? null : json["type"],
    home: json["home"] == null ? null : json["home"],
    away: json["away"] == null ? null : json["away"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "home": home == null ? null : home,
    "away": away == null ? null : away,
  };
}

class Substitute {
  Substitute({
    this.time,
    this.homeScorer,
    this.score,
    this.awayScorer,
  });

  String time;
  dynamic homeScorer;
  String score;
  dynamic awayScorer;

  factory Substitute.fromJson(Map<String, dynamic> json) => Substitute(
    time: json["time"] == null ? null : json["time"],
    homeScorer: json["home_scorer"],
    score: json["score"] == null ? null : json["score"],
    awayScorer: json["away_scorer"],
  );

  Map<String, dynamic> toJson() => {
    "time": time == null ? null : time,
    "home_scorer": homeScorer,
    "score": score == null ? null : score,
    "away_scorer": awayScorer,
  };
}

class AwayScorerClass {
  AwayScorerClass({
    this.scorerIn,
    this.out,
  });

  String scorerIn;
  String out;

  factory AwayScorerClass.fromJson(Map<String, dynamic> json) => AwayScorerClass(
    scorerIn: json["in"] == null ? null : json["in"],
    out: json["out"] == null ? null : json["out"],
  );

  Map<String, dynamic> toJson() => {
    "in": scorerIn == null ? null : scorerIn,
    "out": out == null ? null : out,
  };
}
