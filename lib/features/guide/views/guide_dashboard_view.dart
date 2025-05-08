import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/guide_controller.dart';

class GuideDashboardView extends StatefulWidget {
  const GuideDashboardView({super.key});

  @override
  State<GuideDashboardView> createState() => _GuideDashboardViewState();
}

class _GuideDashboardViewState extends State<GuideDashboardView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GuideController>().loadGuideData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GuideController>(
      builder: (context, controller, child) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final guide = controller.guide;
        if (guide == null) {
          return const Center(child: Text('Failed to load guide data'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Welcome, ${guide.name}!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),

            // Availability Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Availability',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            // TODO: Show availability edit dialog
                            await controller.updateAvailability(
                              'Available Weekdays',
                              '10:00 AM - 6:00 PM',
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(guide.availability),
                    Text(guide.availabilityTime),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Incoming Requests Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Incoming Requests',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to all requests view
                          },
                          child: const Text('View All'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...controller.incomingRequests.map(
                      (request) => ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(request['name'] ?? ''),
                        subtitle: Text('Request for ${request['date']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.check_circle_outline),
                              onPressed:
                                  () => controller.handleRequest(
                                    request['id'] ?? '',
                                    true,
                                  ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              onPressed:
                                  () => controller.handleRequest(
                                    request['id'] ?? '',
                                    false,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Rating Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Rating',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 32),
                        const SizedBox(width: 8),
                        Text(
                          guide.rating.toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${guide.reviewCount} reviews)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
