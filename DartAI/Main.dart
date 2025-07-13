import 'package:dart_ai/controllers/SpinnerController.dart';
import 'package:dart_ai/models/GeminiResponse.dart';
import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

final env = DotEnv(includePlatformEnvironment: true)..load();

void main() async {
  print('\n--- Dart CLI Chat with Gemini AI ---');
  await shootEffect("Starting please wait ", 10);
  showMenu();
}

void showMenu() async {
  while (true) {
    stdout.write('\nPress Enter to continue Chat or (q) to close: ');
    final choice = stdin.readLineSync();
    if (choice == null || choice.isEmpty) {
      await generateContent();
    } else if (choice.toLowerCase() == 'q') {
      print("👋 Exiting... Credit by hyvercode.com");
      exit(0);
    } else {
      print("❌ Invalid input. Press Enter or type 'q'.");
    }
  }
}

Future<void> generateContent() async {
  print('\x1B[3mStart typing a prompt :\x1B[0m');
  final prompt = stdin.readLineSync() ?? '';

  if (prompt.trim().isEmpty) {
    print('Prompt cannot be empty ❌');
    print('\n');
    return;
  }

  // Start spinner (does not block)
  final spinnerCtrl = SpinnerController();
  spinnerCtrl.start();
  final spinnerTask = spinner(spinnerCtrl);

  var client = http.Client();
  try {
    var response = await client.post(
        Uri.https(
          'generativelanguage.googleapis.com',
          '/v1beta/models/gemini-2.5-pro:streamGenerateContent',
          {
            'key': '${env['GEMINI_API_KEY']}',
          },
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': {
            "role": "user",
            "parts": [
              {"text": prompt}
            ]
          },
          "generationConfig": {
            "thinkingConfig": {
              "thinkingBudget": -1,
            },
            "responseMimeType": "text/plain",
          },
        }));

    List<dynamic> decoded = jsonDecode(response.body);

    List<GeminiResponse> responses = decoded
        .map((e) => GeminiResponse.fromJson(e as Map<String, dynamic>))
        .toList();

    if (response.statusCode == 200) {
      List<String> allTexts = [];
      for (var item in responses) {
        for (var candidate in item.candidates) {
          for (var part in candidate.content.parts) {
            allTexts.add(part.text);
          }
        }
      }
      String combinedResponse = allTexts.join(" ");

      // Stop spinner once request is complete
      spinnerCtrl.stop();
      await spinnerTask;
      print('\n');
      print("✨ Generating content...");
      print("$combinedResponse");
      print('\n');
      print("✅ Done!");
    } else {
      print("Error Request - ${response.statusCode}");
    }
  } finally {
    client.close();
  }
}

Future<void> shootEffect(String message, int count) async {
  for (int i = 0; i < count; i++) {
    stdout.write("$message${'.' * (i % 4)}\r");
    await Future.delayed(Duration(milliseconds: 150));
  }

  stdout.write('\x1B[2K\r');
  print("✅ Ready!");
}
