import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import '../resBuilder.dart';
import '../plan.dart' as plan2;
import 'dart:core';

List<ScoreboardListBuilder> scoreboardList;

/*List<String> startDateYear = [];
List<String> startDateMonth = [];
List<String> startDateDay = [];
List<String> startTimeHours = [];
List<String> startTimeMinute = [];*/
Future<void> main() async {

  scoreboardList = await plan2.main();

  for (int i = 0; i < scoreboardList.length; i++){
    var target = scoreboardList[i];

    var year = target.gameStartDate.substring(0, 4);
    var month = target.gameStartDate.substring(5, 7);
    var day = target.gameStartDate.substring(8, 10);
    var hours = target.gameStartTime.substring(0, 2);
    var minutes = target.gameStartTime.substring(3, 5);

    target.setStartDateYear(year);
    target.setStartDateMonth(month);
    target.setStartDateDay(day);
    target.setStartTimeHours(hours);
    target.setStartTimeMinute(minutes);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  var imageList = [
    'image/1.png',
    'image/2.png',
    'image/3.png',
    'image/4.png',
    'image/5.png',
    'image/6.png',
    'image/7.png',
    'image/8.png',
    'image/9.png',
    'image/11.png'
    'image/12.png',
    'image/13.png',
    'image/14.png',
    'image/15.png',
    'image/16.png',
    'image/17.png',
    'image/18.png',
    'image/19.png',
    'image/20.png'
    'image/21.png',
    'image/22.png',
    'image/23.png',
    'image/24.png',
    'image/25.png',
    'image/26.png',
    'image/27.png',
    'image/28.png',
    'image/29.png'
    'image/30.png',
    'image/31.png',
    'image/32.png',
    'image/33.png',
    'image/34.png',
    'image/35.png',
    'image/36.png',
    'image/37.png',
    'image/38.png'
  ];

  void showPopup(context, title, image, date, time) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    date,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child:Text(
                    time,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color:Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     '경기 일정',
      //     style: TextStyle(color: Colors.grey),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: ListView.builder(
        itemCount: scoreboardList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              debugPrint(scoreboardList[index].homeTeamName);
              showPopup(context, scoreboardList[index].homeTeamName, imageList[index],
                  scoreboardList[index].gameStartDate, scoreboardList[index].gameStartTime);
            },
            child: Card(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(imageList[index])
                    ),
                    Expanded(child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(
                                  scoreboardList[index].homeTeamName,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  flex: 1
                              ),
                              Text(
                                  ":",
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  )
                              ),
                              Expanded(child: Text(
                                  scoreboardList[index].awayTeamName,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  flex: 1
                              )
                            ],
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              scoreboardList[index].gameStartDate,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[500]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              scoreboardList[index].gameStartTime,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[500]),
                              textAlign: TextAlign.center,
                            )
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}










