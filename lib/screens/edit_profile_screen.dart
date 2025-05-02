import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isGuide = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Picture
          Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                      width: 4,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/face.jpg'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: theme.colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        // TODO: Implement image picker
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Basic Info Fields
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Bio',
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Languages Section
          Text(
            'Languages Spoken',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              InputChip(
                label: const Text('English'),
                onDeleted: () {
                  // TODO: Remove language
                },
              ),
              InputChip(
                label: const Text('Spanish'),
                onDeleted: () {
                  // TODO: Remove language
                },
              ),
              ActionChip(
                label: const Text('+ Add Language'),
                onPressed: () {
                  // TODO: Show language picker
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Guide-specific Fields
          if (isGuide) ...[
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Guide Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Date of Birth'),
              subtitle: const Text('January 1, 1990'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () {
                // TODO: Show date picker
              },
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Availability Notes',
                hintText: 'e.g., Available weekends and evenings',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Verification Sections
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.verified_user),
                        const SizedBox(width: 8),
                        Text(
                          'Identity Verification',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Status: Pending'),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      onPressed: () {
                        // TODO: Implement ID upload
                      },
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Upload ID'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.family_restroom),
                        const SizedBox(width: 8),
                        Text(
                          'Parental Consent',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Status: Not Submitted'),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      onPressed: () {
                        // TODO: Implement form upload
                      },
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Upload Form'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
