import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '湯婆婆の部屋'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  String newName = '';
  String _yubabaText = '湯婆婆「契約書だよ！そこに名前を書きな！」';

  void generateName() {
    if (name.length >= 2) {
      String newName = name.substring(0, 1);
      setState(() {
        _yubabaText =
            'フン。${name}というのかい。贅沢な名だねぇ。\n今からお前の名前は${newName}だ。いいかい、${newName}だよ。\n分かったら返事をするんだ${newName}!!';
      });
//ここに名前が２文字以上の場合の処理
    } else {
      setState(() {
        _yubabaText = 'ちゃんと本名を書きな！';
      });
//ここに名前が２文字未満の場合の処理
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
                'https://s3-ap-northeast-1.amazonaws.com/newstopics-production/url/a22e555516ae8fd9fe40ffd6804cfc4ac8ae8fd3?1566005713'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _yubabaText,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                enabled: true,
                // 入力数
                maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 1,
                decoration: InputDecoration(hintText: 'ここに名前を書きな！'),
                onChanged: (String text) {
                  setState(() {
                    name = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: RaisedButton(
                onPressed: () {
                  generateName();
                },
                child: Text(
                  '提出する',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
