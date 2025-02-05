import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Map<String, String>> songs = [
    {
      "title": "Kaisa Mai",
      "path": "audio/KaisaMai.mp3",
      "image": "assets/images/arpit.webp",
      "artist": "Arpit Bala"
    },
    {
      "title": "Nindiya ke Par",
      "path": "audio/Nindiya.mp3",
      "image": "assets/images/uzair.jpg",
      "artist": "Uzair Jaswal"
    },
    {
      "title": "Zimmedar",
      "path": "audio/Zimmedaar.mp3",
      "image": "assets/images/arpit.webp",
      "artist": "Arpit Bala"
    },
    {
      "title": "Gulabo",
      "path": "audio/GULABO.mp3",
      "image": "assets/images/arpit.webp",
      "artist": "Arpit Bala"
    },
    {
      "title": "Last Friday Night",
      "path": "audio/Katy.mp3",
      "image": "assets/images/kate.jpg",
      "artist": "Katy Perry"
    },
    {
      "title": "Boy with Luv",
      "path": "audio/bts.mp3",
      "image": "assets/images/v.jpg",
      "artist": "BTS"
    },
    {
      "title": "Dandelions",
      "path": "audio/dandelions.mp3",
      "image": "assets/images/dan.jpeg",
      "artist": "BTS"
    },
    {
      "title": "You're My Escape",
      "path": "audio/escape.mp3",
      "image": "assets/images/na.avif",
      "artist": "Naruto"
    },
    {
      "title": "F U N K A",
      "path": "audio/funka.mp3",
      "image": "assets/images/arpit.webp",
      "artist": "Arpit Bala"
    },
    {
      "title": "Love & Honour",
      "path": "audio/itachi.mp3",
      "image": "assets/images/it.jpg",
      "artist": "Naruto"
    },
    {
      "title": "Without You",
      "path": "audio/kakashi.mp3",
      "image": "assets/images/ka.jpeg",
      "artist": "Naruto"
    },
    {
      "title": "Kabir Singh",
      "path": "audio/kitna.mp3",
      "image": "assets/images/sha.jpg",
      "artist": "Arijit Singh"
    },
    {
      "title": "Lucid Dreams",
      "path": "audio/Lucid.mp3",
      "image": "assets/images/de.jpeg",
      "artist": "Juice"
    },
    {
      "title": "MayaBee",
      "path": "audio/maya.mp3",
      "image": "assets/images/maya.jpg",
      "artist": "Maya"
    },
    {
      "title": "Espresso",
      "path": "audio/sabrina.mp3",
      "image": "assets/images/sab.jpg",
      "artist": "Sabrina Carpenter"
    },
    {
      "title": "Timmy Turner",
      "path": "audio/tim.mp3",
      "image": "assets/images/de.jpeg",
      "artist": "Desiigner"
    },
    {
      "title": "Love & Angel",
      "path": "audio/tra.mp3",
      "image": "assets/images/tra.jpg",
      "artist": "Trafalgar"
    },
    {
      "title": "Tum Hy Ho",
      "path": "audio/tumhiho.mp3",
      "image": "assets/images/sha.jpg",
      "artist": "Arijit Singh"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 35),
              child: Text(
                "What",
                style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "do you want",
                style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 20),
              child: Text(
                "to hear?",
                style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        song["image"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      song["title"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      song["artist"]!,
                      style:
                          GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Icon(Icons.play_arrow, color: Colors.white),
                    onTap: () {
                      // Implement your play song logic here
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
