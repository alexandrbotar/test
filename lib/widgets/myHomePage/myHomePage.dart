import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/style/mainScreenStyle.dart';
import '../../logic/logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int imageKey = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('путін ху*ло'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getRequest(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            decoration: MainScreenStyle.backgroundImageTheme,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Container(
                  // width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      'https://cataas.com/cat',
                      key: ValueKey(imageKey),
                      height: 200,
                      loadingBuilder: MainScreenStyle.ImageLoading,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: MainScreenStyle.historyButtonStyle,
                      onPressed: () {
                        Navigator.pushNamed(context, 'main/history');
                      },
                      child: const Text('Котячі історії'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      style: MainScreenStyle.nextButtonStyle,
                      onPressed: () {
                        setState(() {
                          getRequest(); // get data Api
                          imageKey += 1; // update image valueKey
                          evictImage(
                              'https://cataas.com/cat'); // update imageNetwork link
                          addCatInfo();
                        });
                      },
                      child: const Text('Наступна котейка'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(41),
                    color: Colors.black87,
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      catInfoText,
                      style: MainScreenStyle.catInfoTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
