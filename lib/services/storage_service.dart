import 'package:shared_preferences/shared_preferences.dart';
import '../models/bookmark.dart';

class StorageService {
  static const String _key = 'bookmarks';

  Future<List<Bookmark>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList(_key);
    
    if (items == null) {
      return [];
    }

    return items.map((item) => Bookmark.fromJson(item)).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  Future<void> saveBookmark(Bookmark bookmark) async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = await getBookmarks();
    bookmarks.add(bookmark);
    
    final List<String> encodedList = bookmarks.map((b) => b.toJson()).toList();
    await prefs.setStringList(_key, encodedList);
  }

  Future<void> deleteBookmark(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = await getBookmarks();
    
    bookmarks.removeWhere((bookmark) => bookmark.id == id);
    
    final List<String> encodedList = bookmarks.map((b) => b.toJson()).toList();
    await prefs.setStringList(_key, encodedList);
  }
}
