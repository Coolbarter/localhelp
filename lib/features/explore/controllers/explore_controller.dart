import 'package:flutter/material.dart';
import '../models/place_model.dart';

class ExploreController extends ChangeNotifier {
  List<Place> _places = [];
  List<Place> _filteredPlaces = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  List<Place> get places => _filteredPlaces.isEmpty ? _places : _filteredPlaces;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadPlaces() async {
    try {
      _isLoading = true;
      notifyListeners();

      // TODO: Implement API call to load places
      await Future.delayed(const Duration(seconds: 1));
      _places = [
        Place(
          id: '1',
          name: 'Persepolis',
          city: 'Shiraz',
          description: 'Ancient ceremonial capital of the Persian Empire',
          imageUrl: 'assets/images/Shiraz.jpg',
          tags: ['Historical', 'Ancient', 'Architecture'],
          rating: 4.9,
          reviewCount: 450,
          availableGuides: ['guide1', 'guide2'],
        ),
        Place(
          id: '2',
          name: 'Naqsh-e Jahan Square',
          city: 'Isfahan',
          description:
              'UNESCO World Heritage site and a masterpiece of Persian architecture',
          imageUrl: 'assets/images/Isfahan.jpg',
          tags: ['Historical', 'Architecture', 'Cultural'],
          rating: 4.8,
          reviewCount: 380,
          availableGuides: ['guide3', 'guide4'],
        ),
      ];

      _applySearch();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    _searchQuery = query.toLowerCase();
    _applySearch();
    notifyListeners();
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      _filteredPlaces = [];
      return;
    }

    _filteredPlaces =
        _places.where((place) {
          return place.name.toLowerCase().contains(_searchQuery) ||
              place.city.toLowerCase().contains(_searchQuery) ||
              place.description.toLowerCase().contains(_searchQuery) ||
              place.tags.any((tag) => tag.toLowerCase().contains(_searchQuery));
        }).toList();
  }

  void filterByCity(String city) {
    if (city.isEmpty) {
      _filteredPlaces = [];
    } else {
      _filteredPlaces =
          _places
              .where((place) => place.city.toLowerCase() == city.toLowerCase())
              .toList();
    }
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _filteredPlaces = [];
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
