import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'view_guide_profile_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary.withOpacity(0.05),
                  theme.colorScheme.surface,
                ],
              ),
            ),
          ),

          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Vibrant app bar with animated search bar
              SliverAppBar(
                expandedHeight: 180,
                floating: true,
                pinned: true,
                backgroundColor: theme.colorScheme.surface.withOpacity(0.8),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.primary.withOpacity(0.2),
                          theme.colorScheme.surface,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppTheme.paddingMd,
                            AppTheme.paddingLg * 2,
                            AppTheme.paddingMd,
                            AppTheme.paddingMd,
                          ),
                          child: Text(
                            "Discover Your Guide",
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppTheme.paddingMd,
                            0,
                            AppTheme.paddingMd,
                            AppTheme.paddingLg,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withOpacity(
                                    0.2,
                                  ),
                                  blurRadius: 12,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: SearchBar(
                              hintText: 'Find your perfect local guide...',
                              hintStyle: MaterialStateProperty.all(
                                TextStyle(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              leading: Icon(
                                Icons.search,
                                color: theme.colorScheme.primary,
                              ),
                              trailing: [
                                IconButton(
                                  icon: Icon(
                                    Icons.tune,
                                    color: theme.colorScheme.primary,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                theme.colorScheme.surface.withOpacity(0.9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Category chips with gradient background
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: AppTheme.paddingMd,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withOpacity(0.7),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.paddingMd,
                      vertical: AppTheme.paddingSm,
                    ),
                    child: Row(
                      children: [
                        _buildCategoryChip(context, 'All Guides', true),
                        _buildCategoryChip(context, 'Top Rated', false),
                        _buildCategoryChip(context, 'Photography', false),
                        _buildCategoryChip(context, 'Food', false),
                        _buildCategoryChip(context, 'Adventure', false),
                        _buildCategoryChip(context, 'History', false),
                      ],
                    ),
                  ),
                ),
              ),

              // Featured guides section with animated cards
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppTheme.paddingMd,
                    AppTheme.paddingMd,
                    AppTheme.paddingMd,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: theme.colorScheme.tertiary,
                            size: 28,
                          ),
                          const SizedBox(width: AppTheme.paddingSm),
                          Text(
                            'Featured Guides',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.paddingMd),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          itemBuilder:
                              (context, index) => _buildFeaturedGuideCard(
                                context,
                                index,
                                theme,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Guides near you section with enhanced list
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingMd),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: theme.colorScheme.secondary,
                        size: 28,
                      ),
                      const SizedBox(width: AppTheme.paddingSm),
                      Text(
                        'Guides Near You',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppTheme.paddingMd,
                  0,
                  AppTheme.paddingMd,
                  AppTheme.paddingLg,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        _buildNearbyGuideCard(context, index, theme),
                    childCount: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      // Floating action button for quick guide access
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.colorScheme.tertiary,
        child: const Icon(Icons.explore, color: Colors.white),
      ),
    );
  }

  // Stylized category chip with animation
  Widget _buildCategoryChip(BuildContext context, String label, bool selected) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: AppTheme.paddingSm),
      child: FilterChip(
        label: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: selected ? Colors.white : theme.colorScheme.onSurface,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: selected,
        showCheckmark: false,
        backgroundColor: theme.colorScheme.surfaceVariant,
        selectedColor: theme.colorScheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.paddingSm,
          vertical: AppTheme.paddingSm / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMd),
        ),
        elevation: selected ? 2 : 0,
        onSelected: (_) {},
      ),
    );
  }

  // Enhanced featured guide card with animation
  Widget _buildFeaturedGuideCard(
    BuildContext context,
    int index,
    ThemeData theme,
  ) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: AppTheme.paddingMd),
      child: Card(
        elevation: 4,
        shadowColor: theme.colorScheme.shadow.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) =>
                          ViewGuideProfileScreen(guideName: 'John Doe $index'),
                ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: 'guide_image_$index',
                    child: Image.asset(
                      'assets/images/face.jpg',
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: $error');
                        return Container(
                          height: 160,
                          color: theme.colorScheme.surfaceVariant,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: theme.colorScheme.primary,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(AppTheme.paddingSm / 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.tertiary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(AppTheme.borderRadiusMd),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.white),
                          const SizedBox(width: 2),
                          Text(
                            '4.9',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppTheme.paddingSm,
                        horizontal: AppTheme.paddingMd,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            size: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            index % 2 == 0 ? 'Food Expert' : 'Photographer',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(AppTheme.paddingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe $index',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppTheme.paddingSm),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          index % 2 == 0 ? 'Paris, France' : 'Rome, Italy',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.paddingSm),
                    Row(
                      children: [
                        Icon(
                          Icons.event_available,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Available Now',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Redesigned nearby guide card with interactive elements
  Widget _buildNearbyGuideCard(
    BuildContext context,
    int index,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.paddingMd),
      child: Card(
        elevation: 2,
        shadowColor: theme.colorScheme.shadow.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
        ),
        child: InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => ViewGuideProfileScreen(
                        guideName: 'Local Guide $index',
                      ),
                ),
              ),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.paddingMd),
            child: Row(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: 'nearby_guide_$index',
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppTheme.borderRadiusLg,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppTheme.borderRadiusLg - 2,
                          ),
                          child: Image.asset(
                            'assets/images/face.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading avatar: $error');
                              return Container(
                                color: theme.colorScheme.primaryContainer,
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: theme.colorScheme.primary,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    if (index % 3 == 0)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.colorScheme.surface,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.verified,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: AppTheme.paddingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Local Guide $index',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (index % 2 == 0) ...[
                            const SizedBox(width: AppTheme.paddingSm),
                            Icon(
                              Icons.verified,
                              size: 18,
                              color: theme.colorScheme.primary,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: AppTheme.paddingSm),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: theme.colorScheme.primary.withOpacity(0.7),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            index % 3 == 0
                                ? 'Rome, Italy'
                                : index % 2 == 0
                                ? 'Paris, France'
                                : 'Barcelona, Spain',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.paddingSm),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(
                                AppTheme.borderRadiusSm,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${4.5 + (index % 5) * 0.1}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(
                                AppTheme.borderRadiusSm,
                              ),
                            ),
                            child: Text(
                              'Available',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.tertiary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppTheme.paddingSm),
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: theme.colorScheme.primary,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
