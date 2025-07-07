import 'dart:io';

import 'package:dart_guestbook/services/GuestBookManager.dart';

void main() async {
  final guestBook = GuestBookManager();

  try {
    await guestBook.initialize();

    print('=== DART CLI GUEST BOOK SYSTEM WITH MONGODB ===');
    print('Welcome to the Guest Book!');

    while (true) {
      showMenu();
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await addNewEntry(guestBook);
          break;
        case '2':
          await guestBook.displayAllEntries();
          break;
        case '3':
          await updateExistingEntry(guestBook);
          break;
        case '4':
          await deleteExistingEntry(guestBook);
          break;
        case '5':
          await searchEntries(guestBook);
          break;
        case '6':
          await showLatestEntries(guestBook);
          break;
        case '7':
          await showStatistics(guestBook);
          break;
        case '8':
          print('Thank you for using Guest Book! Goodbye!');
          await guestBook.close();
          exit(0);
        default:
          print('Invalid choice. Please try again.');
      }

      print('\nPress Enter to continue...');
      stdin.readLineSync();
    }
  } catch (e) {
    print('Error: $e');
    print('Please ensure MongoDB is running and accessible.');
    exit(1);
  }
}

void showMenu() {
  print('\n--- MENU ---');
  print('1. Add New Entry');
  print('2. View All Entries');
  print('3. Update Entry');
  print('4. Delete Entry');
  print('5. Search Entries');
  print('6. View Latest Entries');
  print('7. Show Statistics');
  print('8. Exit');
  print('Choose an option (1-8): ');
}

Future<void> addNewEntry(GuestBookManager guestBook) async {
  print('\n--- ADD NEW ENTRY ---');

  print('Enter your name: ');
  final name = stdin.readLineSync() ?? '';

  if (name.trim().isEmpty) {
    print('Name cannot be empty!');
    return;
  }

  print('Enter your phone: ');
  final phoneNumber = stdin.readLineSync() ?? '';

  if (phoneNumber.trim().isEmpty) {
    print('Phone cannot be empty!');
    return;
  }

  print('Enter your email: ');
  final email = stdin.readLineSync() ?? '';

  if (email.trim().isEmpty) {
    print('Phone cannot be empty!');
    return;
  }

  await guestBook.addEntry(name.trim(), phoneNumber.trim(), email.trim());
}

Future<void> updateExistingEntry(GuestBookManager guestBook) async {
  final totalEntries = await guestBook.getTotalEntries();
  if (totalEntries == 0) {
    print('No entries to update.');
    return;
  }

  print('\n--- UPDATE ENTRY ---');
  await guestBook.displayAllEntries();

  print('Enter the ID of the entry to update: ');
  final id = stdin.readLineSync()?.trim() ?? '';

  if (id.isEmpty) {
    print('Invalid ID!');
    return;
  }

  final entry = await guestBook.findEntryById(id);
  if (entry == null) {
    print('Entry not found!');
    return;
  }

  print('Current entry: $entry');

  print('Enter new name (or press Enter to keep current): ');
  final newName = stdin.readLineSync();

  print('Enter new phone (or press Enter to keep current): ');
  final newPhone = stdin.readLineSync();

  print('Enter new mail (or press Enter to keep current): ');
  final newMail = stdin.readLineSync();

  await guestBook.updateEntry(
      id,
      newName?.trim().isEmpty == false ? newName!.trim() : null,
      newPhone?.trim().isEmpty == false ? newPhone!.trim() : null,
      newMail?.trim().isEmpty == false ? newMail!.trim() : null);
}

Future<void> deleteExistingEntry(GuestBookManager guestBook) async {
  final totalEntries = await guestBook.getTotalEntries();
  if (totalEntries == 0) {
    print('No entries to delete.');
    return;
  }

  print('\n--- DELETE ENTRY ---');
  await guestBook.displayAllEntries();

  print('Enter the ID of the entry to delete: ');
  final id = stdin.readLineSync()?.trim() ?? '';

  if (id.isEmpty) {
    print('Invalid ID!');
    return;
  }

  print('Are you sure you want to delete this entry? (y/N): ');
  final confirmation = stdin.readLineSync()?.toLowerCase();

  if (confirmation == 'y' || confirmation == 'yes') {
    await guestBook.deleteEntry(id);
  } else {
    print('Delete operation cancelled.');
  }
}

Future<void> searchEntries(GuestBookManager guestBook) async {
  print('\n--- SEARCH ENTRIES ---');
  print('Enter search term (name or message): ');
  final searchTerm = stdin.readLineSync()?.trim() ?? '';

  if (searchTerm.isEmpty) {
    print('Search term cannot be empty!');
    return;
  }

  final results = await guestBook.searchEntries(searchTerm);

  if (results.isEmpty) {
    print('No entries found matching "$searchTerm".');
  } else {
    print('\n--- SEARCH RESULTS ---');
    for (var entry in results) {
      print(entry);
      print('---');
    }
    print('Found ${results.length} entries.');
  }
}

Future<void> showLatestEntries(GuestBookManager guestBook) async {
  print('\n--- LATEST ENTRIES ---');
  print('Enter number of latest entries to show (default: 5): ');
  final input = stdin.readLineSync()?.trim() ?? '';

  int limit = 5;
  if (input.isNotEmpty) {
    limit = int.tryParse(input) ?? 5;
  }

  final entries = await guestBook.getLatestEntries(limit);

  if (entries.isEmpty) {
    print('No entries found.');
  } else {
    print('\n--- LATEST $limit ENTRIES ---');
    for (var entry in entries) {
      print(entry);
      print('---');
    }
  }
}

Future<void> showStatistics(GuestBookManager guestBook) async {
  print('\n--- STATISTICS ---');
  final totalEntries = await guestBook.getTotalEntries();
  print('Total entries: $totalEntries');
  print('Database: MongoDB');
  print('Collection: entries');
  print('Connection: mongodb://localhost:27017/guestbook');
}
