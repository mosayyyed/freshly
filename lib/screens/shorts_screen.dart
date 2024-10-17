import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../env/env.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  ShortsScreenState createState() => ShortsScreenState();
}

class ShortsScreenState extends State<ShortsScreen> {
  List<dynamic> videos = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    String url =
        'https://api.spoonacular.com/food/videos/search?query=pasta&minLength=0&maxLength=60&number=5&apiKey=${Env.apiKey}';

    try {
      var response = await Dio().get(url);
      if (response.data['videos'] != null) {
        setState(() {
          videos = response.data['videos'];
        });
      } else {
        throw Exception('No videos found');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load videos: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:
            const Text('Short Videos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black54,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Text(errorMessage!,
                      style: const TextStyle(color: Colors.red)))
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
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white.withOpacity(0.5),
                      activeColor: Colors.white,
                    ),
                  ),
                  control: const SwiperControl(
                    color: Colors.white,
                    size: 30,
                  ),
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
      height: MediaQuery.of(context).size.height * 0.75,
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
