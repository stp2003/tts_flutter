import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TTS flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: TextToSpeech()),
      ),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  TextToSpeech({Key? key}) : super(key: key);

  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  speak(String text) async {
    await flutterTts.setLanguage("en-Us");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
              style: const TextStyle(color: Colors.yellowAccent),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
              child: const Text("Start Text To Speech"),
              onPressed: () => speak(textEditingController.text),
            )
          ],
        ),
      ),
    );
  }
}
