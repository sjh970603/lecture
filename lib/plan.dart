import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'dart:convert';
import 'dart:developer' as developer;

class Matches {
  final String gameId;
  final String leagueId;
  final String topLeagueId;
  final String gameCode;
  final String stadium;
  final int startDate;
  final String title;
  final int homeScore;
  final int awayScore;
  final int weeks;
  final int days;
  final String winner;
  final String matchStatus;
  final int maxMatchCount;
  final int currentMatchSet;
  final String loungedId;
  final String replayVideoId;
  final String showAdInfo;
  final Map<String, dynamic> homeTeam;
  final Map<String, dynamic> awayTeam;
  final String homePlayer;
  final String awayPlayer;
  final String rankList;
  final String relay;
  final int liveMaxLevel;
  final int liveMaxResolution;
  final String userSelectedWinnerType;
  final String matchPredictionProcessStatus;
  final String userPredictionStatus;
  final int homeWinPredictionPercentage;
  final int awayWinPredictionPercentage;
  final int homeRanked;
  final int awayRanked;

  Matches(this.gameId, this.leagueId, this.topLeagueId, this.gameCode, this.stadium, this.startDate, this.title, this.homeScore, this.awayScore,
      this.weeks, this.days, this.winner, this.matchStatus, this.maxMatchCount, this.currentMatchSet, this.loungedId, this.replayVideoId, this.showAdInfo,
      this.homeTeam, this.awayTeam, this.homePlayer, this.awayPlayer, this.rankList, this.relay, this.liveMaxLevel, this.liveMaxResolution,
      this.userSelectedWinnerType, this.matchPredictionProcessStatus, this.userPredictionStatus, this.homeWinPredictionPercentage, this.awayWinPredictionPercentage,
      this.homeRanked, this.awayRanked);

  Matches.fromJson(Map<String, dynamic> json)
      : gameId = json['gameId'],
        leagueId = json['leagueId'],
        topLeagueId = json['topLeagueId'],
        gameCode = json['gameCode'],
        stadium = json['stadium'],
        startDate = json['startDate'],
        title = json['title'],
        homeScore = json['homeScore'],
        awayScore = json['awayScore'],
        weeks = json['weeks'],
        days = json['days'],
        winner = json['winner'],
        matchStatus = json['matchStatus'],
        maxMatchCount = json['maxMatchCount'],
        currentMatchSet = json['currentMatchSet'],
        loungedId = json['loungedId'],
        replayVideoId = json['replayVideoId'],
        showAdInfo = json['showAdInfo'],
        homeTeam = json['homeTeam'],
        awayTeam = json['awayTeam'],
        homePlayer = json['homePlayer'],
        awayPlayer = json['awayPlayer'],
        rankList = json['rankList'],
        relay = json['relay'],
        liveMaxLevel = json['liveMaxLevel'],
        liveMaxResolution = json['liveMaxResolution'],
        userSelectedWinnerType = json['userSelectedWinnerType'],
        matchPredictionProcessStatus = json['matchPredictionProcessStatus'],
        userPredictionStatus = json['userPredictionStatus'],
        homeWinPredictionPercentage = json['homeWinPredictionPercentage'],
        awayWinPredictionPercentage = json['awayWinPredictionPercentage'],
        homeRanked = json['homeRanked'],
        awayRanked = json['awayRanked'];
}

void main() async {
  String url =
      "https://apis.naver.com/nng_main/esports/v1/predict/leagueId/msi_2022";
  var response = await http.get(Uri.parse(url));
  var res = utf8.decode(response.bodyBytes);
 // print(res);
  dom.Document document = parser.parse(res);

  var jsonBody = jsonDecode(res)['content'];
  var jsonMatches = jsonBody['matches'];
  List<Matches> matchesList;
  var msigameId;

  developer.log("jsonMatches.size() = ${jsonMatches.length}");
  for (int i=0; i < jsonMatches.length; i++){
    var match = Matches.fromJson(jsonMatches[i]);
    matchesList = List.empty(growable :true);
    matchesList.add(match);

    /*msigameId = List.empty(growable : true);
    msigameId.add(match.gameId);*/
    developer.log("match = ${match}");
  }

  matchesList[0].awayRanked;
}