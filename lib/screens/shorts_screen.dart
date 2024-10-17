import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  ShortsScreenState createState() => ShortsScreenState();
}

class ShortsScreenState extends State<ShortsScreen> {
  List<dynamic> videos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    const apiKey = 'a57df8a1fdf8431aaba4b05321421500';
    const url =
        'https://api.spoonacular.com/food/videos/search?query=pasta&minLength=0&maxLength=60&number=5&apiKey=$apiKey';

    try {
      var response = await Dio().get(url);
      setState(() {
        videos = response.data['videos'];
        isLoading = false;
      });
    } catch (e) {
      print('Failed to load videos: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Swiper(
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) {
          final video = videos[index];
          return Card(
            elevation: 8,
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ShortVideoPlayer(
                youtubeId: video['youTubeId'],
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

class ShortVideoPlayer extends StatefulWidget {
  final String youtubeId;

  const ShortVideoPlayer({super.key, required this.youtubeId});

  @override
  ShortVideoPlayerState createState() => ShortVideoPlayerState();
}

class ShortVideoPlayerState extends State<ShortVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:
      MediaQuery.of(context).size.height * 0.75,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          _controller.addListener(() {});
        },
      ),
    );
  }
}
