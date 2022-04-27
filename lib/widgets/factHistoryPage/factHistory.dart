import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/style/factHistoryStyle.dart';
import '../../logic/logic.dart';

class FactHistoryWidget extends StatefulWidget {
  const FactHistoryWidget({Key? key}) : super(key: key);

  @override
  State<FactHistoryWidget> createState() => _FactHistoryWidgetState();
}

class _FactHistoryWidgetState extends State<FactHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('путін ху*ло'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getListCount(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: catInfoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${index + 1}) ${catInfoList[index]}',
                        style: FactHistoryStyle.historyTextStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
