import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import '../features/chat/views/chat_screen.dart';

class ViewGuideProfileScreen extends StatefulWidget {
  final String guideName;

  const ViewGuideProfileScreen({super.key, required this.guideName});

  @override
  _ViewGuideProfileScreenState createState() => _ViewGuideProfileScreenState();
}

class _ViewGuideProfileScreenState extends State<ViewGuideProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.cover,
                    errorBuilder:
                        (ctx, err, st) => Container(
                          color: colorScheme.surfaceContainerHighest,
                          child: Icon(
                            Icons.person_outline_rounded,
                            size: 100,
                            color: colorScheme.primary,
                          ),
                        ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.paddingLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppTheme.paddingLg),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(
                          AppTheme.borderRadiusLg,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.guideName,
                                      style: textTheme.headlineMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: AppTheme.paddingXs),
                                    Text(
                                      'Professional Tour Guide',
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FilledButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ChatScreen(
                                            otherUserName: widget.guideName,
                                          ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.chat_outlined),
                                label: const Text('Message'),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppTheme.paddingLg),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStat(
                                context,
                                '4.9',
                                'Rating',
                                Icons.star_rounded,
                              ),
                              _buildStat(
                                context,
                                '127',
                                'Tours',
                                Icons.map_outlined,
                              ),
                              _buildStat(
                                context,
                                '1.2k',
                                'Reviews',
                                Icons.rate_review_outlined,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppTheme.paddingLg),
                    Text(
                      'About',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppTheme.paddingMd),
                    Text(
                      'Professional tour guide with 5+ years of experience showcasing the beauty and culture of Iran. Specialized in historical tours and photography experiences.',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: AppTheme.paddingLg),
                    Text(
                      'Specialties',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppTheme.paddingMd),
                    Wrap(
                      spacing: AppTheme.paddingSm,
                      runSpacing: AppTheme.paddingSm,
                      children:
                          [
                                'Historical Tours',
                                'Photography',
                                'Cultural Experiences',
                                'Local Cuisine',
                                'Architecture',
                              ]
                              .map(
                                (specialty) => Chip(
                                  label: Text(specialty),
                                  backgroundColor:
                                      colorScheme.surfaceContainerHighest,
                                  labelStyle: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: AppTheme.paddingLg),
                    FilledButton(
                      onPressed: () {
                        // TODO: Implement booking flow
                      },
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                      ),
                      child: const Text('Book a Tour'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: colorScheme.primary, size: 24),
        const SizedBox(height: AppTheme.paddingXs),
        Text(
          value,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
