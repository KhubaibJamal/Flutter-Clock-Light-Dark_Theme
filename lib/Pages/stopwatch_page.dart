import 'package:clock_flutter/Widget/change_theme_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final StopWatchTimer stopWatchTimer = StopWatchTimer();
  bool isHour = true;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    stopWatchTimer.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: stopWatchTimer.rawTime.value,
            builder: ((context, snapshot) {
              final value = snapshot.data;
              final displayTime =
                  StopWatchTimer.getDisplayTime(value!, hours: isHour);
              return Text(
                displayTime,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Helvetica',
                  color: Theme.of(context).primaryColor,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                textTitle: "Start",
                onPress: () {
                  stopWatchTimer.onStartTimer();
                },
              ),
              const SizedBox(width: 10.0),
              CustomButton(
                textTitle: "Stop",
                onPress: () {
                  stopWatchTimer.onStopTimer();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                textTitle: "Reset",
                onPress: () {
                  stopWatchTimer.onResetTimer();
                },
              ),
              const SizedBox(width: 10.0),
              CustomButton(
                textTitle: "Lap",
                onPress: () {
                  stopWatchTimer.onAddLap();
                },
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 130,
            // color: Colors.yellow,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(8.0),
            child: StreamBuilder<List<StopWatchRecord>>(
              stream: stopWatchTimer.records,
              initialData: stopWatchTimer.records.value,
              builder: (context, snapshot) {
                final value = snapshot.data;
                if (value!.isEmpty) {
                  return Container();
                }
                Future.delayed(const Duration(milliseconds: 100), () {
                  scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut);
                });
                return ListView.builder(
                  controller: scrollController,
                  itemBuilder: ((context, index) {
                    final data = value[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${index + 1} - ${data.displayTime}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          indent: 110,
                          endIndent: 110,
                          color: Theme.of(context).dividerColor,
                        ),
                      ],
                    );
                  }),
                  itemCount: value.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
