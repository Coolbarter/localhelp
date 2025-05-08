import 'package:flutter/material.dart';
import '../models/guide_model.dart';

class GuideController extends ChangeNotifier {
  Guide? _guide;
  List<Map<String, String>> _incomingRequests = [];
  bool _isLoading = false;

  Guide? get guide => _guide;
  List<Map<String, String>> get incomingRequests => _incomingRequests;
  bool get isLoading => _isLoading;

  Future<void> loadGuideData() async {
    _isLoading = true;
    notifyListeners();

    // TODO: Replace with actual API call
    await Future.delayed(const Duration(seconds: 1));
    _guide = Guide(
      id: '1',
      name: 'John Doe',
      rating: 4.8,
      reviewCount: 124,
      availability: 'Available Weekends',
      availabilityTime: '9:00 AM - 5:00 PM',
    );

    _incomingRequests = [
      {'name': 'Sarah Parker', 'date': 'July 15'},
    ];

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateAvailability(String availability, String time) async {
    // TODO: Implement API call to update availability
    await Future.delayed(const Duration(seconds: 1));
    if (_guide != null) {
      _guide = Guide(
        id: _guide!.id,
        name: _guide!.name,
        rating: _guide!.rating,
        reviewCount: _guide!.reviewCount,
        availability: availability,
        availabilityTime: time,
      );
      notifyListeners();
    }
  }

  Future<void> handleRequest(String requesterId, bool accept) async {
    // TODO: Implement API call to handle request
    await Future.delayed(const Duration(seconds: 1));
    _incomingRequests.removeWhere((request) => request['id'] == requesterId);
    notifyListeners();
  }
}
