import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'dart:convert';
import 'dart:developer' as developer;
import 'resBuilder.dart';

Future<List<ScoreboardListBuilder>> main() async{
  List<ScoreboardListBuilder> scoreboardLists;
  ScoreboardListBuilder scoreboardList;

  var url = "https://sports.news.naver.com/wbaseball/schedule/scoreboard?date=20220529&year=2022&month=05&category=mlb";
  var response = await http.get(Uri.parse(url));
  var res = utf8.decode(response.bodyBytes);
  var jsonBody = jsonDecode(res)['scoreboardList'];

  scoreboardLists = List.empty(growable :true);
  for (int i=0; i < jsonBody.length; i++){
    scoreboardList = ScoreboardListBuilder.fromjson(jsonBody[i]);
    scoreboardLists.add(scoreboardList);
  }
  return scoreboardLists;
}