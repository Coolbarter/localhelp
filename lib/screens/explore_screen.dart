import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart'; // Adjust import path if needed
import 'view_guide_profile_screen.dart'; // Adjust import path if needed
import 'dart:ui'; // For ImageFilter.blur

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // --- State Variables for Filters ---
  String _selectedCity = 'All Cities';
  DateTime? _selectedArrivalDate;
  int _selectedDays = 1;
  double _priceRange = 100;
  String _selectedLanguage = 'Any';
  String? _expandedFilter; // Track which filter is expanded

  // List of available cities and languages
  final List<String> _cities = [
    'All Cities',
    'Tehran',
    'Isfahan',
    'Shiraz',
    'Yazd',
    'Tabriz',
  ];
  final List<String> _languages = [
    'Any',
    'Persian',
    'English',
    'Arabic',
    'French',
    'German',
  ];

  // --- Data for Carousels/Grids (Replace with actual data source later) ---
  final List<Map<String, dynamic>> _topDestinations = [
    {'name': 'Tehran', 'image': 'assets/images/Tehran.jpg'},
    {'name': 'Isfahan', 'image': 'assets/images/Isfahan.jpg'},
    {'name': 'Shiraz', 'image': 'assets/images/Shiraz.jpg'},
    {'name': 'Yazd', 'image': 'assets/images/Yazd.jpg'},
    {'name': 'Tabriz', 'image': 'assets/images/Tabriz.jpg'},
  ];

  // Placeholder image list (Ensure you have images 1.jpg to 6.jpg or adjust)
  final List<String> _guideImages = List.generate(
    6,
    (index) => 'assets/images/${index + 1}.jpg',
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true, // Allows body content to go behind AppBar
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // Nice scroll physics
        slivers: [
          // --- Main App Bar with Background Image and Search ---
          SliverAppBar(
            expandedHeight: 300,
            floating: false, // App bar doesn't float
            pinned: true, // Search bar stays pinned
            stretch: true, // Allows stretch effect on overscroll
            backgroundColor: Colors.transparent, // Makes AppBar transparent
            elevation: 0,
            foregroundColor: Colors.white, // Icon/text color on AppBar
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  Image.asset(
                    'assets/images/iran 1.jpg', // Main background image
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback gradient if image fails
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              colorScheme.primary.withOpacity(0.8),
                              colorScheme.tertiary.withOpacity(0.6),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Dark Scrim for readability
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.6),
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                  // Optional Subtle Texture Overlay (Ensure 'assets/images/texture.png' exists or remove)
                  // Opacity(
                  //   opacity: 0.05,
                  //   child: Image.asset(
                  //     'assets/images/texture.png', // Replace with your texture image
                  //     fit: BoxFit.cover,
                  //     color: Colors.black87, colorBlendMode: BlendMode.screen,
                  //     errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                  //   ),
                  // ),
                  // Welcome Text Overlay
                  Positioned(
                    // Adjust positioning based on screen size/notch
                    top:
                        MediaQuery.of(context).padding.top +
                        kToolbarHeight, // Below status bar + appbar height
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.paddingLg,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discover Iran',
                            style: textTheme.displaySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppTheme.paddingSm),
                          Text(
                            'Find local guides to explore unique experiences',
                            style: textTheme.titleMedium?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.normal,
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ],
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true, // Keep collapsed title centered if needed
              titlePadding: const EdgeInsets.only(
                bottom: 60,
              ), // Ensure title doesn't overlap search
            ),
            // Enhanced Search Bar with Blur Backdrop
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(
                80.0,
              ), // Height for search bar area
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppTheme.paddingMd,
                  0,
                  AppTheme.paddingMd,
                  AppTheme.paddingMd,
                ),
                child: ClipRRect(
                  // Clip the blur effect
                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusXl),
                  child: BackdropFilter(
                    // Apply blur to background behind search bar
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      // Container to hold the SearchAnchor and apply background color
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          0.25,
                        ), // Translucent white background
                        borderRadius: BorderRadius.circular(
                          AppTheme.borderRadiusXl,
                        ),
                      ),
                      child: SearchAnchor(
                        builder: (
                          BuildContext context,
                          SearchController controller,
                        ) {
                          return SearchBar(
                            controller: controller,
                            padding: WidgetStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                horizontal: AppTheme.paddingMd,
                              ),
                            ),
                            onTap: () => controller.openView(),
                            onChanged: (_) => controller.openView(),
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.transparent,
                            ), // Make SearchBar transparent
                            elevation: WidgetStateProperty.all<double>(
                              0,
                            ), // No elevation needed
                            shadowColor: WidgetStateProperty.all<Color>(
                              Colors.transparent,
                            ), // No shadow
                            side: WidgetStateProperty.all<BorderSide>(
                              BorderSide.none,
                            ), // No border
                            leading: Icon(
                              Icons.search_rounded,
                              color: Colors.white70,
                            ),
                            hintText: 'Search guides, places...',
                            hintStyle: WidgetStateProperty.all<TextStyle>(
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                            ),
                            textStyle: WidgetStateProperty.all<TextStyle>(
                              TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: [
                              IconButton(
                                icon: Icon(
                                  Icons.tune_rounded,
                                  color: Colors.white,
                                ),
                                tooltip: 'Filters',
                                onPressed:
                                    () => _showFilterBottomSheet(context),
                              ),
                            ],
                          );
                        },
                        suggestionsBuilder: (
                          BuildContext context,
                          SearchController controller,
                        ) {
                          // Replace with actual search suggestion logic
                          final List<String> suggestions = [
                            'Historical Tours',
                            'Food Guides',
                            'Photography',
                            'Local Markets',
                            'Cultural Sites',
                          ];
                          return suggestions
                              .map(
                                (item) => ListTile(
                                  leading: const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  title: Text(item),
                                  onTap: () {
                                    setState(() {
                                      controller.closeView(item);
                                    });
                                    // Handle search submission
                                  },
                                ),
                              )
                              .toList();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // --- Welcome Header (Removed for cleaner look - info is in AppBar) ---
          // SliverToBoxAdapter(...)

          // --- Filter Pills Section ---
          SliverToBoxAdapter(child: _buildExpandableFilterSection(context)),

          // --- Popular Destinations Carousel ---
          _buildSectionHeader(
            context,
            'Popular Destinations',
            Icons.place_rounded,
            colorScheme.primary,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130, // Height for destination cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: _topDestinations.length,
                padding: const EdgeInsets.only(
                  left: AppTheme.paddingMd,
                  right: AppTheme.paddingMd / 2,
                  bottom: AppTheme.paddingSm,
                ), // Add bottom padding
                itemBuilder:
                    (context, index) => _buildDestinationCard(
                      context,
                      _topDestinations[index]['name']!,
                      _topDestinations[index]['image']!,
                    ),
              ),
            ),
          ),

          // --- Featured Guides Section ---
          _buildSectionHeader(
            context,
            'Featured Guides',
            Icons.star_rounded,
            colorScheme.secondary,
            actionLabel: 'View All',
            onActionTap: () {
              /* Navigate to all featured guides */
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 290, // Height for featured guide cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5, // Number of featured guides
                padding: const EdgeInsets.only(
                  left: AppTheme.paddingMd,
                  right: AppTheme.paddingMd / 2,
                ),
                itemBuilder:
                    (context, index) => _buildFeaturedGuideCard(
                      context,
                      index,
                      [
                        'Reza Ahmadi',
                        'Maryam Hosseini',
                        'Ali Moradi',
                        'Sara Kazemi',
                        'Amir Tehrani',
                      ][index],
                      _guideImages[index %
                          _guideImages
                              .length], // Cycle through placeholder images
                      4.8 + (index * 0.02),
                      [
                        'Historical Tours',
                        'Culinary Expert',
                        'Photography Guide',
                        'Art & Culture',
                        'Adventure Guide',
                      ][index],
                      'Tehran, Iran',
                    ),
              ),
            ),
          ),

          // --- Guides Near You Section (Grid) ---
          _buildSectionHeader(
            context,
            'Guides Near You',
            Icons.near_me_rounded,
            colorScheme.tertiary,
            actionLabel: 'See All',
            onActionTap: () {
              /* Navigate to all nearby guides */
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppTheme.paddingMd,
              0,
              AppTheme.paddingMd,
              AppTheme.paddingLg,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                childAspectRatio: 0.70, // Adjust aspect ratio for card content
                crossAxisSpacing: AppTheme.paddingMd,
                mainAxisSpacing: AppTheme.paddingMd,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildNearbyGuideCard(
                  context,
                  index,
                  [
                    'Parisa Mohammadi',
                    'Mohammad Rezaei',
                    'Zahra Karimi',
                    'Hamid Sadeghi',
                    'Fatemeh Akbari',
                    'Kaveh Rahimi',
                  ][index],
                  _guideImages[(index + 2) %
                      _guideImages.length], // Offset image cycle
                  4.5 + (index % 5) * 0.1,
                  [
                    'Shiraz, Iran',
                    'Isfahan, Iran',
                    'Yazd, Iran',
                    'Tehran, Iran',
                    'Tabriz, Iran',
                    'Isfahan, Iran',
                  ][index],
                  index % 3 == 0, // Availability example
                  ['Persian', 'English', 'Persian & English'][index %
                      3], // Language example
                ),
                childCount: 6, // Number of guides in grid
              ),
            ),
          ),

          // --- Trending Experiences Section ---
          _buildSectionHeader(
            context,
            'Trending Experiences',
            Icons.local_fire_department_rounded,
            colorScheme.secondary,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180, // Height for experience cards
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                padding: const EdgeInsets.only(
                  left: AppTheme.paddingMd,
                  right: AppTheme.paddingMd / 2,
                  bottom: AppTheme.paddingLg,
                ),
                itemBuilder:
                    (context, index) => _buildExperienceCard(
                      context,
                      [
                        'Historical Tours',
                        'Culinary Adventures',
                        'Nature Escapes',
                        'Architectural Wonders',
                        'Local Markets',
                      ][index],
                      _guideImages[(index + 4) %
                          _guideImages.length], // Offset image cycle again
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  // Builds Section Headers Consistently
  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
    Color iconColor, {
    String? actionLabel,
    VoidCallback? onActionTap,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppTheme.paddingMd,
          AppTheme.paddingLg,
          AppTheme.paddingMd,
          AppTheme.paddingMd,
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 26),
            const SizedBox(width: AppTheme.paddingSm),
            Expanded(
              // Allow title to take available space
              child: Text(
                title,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis, // Prevent overflow
              ),
            ),
            if (actionLabel != null)
              TextButton(
                onPressed: onActionTap ?? () {},
                child: Text(
                  actionLabel,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // NEW Helper Widget for Interactive Filter Chips
  Widget _buildInteractiveFilterChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      constraints: const BoxConstraints(
        minWidth: 120,
      ), // Set minimum width for consistency
      child: Material(
        color:
            isSelected
                ? colorScheme.primaryContainer.withOpacity(0.9)
                : colorScheme.surfaceContainerHighest.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
          side: BorderSide(
            color:
                isSelected
                    ? colorScheme.primary.withOpacity(0.5)
                    : colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor: colorScheme.primary.withOpacity(0.1),
          highlightColor: colorScheme.primary.withOpacity(0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal:
                  AppTheme.paddingMd + 8, // Increased horizontal padding
              vertical: AppTheme.paddingMd - 4, // Adjusted vertical padding
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? colorScheme.primary : colorScheme.primary,
                ),
                const SizedBox(width: AppTheme.paddingSm),
                Flexible(
                  child: Text(
                    label,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color:
                          isSelected
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Filter section widgets
  Widget _buildExpandableFilterSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 65,
          margin: const EdgeInsets.symmetric(vertical: AppTheme.paddingSm),
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingLg),
            physics: const BouncingScrollPhysics(),
            children:
                [
                      _buildInteractiveFilterChip(
                        context,
                        icon: Icons.location_city_rounded,
                        label: _selectedCity,
                        isSelected: _expandedFilter == 'city',
                        onTap:
                            () => setState(() {
                              _expandedFilter =
                                  _expandedFilter == 'city' ? null : 'city';
                            }),
                      ),
                      _buildInteractiveFilterChip(
                        context,
                        icon: Icons.calendar_today_rounded,
                        label:
                            _selectedArrivalDate != null
                                ? '${_selectedArrivalDate!.day}/${_selectedArrivalDate!.month}'
                                : 'Date',
                        isSelected: _expandedFilter == 'date',
                        onTap:
                            () => setState(() {
                              _expandedFilter =
                                  _expandedFilter == 'date' ? null : 'date';
                            }),
                      ),
                      _buildInteractiveFilterChip(
                        context,
                        icon: Icons.access_time_rounded,
                        label:
                            '$_selectedDays ${_selectedDays == 1 ? "Day" : "Days"}',
                        isSelected: _expandedFilter == 'duration',
                        onTap:
                            () => setState(() {
                              _expandedFilter =
                                  _expandedFilter == 'duration'
                                      ? null
                                      : 'duration';
                            }),
                      ),
                      _buildInteractiveFilterChip(
                        context,
                        icon: Icons.attach_money_rounded,
                        label: '\$${_priceRange.round()}+ / day',
                        isSelected: _expandedFilter == 'price',
                        onTap:
                            () => setState(() {
                              _expandedFilter =
                                  _expandedFilter == 'price' ? null : 'price';
                            }),
                      ),
                      _buildInteractiveFilterChip(
                        context,
                        icon: Icons.translate_rounded,
                        label: _selectedLanguage,
                        isSelected: _expandedFilter == 'language',
                        onTap:
                            () => setState(() {
                              _expandedFilter =
                                  _expandedFilter == 'language'
                                      ? null
                                      : 'language';
                            }),
                      ),
                    ]
                    .map(
                      (widget) => Padding(
                        padding: const EdgeInsets.only(
                          right: AppTheme.paddingMd,
                        ),
                        child: widget,
                      ),
                    )
                    .toList(),
          ),
        ),
        if (_expandedFilter != null)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppTheme.paddingLg),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusLg),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.paddingMd),
                child: _buildFilterOptions(context),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFilterOptions(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    switch (_expandedFilter) {
      case 'city':
        return Wrap(
          spacing: AppTheme.paddingSm,
          children:
              _cities
                  .map(
                    (city) => ChoiceChip(
                      label: Text(city),
                      selected: _selectedCity == city,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedCity = city;
                            _expandedFilter = null;
                          });
                        }
                      },
                    ),
                  )
                  .toList(),
        );

      case 'date':
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton.icon(
              icon: const Icon(Icons.calendar_today_rounded),
              label: Text(
                _selectedArrivalDate != null
                    ? '${_selectedArrivalDate!.day}/${_selectedArrivalDate!.month}/${_selectedArrivalDate!.year}'
                    : 'Select Date',
              ),
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedArrivalDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (picked != null) {
                  setState(() {
                    _selectedArrivalDate = picked;
                    _expandedFilter = null;
                  });
                }
              },
            ),
          ],
        );

      case 'duration':
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed:
                  _selectedDays > 1
                      ? () => setState(() => _selectedDays--)
                      : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.paddingMd,
              ),
              child: Text(
                '$_selectedDays ${_selectedDays == 1 ? "Day" : "Days"}',
                style: theme.textTheme.titleMedium,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed:
                  _selectedDays < 14
                      ? () => setState(() => _selectedDays++)
                      : null,
            ),
          ],
        );

      case 'price':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: _priceRange,
              min: 50,
              max: 500,
              divisions: 45,
              label: '\$${_priceRange.round()}',
              onChanged: (value) => setState(() => _priceRange = value),
            ),
            Text(
              'Minimum \$${_priceRange.round()} per day',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        );

      case 'language':
        return Wrap(
          spacing: AppTheme.paddingSm,
          children:
              _languages
                  .map(
                    (language) => ChoiceChip(
                      label: Text(language),
                      selected: _selectedLanguage == language,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedLanguage = language;
                            _expandedFilter = null;
                          });
                        }
                      },
                    ),
                  )
                  .toList(),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  // Builds Destination Cards for the Horizontal Carousel
  Widget _buildDestinationCard(
    BuildContext context,
    String name,
    String imageUrl,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: 100, // Width of destination card
      margin: const EdgeInsets.only(right: AppTheme.paddingSm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMd),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (ctx, err, st) =>
                            Container(color: colorScheme.surfaceContainerHighest),
                  ),
                  // Optional dark overlay
                  // Container(color: Colors.black.withOpacity(0.1)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppTheme.paddingSm / 2),
          Text(
            name,
            style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Builds Featured Guide Cards (Horizontal Scroll)
  Widget _buildFeaturedGuideCard(
    BuildContext context,
    int index,
    String name,
    String imageUrl,
    double rating,
    String specialty,
    String location,
  ) {
    // This widget seems mostly complete from the previous version, ensure styling is consistent
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final String heroTag = 'featured_guide_image_$index';

    return SizedBox(
      width: 240,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(
          right: AppTheme.paddingMd,
          bottom: AppTheme.paddingSm,
        ), // Add bottom margin too
        // Uses CardThemeData from AppTheme
        child: InkWell(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ViewGuideProfileScreen(guideName: name),
                ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Hero(
                  tag: heroTag,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter, // Center the head/face
                        errorBuilder:
                            (ctx, err, st) => Container(
                              color: colorScheme.surfaceContainerHighest,
                              child: Icon(
                                Icons.person_outline_rounded,
                                size: 60,
                                color: colorScheme.primary,
                              ),
                            ),
                      ),
                      DecoratedBox(
                        // Bottom Gradient
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                            stops: const [0.5, 1.0],
                          ),
                        ),
                      ),
                      Positioned(
                        // Rating Badge
                        top: AppTheme.paddingSm,
                        right: AppTheme.paddingSm,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.paddingSm,
                            vertical: AppTheme.paddingXs,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.secondary.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(
                              AppTheme.borderRadiusSm,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: colorScheme.onSecondary,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                rating.toStringAsFixed(1),
                                style: textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSecondary,
                                  letterSpacing: 0.3,
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
              // Text Content Area
              Padding(
                padding: const EdgeInsets.all(AppTheme.paddingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppTheme.paddingXs),
                    Text(
                      specialty,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppTheme.paddingSm),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppTheme.paddingXs),
                        Expanded(
                          child: Text(
                            location,
                            style: textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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

  // Builds Nearby Guide Cards for the Grid Layout
  Widget _buildNearbyGuideCard(
    BuildContext context,
    int index,
    String name,
    String imageUrl,
    double rating,
    String location,
    bool isAvailable,
    String language,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final String heroTag =
        'nearby_guide_grid_$index'; // Use different tag prefix for grid

    return Card(
      clipBehavior: Clip.antiAlias,
      // Uses CardThemeData
      child: InkWell(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ViewGuideProfileScreen(guideName: name),
              ),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            SizedBox(
              height: 130, // Adjust height for grid aspect ratio
              width: double.infinity,
              child: Hero(
                tag: heroTag,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter, // Center the head/face
                      errorBuilder:
                          (ctx, err, st) => Container(
                            color: colorScheme.surfaceContainerHighest,
                            child: Icon(
                              Icons.person_outline_rounded,
                              size: 50,
                              color: colorScheme.primary,
                            ),
                          ),
                    ),
                    // Optional subtle gradient if needed
                    // DecoratedBox(...)
                    Positioned(
                      // Rating Badge
                      bottom: AppTheme.paddingSm,
                      left: AppTheme.paddingSm,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.paddingSm,
                          vertical: AppTheme.paddingXs,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(
                            AppTheme.borderRadiusSm,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: Colors.yellow[600],
                            ),
                            const SizedBox(width: 2),
                            Text(
                              rating.toStringAsFixed(1),
                              style: textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.3,
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
            // Text Content Area
            Padding(
              padding: const EdgeInsets.all(
                AppTheme.paddingSm,
              ), // Reduced padding for grid card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ), // Smaller title
                  const SizedBox(height: AppTheme.paddingXs / 2),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: AppTheme.paddingXs),
                      Expanded(
                        child: Text(
                          location,
                          style: textTheme.bodySmall?.copyWith(fontSize: 11),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ), // Smaller body
                    ],
                  ),
                  const SizedBox(height: AppTheme.paddingXs),
                  Row(
                    children: [
                      Icon(
                        Icons.language_rounded,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: AppTheme.paddingXs),
                      Text(
                        language,
                        style: textTheme.bodySmall?.copyWith(fontSize: 11),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.paddingSm),
                  if (isAvailable) // Conditional Availability Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.paddingSm,
                        vertical: AppTheme.paddingXs / 2,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(
                          AppTheme.borderRadiusSm,
                        ),
                      ),
                      child: Text(
                        'Available Now',
                        style: textTheme.labelSmall?.copyWith(
                          color: colorScheme.onTertiaryContainer,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds Cards for Trending Experiences
  Widget _buildExperienceCard(
    BuildContext context,
    String title,
    String imageUrl,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: 160, // Width of experience card
      margin: const EdgeInsets.only(right: AppTheme.paddingMd),
      child: Card(
        clipBehavior: Clip.antiAlias,
        // Uses CardThemeData
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder:
                  (ctx, err, st) =>
                      Container(color: colorScheme.surfaceContainerHighest),
            ),
            // Gradient overlay for text
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: AppTheme.paddingSm,
              left: AppTheme.paddingSm,
              right: AppTheme.paddingSm,
              child: Text(
                title,
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Placeholder Functions for Filter Actions ---

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows taller bottom sheet
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.borderRadiusLg),
        ),
      ),
      builder: (context) {
        // TODO: Build the actual filter content here
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.paddingLg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filters', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: AppTheme.paddingMd),
              const Text('City: (Implement Dropdown/Search)'),
              const SizedBox(height: AppTheme.paddingSm),
              const Text('Date Range: (Implement Date Pickers)'),
              const SizedBox(height: AppTheme.paddingSm),
              const Text('Price Range: (Implement Slider)'),
              const SizedBox(height: AppTheme.paddingSm),
              const Text('Language: (Implement Selector)'),
              const SizedBox(height: AppTheme.paddingLg),
              Center(
                child: FilledButton(
                  onPressed: () => Navigator.pop(context), // Close bottom sheet
                  child: const Text('Apply Filters'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCityPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select City',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  [
                        'All Cities',
                        'Tehran',
                        'Isfahan',
                        'Shiraz',
                        'Yazd',
                        'Tabriz',
                      ]
                      .map(
                        (city) => ListTile(
                          title: Text(city),
                          selected: _selectedCity == city,
                          onTap: () {
                            setState(() => _selectedCity = city);
                            Navigator.pop(context);
                          },
                        ),
                      )
                      .toList(),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedArrivalDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ), // Allow booking up to a year ahead
    );
    if (picked != null && picked != _selectedArrivalDate) {
      setState(() {
        _selectedArrivalDate = picked;
      });
    }
  }

  void _showDurationPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int tempDays = _selectedDays;
        return AlertDialog(
          title: Text(
            'Select Duration',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: StatefulBuilder(
            builder:
                (context, setState) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed:
                          tempDays > 1
                              ? () => setState(() => tempDays--)
                              : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.paddingMd,
                      ),
                      child: Text(
                        '$tempDays ${tempDays == 1 ? "Day" : "Days"}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed:
                          tempDays < 14
                              ? () => setState(() => tempDays++)
                              : null,
                    ),
                  ],
                ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                setState(() => _selectedDays = tempDays);
                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  void _showPriceRangePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double tempPrice = _priceRange;
        return AlertDialog(
          title: Text(
            'Price Range',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: StatefulBuilder(
            builder:
                (context, setState) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Slider(
                      value: tempPrice,
                      min: 50,
                      max: 500,
                      divisions: 45,
                      label: '\$${tempPrice.round()}',
                      onChanged: (value) => setState(() => tempPrice = value),
                    ),
                    Text(
                      'Minimum \$${tempPrice.round()} per day',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                setState(() => _priceRange = tempPrice);
                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final languages = [
      'Any',
      'Persian',
      'English',
      'Arabic',
      'French',
      'German',
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Language',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  languages
                      .map(
                        (language) => ListTile(
                          title: Text(language),
                          selected: _selectedLanguage == language,
                          onTap: () {
                            setState(() => _selectedLanguage = language);
                            Navigator.pop(context);
                          },
                        ),
                      )
                      .toList(),
            ),
          ),
        );
      },
    );
  }
}
