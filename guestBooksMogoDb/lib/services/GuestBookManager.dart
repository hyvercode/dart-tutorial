import 'package:dart_guestbook/models/Guest.dart';
import 'package:dart_guestbook/services/DatabaseManager%20.dart';
import 'package:mongo_dart/mongo_dart.dart';

class GuestBookManager {
  final DatabaseManager _dbManager = DatabaseManager();

  // Initialize database connection
  Future<void> initialize() async {
    await _dbManager.connect();
  }

  // Close database connection
  Future<void> close() async {
    await _dbManager.close();
  }

  // CREATE - Add new entry
  Future<void> addEntry(String name, String phoneNumber, String email) async {
    try {
      final entry = Guest(
        name: name,
        phoneNumber: phoneNumber,
        email: email,
        timestamp: DateTime.now(),
      );

      await _dbManager.collection.insertOne(entry.toJson());
      print('Entry added successfully!');
    } catch (e) {
      print('Error adding entry: $e');
    }
  }

  // READ - Get all entries
  Future<List<Guest>> getAllEntries() async {
    try {
      final cursor = _dbManager.collection.find();
      final documents = await cursor.toList();

      return documents.map((doc) => Guest.fromJson(doc)).toList();
    } catch (e) {
      print('Error retrieving entries: $e');
      return [];
    }
  }

  // READ - Display all entries
  Future<void> displayAllEntries() async {
    final entries = await getAllEntries();

    if (entries.isEmpty) {
      print('No entries found.');
      return;
    }

    print('\n--- GUEST BOOK ENTRIES ---');
    for (var entry in entries) {
      print(entry);
      print('---');
    }
  }

  // READ - Find entry by ID
  Future<Guest?> findEntryById(String id) async {
    try {
      final objectId = ObjectId.parse(id);
      final document =
          await _dbManager.collection.findOne(where.eq('_id', objectId));

      if (document != null) {
        return Guest.fromJson(document);
      }
      return null;
    } catch (e) {
      print('Error finding entry: $e');
      return null;
    }
  }

  // UPDATE - Modify existing entry
  Future<void> updateEntry(String id, String? newName, String? newPhoneNumber,
      String? newEmail) async {
    try {
      final objectId = ObjectId.parse(id);
      final updateData = <String, dynamic>{};

      if (newName != null) updateData['name'] = newName;
      if (newPhoneNumber != null) updateData['message'] = newPhoneNumber;
      if (newEmail != null) updateData['email'] = newEmail;

      if (updateData.isEmpty) {
        print('No changes to update.');
        return;
      }

      final result = await _dbManager.collection.updateOne(
        where.eq('_id', objectId),
        {'\$set': updateData},
      );

      if (result.isSuccess && result.nModified > 0) {
        print('Entry updated successfully!');
      } else if (result.isSuccess && result.nModified == 0) {
        print('Entry with ID $id not found or no changes made.');
      } else {
        print('Failed to update entry.');
      }
    } catch (e) {
      print('Error updating entry: $e');
    }
  }

  // DELETE - Remove entry
  Future<void> deleteEntry(String id) async {
    try {
      final objectId = ObjectId.parse(id);
      final result =
          await _dbManager.collection.deleteOne(where.eq('_id', objectId));

      if (result.isSuccess && result.nRemoved > 0) {
        print('Entry deleted successfully!');
      } else if (result.isSuccess && result.nRemoved == 0) {
        print('Entry with ID $id not found.');
      } else {
        print('Failed to delete entry.');
      }
    } catch (e) {
      print('Error deleting entry: $e');
    }
  }

  // Get total count
  Future<int> getTotalEntries() async {
    try {
      return await _dbManager.collection.count();
    } catch (e) {
      print('Error getting entry count: $e');
      return 0;
    }
  }

  // ADDITIONAL FEATURES

  // Search entries by name or message
  Future<List<Guest>> searchEntries(String searchTerm) async {
    try {
      final cursor = _dbManager.collection.find(where.or([
        where.match('name', searchTerm),
        where.match('message', searchTerm)
      ] as SelectorBuilder));

      final documents = await cursor.toList();
      return documents.map((doc) => Guest.fromJson(doc)).toList();
    } catch (e) {
      print('Error searching entries: $e');
      return [];
    }
  }

  // Get entries by date range
  Future<List<Guest>> getEntriesByDateRange(
      DateTime startDate, DateTime endDate) async {
    try {
      final cursor = _dbManager.collection
          .find(where.gte('timestamp', startDate).lte('timestamp', endDate));

      final documents = await cursor.toList();
      return documents.map((doc) => Guest.fromJson(doc)).toList();
    } catch (e) {
      print('Error getting entries by date range: $e');
      return [];
    }
  }

  // Get latest entries (limit)
  Future<List<Guest>> getLatestEntries(int limit) async {
    try {
      final collection =
          _dbManager.collection; // Replace with your actual collection name

      // Create a SelectorBuilder to define your query and sort options
      final selector = where.sortBy('timestamp', descending: true).limit(limit);

      // Pass the selector to the find method
      final cursor = collection.find(selector);

      final documents = await cursor.toList();
      return documents.map((doc) => Guest.fromJson(doc)).toList();
    } catch (e) {
      print('Error getting latest entries: $e');
      return [];
    }
  }
}
