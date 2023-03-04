import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
// import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Image.asset('assets/images/IMG-20230303-WA0001.jpg'),
            ),
            Card(
              elevation: 10,
              child: Image.asset("assets/images/IMG-20230303-WA0002.jpg"),
            ),
            Card(
              elevation: 10,
              child: Image.asset('assets/images/IMG-20230303-WA0003.jpg'),
            ),
            Card(
              elevation: 10,
              child: Image.asset('assets/images/IMG-20230303-WA0004.jpg'),
            ),
            Card(
              elevation: 10,
              child: Image.asset('assets/images/IMG-20230303-WA0005.jpg'),
            ),
            Card(
              elevation: 10,
              child: Image.asset('assets/images/IMG-20230303-WA0006.jpg'),
            ),
            // VideoPlayerView(
            //   url: 'assets/images/WhatsApp Video 2023-03-03 at 16.34.40.mp4',
            //   dataSourceType: DataSourceType.asset,
            // ),
            // VideoPlayerView(
            //   url: 'assets/images/WhatsApp Video 2023-03-03 at 16.34.40.mp4',
            //   dataSourceType: DataSourceType.asset,
            // ),
            // VideoPlayerView(
            //   url: 'https://www.youtube.com/watch?v=4QesgADu8gM',
            //   dataSourceType: DataSourceType.network,
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Name'),
                  const Text(
                    'GORDHAN LAL PARIHAR',
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Designation/Status'),
                  const Text(
                    'PROPRIETOR',
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Resident of State'),
                  const Text(
                    'Madhya Pradesh',
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.url,
    required this.dataSourceType,
  });

  final String url;

  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;

  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      // case DataSourceType.file:
      //   _videoPlayerController = VideoPlayerController.file(File(widget.url));
      //   break;
      // case DataSourceType.contentUri:
      //   _videoPlayerController =
      //       VideoPlayerController.contentUri(Uri.parse(widget.url));
      //   break;
    }

    _videoPlayerController.initialize().then(
          (_) => setState(
            () => _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.dataSourceType.name.toUpperCase(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        _videoPlayerController.value.isInitialized?
        AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: Chewie(controller: _chewieController),
        ): const SizedBox.shrink(),
      ],
    );
  }
}