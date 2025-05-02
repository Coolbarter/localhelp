import 'package:flutter/material.dart';

class LeaveReviewScreen extends StatefulWidget {
  final String guideName;

  const LeaveReviewScreen({super.key, required this.guideName});

  @override
  State<LeaveReviewScreen> createState() => _LeaveReviewScreenState();
}

class _LeaveReviewScreenState extends State<LeaveReviewScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leave Review for ${widget.guideName}')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Guide Info
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person, size: 30),
              ),
              const SizedBox(width: 16),
              Text(
                widget.guideName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Rating Selection
          Text('Your Rating:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => IconButton(
                iconSize: 40,
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Review Text
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Your Comments',
              hintText: 'Share your experience with this guide...',
              alignLabelWithHint: true,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Submit Button
          FilledButton(
            onPressed:
                _rating > 0
                    ? () {
                      // TODO: Submit review
                      Navigator.pop(context);
                    }
                    : null,
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Submit Review'),
          ),
        ],
      ),
    );
  }
}
