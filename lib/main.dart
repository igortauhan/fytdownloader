import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fYT Downloader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String downloadMessage = 'Paste the URL above and touch Download button';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fYT Downloader'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurpleAccent.shade100,
      body: Center(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Image.asset('icons/youtubeicon.png'),
                  radius: 40.0,
                  backgroundColor: Colors.transparent,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Divider(
                    height: 10.0,
                    color: Colors.blueGrey.shade50,
                  ),
                ),
                Card(
                  color: Colors.blueGrey,
                  margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Paste the URL video here',
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueGrey.shade50,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.deepPurpleAccent.shade400,
                  margin: EdgeInsets.symmetric(horizontal: 70.0),
                  child: TextButton(
                    onPressed: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.download_outlined,
                        size: 40.0,
                        color: Colors.blueGrey.shade50,
                      ),
                      title: Text(
                        'Download',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade50
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(downloadMessage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
