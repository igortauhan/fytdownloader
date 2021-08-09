import 'dart:io';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class download {
  String url;
  String path;

  download(this.url, this.path);

  Future<bool> downloadVideo() async {
    String videoName = DateTime.now().millisecondsSinceEpoch.toString();

    var youtubeExplode = YoutubeExplode();

    var manifest = await youtubeExplode.videos.streamsClient.getManifest(url);
    var streamInfo = manifest.muxed.withHighestBitrate();

    if (streamInfo != null) {
      var stream = youtubeExplode.videos.streamsClient.get(streamInfo);

      String newPath = path + '/$videoName.mp4';

      var file = File(newPath);
      var fileStream = file.openWrite();
      await stream.pipe(fileStream);

      await fileStream.flush();
      await fileStream.close();

      return true;
    }

    return false;
  }
}