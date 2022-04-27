import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/style/factHistoryStyle.dart';
import '../../logic/logic.dart';
import '../../style/mainScreenStyle.dart';

class FactHistoryWidget extends StatefulWidget {
  const FactHistoryWidget({Key? key}) : super(key: key);

  @override
  State<FactHistoryWidget> createState() => _FactHistoryWidgetState();
}

class _FactHistoryWidgetState extends State<FactHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('путін ху*ло'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getListCount(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              decoration: MainScreenStyle.backgroundImageTheme,
              child: ListView.builder(
                itemCount: catInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 1,
                        color: const Color.fromRGBO(0, 0, 0, 0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15),
                          hoverColor: Colors.redAccent,
                          title: Text(
                            '${index + 1}) ${catInfoList[index]}',
                            style: FactHistoryStyle.historyTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
