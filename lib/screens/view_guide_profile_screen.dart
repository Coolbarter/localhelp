import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ViewGuideProfileScreen extends StatelessWidget {
  final String guideName;

  const ViewGuideProfileScreen({super.key, required this.guideName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 200,
            title: Text(guideName),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/face.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/face.jpg'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              guideName,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              '28 • Paris, France',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // About Section
                  Text(
                    'About Me',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Passionate local guide with extensive knowledge of Parisian culture, history, and hidden gems. Love showing visitors the authentic side of Paris.',
                  ),
                  const SizedBox(height: 24),

                  // Languages Section
                  Text(
                    'Languages Spoken',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: const Text('English'),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ),
                      Chip(
                        label: const Text('French'),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ),
                      Chip(
                        label: const Text('Spanish'),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Availability Section
                  Text(
                    'Availability Notes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Available most weekends and weekday evenings. Flexible scheduling for full-day tours.',
                  ),
                  const SizedBox(height: 24),

                  // Reviews Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            '4.8',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            ' (124)',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    child: Icon(Icons.person, size: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Tourist ${index + 1}',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (starIndex) => Icon(
                                        Icons.star,
                                        size: 16,
                                        color:
                                            starIndex < 4
                                                ? Colors.amber
                                                : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Great experience! Our guide was knowledgeable and showed us amazing local spots we would never have found on our own.',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(otherUserName: guideName),
            ),
          );
        },
        icon: const Icon(Icons.message),
        label: const Text('Send Message'),
      ),
    );
  }
}
