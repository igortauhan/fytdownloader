import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:fytdownloader/models/download.dart';

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

  final myController = TextEditingController();

  String downloadMessage = 'Paste the URL above and touch Download button';
  late Download download;

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
                    controller: myController,
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
                    onPressed: () async {
                      String url = myController.text;

                      if (url == '') {
                        setState(() {
                          downloadMessage = 'The URL field cannot be void';
                        });
                        return;
                      }

                      setState(() {
                        downloadMessage = 'Downloading...';
                      });

                      try {
                        Directory directory = await DownloadsPathProvider.downloadsDirectory;
                        String path = directory.path;
                        download = new Download(url, path);
                        bool status = await download.downloadVideo();

                        setState(() {
                          (status) ? downloadMessage = 'Download complete' : downloadMessage = 'An error occurred';
                        });
                      }
                      on ArgumentError {
                        setState(() {
                          downloadMessage = 'An error occurred. Please, see if the URL is correct';
                        });
                      }
                      catch (error) {
                        downloadMessage = error.toString();
                      }
                    },
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
