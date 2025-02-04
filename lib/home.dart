import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class BasicAudioPlayer extends StatefulWidget {
  @override
  _BasicAudioPlayerState createState() => _BasicAudioPlayerState();
}

class _BasicAudioPlayerState extends State<BasicAudioPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int currentIndex = 0;
  bool isLooping = false;

  final List<Map<String, String>> songs = [
    {
      "title": "Kaisa Mai",
      "path": "audio/KaisaMai.mp3",
      "image": "assets/images/anv.jpg"
    },
    {
      "title": "Nindiya ke Par",
      "path": "audio/Nindiya.mp3",
      "image": "assets/images/anv.jpg"
    },
    {
      "title": "Zimmedar",
      "path": "audio/Zimmedaar.mp3",
      "image": "assets/images/zim.jpg"
    },
    {
      "title": "Gulabo",
      "path": "audio/GULABO.mp3",
      "image": "assets/images/gul.jpg"
    },
    {
      "title": "Last Friday Night",
      "path": "audio/Katy.mp3",
      "image": "assets/images/last.jpg"
    },
  ];

  @override
  void initState() {
    super.initState();

    _audioPlayer.onPlayerComplete.listen((event) {
      if (isLooping) {
        _playSong(currentIndex); // Repeat current song
      } else {
        _nextSong(); // Move to next song
      }
    });
  }

  Future<void> _playSong(int index) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.setSource(AssetSource(songs[index]["path"]!));
      await _audioPlayer.resume();
      setState(() {
        isPlaying = true;
        currentIndex = index;
      });
    } catch (e) {
      print("❌ Error playing audio: $e");
    }
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() => isPlaying = false);
  }

  Future<void> _nextSong() async {
    int nextIndex = (currentIndex + 1) % songs.length;
    _playSong(nextIndex);
  }

  Future<void> _previousSong() async {
    int prevIndex = (currentIndex - 1 + songs.length) % songs.length;
    _playSong(prevIndex);
  }

  void _toggleLoop() {
    setState(() {
      isLooping = !isLooping;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Player")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display image for the current song
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                songs[currentIndex]["image"]!,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Now Playing: ${songs[currentIndex]["title"]}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous_rounded, size: 40),
                  onPressed: _previousSong,
                ),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 50,
                  ),
                  onPressed:
                      isPlaying ? _pauseAudio : () => _playSong(currentIndex),
                ),
                IconButton(
                  icon: Icon(Icons.skip_next_rounded, size: 40),
                  onPressed: _nextSong,
                ),
              ],
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(
                isLooping ? Icons.loop : Icons.repeat_one_rounded,
                color: isLooping ? Colors.green : Colors.black,
                size: 30,
              ),
              onPressed: _toggleLoop,
            ),
            Text(isLooping ? "Looping ON" : "Looping OFF"),
          ],
        ),
      ),
    );
  }
}
