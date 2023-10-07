import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)),
      title: "Sound Reminder",
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int x = 0;
  int y = 0;
  final player = AudioPlayer();

  Future<void> one() async {
    x = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      x++;
      if(x == 60){
        x = 0;
        await player.play(AssetSource('wood.mp3'));
      }
      if (kDebugMode) {
        print(x);
      }
      if (y == 1){
        timer.cancel();
      }
    });
  }

  Future<void> tow() async {
    x = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      x++;
      if(x == 120){
        x = 0;
        await player.play(AssetSource('wood.mp3'));
      }
      if (kDebugMode) {
        print(x);
      }
      if (y == 1){
        timer.cancel();
      }
    });
  }

  Future<void> three() async {
    x = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      x++;
      if(x == 300){
        x = 0;
        await player.play(AssetSource('wood.mp3'));
      }
      if (kDebugMode) {
        print(x);
      }
      if (y == 1){
        timer.cancel();
      }
    });
  }

  Future<void> four() async {
    x = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      x++;
      if(x == 600){
        x = 0;
        await player.play(AssetSource('wood.mp3'));
      }
      if (kDebugMode) {
        print(x);
      }
      if (y == 1){
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await player.play(AssetSource('button.wav'));
        y = 1;
      },child: const Text("Stop"),),
      backgroundColor: Colors.white10,
      body: Center(
          child: Row(
            children: [
              const SizedBox(width: 40),
              FloatingActionButton(
                onPressed: () async {
                  y = 0;
                  await player.play(AssetSource('button.wav'));
                  one();
                },
                child: const Text("1Min"),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () async {
                  y = 0;
                  await player.play(AssetSource('button.wav'));
                  tow();
                },
                child: const Text("2Min"),
              ),
              const SizedBox(width: 15),
              FloatingActionButton(
                onPressed: () async {
                  y = 0;
                  await player.play(AssetSource('button.wav'));
                  three();
                },
                child: const Text("5Min"),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () async {
                  y = 0;
                  await player.play(AssetSource('button.wav'));
                  four();
                },
                child: const Text("10Min"),
              ),
            ],
          )),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Sound Reminder"),
      ),
    );
  }
}
