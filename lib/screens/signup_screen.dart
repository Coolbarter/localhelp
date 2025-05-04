import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart'
    as ThemeAlias; // Adjust import if needed
import 'login_screen.dart';
import 'main_navigation_screen.dart'; // Assuming this is the destination after signup

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _selectedUserType = 'Tourist'; // Default selection

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: colorScheme.onSurface),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Signuppage.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: colorScheme.surface);
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.surface.withOpacity(0.85),
                  colorScheme.surface.withOpacity(0.95),
                ],
                stops: const [0.0, 0.7],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                ThemeAlias.AppTheme.paddingLg,
                AppTheme.paddingSm,
                AppTheme.paddingLg,
                AppTheme.paddingLg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Your Account',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppTheme.paddingLg * 1.5),

                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                  ),
                  const SizedBox(height: AppTheme.paddingMd),

                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: AppTheme.paddingMd),

                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                  ),
                  const SizedBox(height: AppTheme.paddingLg),

                  Text(
                    'Select Your Role:',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: AppTheme.paddingSm),

                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: 'Tourist',
                        label: Text('Tourist'),
                        icon: Icon(Icons.luggage_outlined),
                      ),
                      ButtonSegment(
                        value: 'Local Guide',
                        label: Text('Local Guide'),
                        icon: Icon(Icons.flag_outlined),
                      ),
                    ],
                    selected: {_selectedUserType},
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(() {
                        _selectedUserType = newSelection.first;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return colorScheme.primaryContainer;
                        }
                        return colorScheme.surfaceContainerHighest;
                      }),
                    ),
                  ),

                  const SizedBox(height: AppTheme.paddingLg * 1.5),

                  FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainNavigationScreen(),
                        ),
                      );
                    },
                    child: const Text('Create Account'),
                  ),

                  const SizedBox(height: AppTheme.paddingMd),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            ),
                        child: const Text('Log In'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
