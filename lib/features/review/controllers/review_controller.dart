import 'package:flutter/material.dart';
import '../models/review_model.dart';

class ReviewController extends ChangeNotifier {
  final Map<String, List<Review>> _reviewsByGuide = {};
  final Map<String, List<Review>> _reviewsByPlace = {};
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  List<Review> getGuideReviews(String guideId) =>
      _reviewsByGuide[guideId] ?? [];
  List<Review> getPlaceReviews(String placeId) =>
      _reviewsByPlace[placeId] ?? [];

  Future<void> loadGuideReviews(String guideId) async {
    try {
      _isLoading = true;
      notifyListeners();

      // TODO: Implement API call to load guide reviews
      await Future.delayed(const Duration(seconds: 1));
      _reviewsByGuide[guideId] = [
        Review(
          id: '1',
          userId: 'user1',
          guideId: guideId,
          placeId: 'place1',
          rating: 4.5,
          comment: 'Great experience with the guide! Very knowledgeable.',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
      ];

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadPlaceReviews(String placeId) async {
    try {
      _isLoading = true;
      notifyListeners();

      // TODO: Implement API call to load place reviews
      await Future.delayed(const Duration(seconds: 1));
      _reviewsByPlace[placeId] = [
        Review(
          id: '2',
          userId: 'user2',
          guideId: 'guide1',
          placeId: placeId,
          rating: 5.0,
          comment: 'Amazing historical site! Must visit.',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ];

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitReview({
    required String guideId,
    required String placeId,
    required double rating,
    required String comment,
    List<String>? photos,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      // TODO: Implement API call to submit review
      await Future.delayed(const Duration(seconds: 1));
      final review = Review(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'currentUserId', // This would come from auth
        guideId: guideId,
        placeId: placeId,
        rating: rating,
        comment: comment,
        createdAt: DateTime.now(),
        photos: photos,
      );

      // Update both maps
      _reviewsByGuide[guideId] ??= [];
      _reviewsByGuide[guideId]!.insert(0, review);

      _reviewsByPlace[placeId] ??= [];
      _reviewsByPlace[placeId]!.insert(0, review);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
