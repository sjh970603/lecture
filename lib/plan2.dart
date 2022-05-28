import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'dart:convert';
import 'dart:developer' as developer;
import 'resBuilder2.dart';

Future<List<ScoreboardListBuilder>> main() async{
  List<ScoreboardListBuilder> scoreboardList;
  ScoreboardListBuilder scoreboardLists;

  var url = "https://sports.news.naver.com/wbaseball/schedule/scoreboard?date=20220529&year=2022&month=05&category=mlb";
  var response = await http.get(Uri.parse(url));
  var res = utf8.decode(response.bodyBytes);
  var jsonBody = jsonDecode(res)['scoreboardList'];

  for (int i=0; i < jsonBody.length; i++){
    scoreboardLists = ScoreboardListBuilder.fromjson(jsonBody[i]);
    scoreboardList = List.empty(growable :true);
    scoreboardList.add(scoreboardLists);

    // print(scoreboardList[0].awayTeamName);
    // print("${scoreboardList[0].homeTeamName}\n");
    // print(scoreboardList[0].gameStartDate.substring(0,4));
    // print("\n");
    // print(scoreboardList[0].gameStartDate.substring(5,7));
    // print("\n");
    // print(scoreboardList[0].gameStartDate.substring(8,10));
    // print("\n");
    // print(scoreboardList[0].gameStartTime.substring(0,2));
    // print(scoreboardList[0].gameStartTime.substring(3,5));
    // print("\n");


  }

  return scoreboardList;

}