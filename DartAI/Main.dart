import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

final env = DotEnv(includePlatformEnvironment: true)..load();

void main() async {
  print('=== Dart CLI Chat Gemini AI===');

  while (true) {
    showMenu();
    final choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        await generateContent();
        break;
      case '2':
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }

    print('\nPress Enter to continue...');
    stdin.readLineSync();
  }
}

void showMenu() {
  print('\n');
  print('1. Chat wiht Gemini AI');
  print('2. Exit');
  print('Choose an option (1-2): ');
}

Future<void> generateContent() async {
  print('\n--- Chat with Gemini AI ---');

  print('Start typing a prompt : ');
  final prompt = stdin.readLineSync() ?? '';

  if (prompt.trim().isEmpty) {
    print('Prompt cannot be empty!');
    return;
  }
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

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body[0]}');
  } finally {
    client.close();
  }
}
