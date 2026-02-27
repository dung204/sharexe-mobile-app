import 'package:flutter/material.dart';
import 'package:sharexe/generated/assets/assets.gen.dart';
import 'package:sharexe/presentation/modules/auth/widgets/sign_in_form.dart';
import 'package:sharexe/presentation/modules/auth/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final borderColor =
        theme.inputDecorationTheme.enabledBorder?.borderSide.color;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenSize.height * 0.45,
            color: colorScheme.primary,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Assets.images.citySilhouette.image(
                    fit: BoxFit.contain,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo
                  Expanded(
                    flex: 11,
                    child: SizedBox(
                      width: 120,
                      height: 127,
                      child: Assets.images.appLogoWithShadow.image(),
                    ),
                  ),

                  // Tabbed Form Card
                  Expanded(
                    flex: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.cardTheme.color,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          if (theme.brightness == Brightness.light)
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: borderColor ?? Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              labelColor: colorScheme.primary,
                              unselectedLabelColor: theme.unselectedWidgetColor,
                              indicatorColor: colorScheme.primary,
                              labelStyle: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              tabs: const [
                                Tab(text: 'Sign Up'),
                                Tab(text: 'Sign In'),
                              ],
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                  color: colorScheme.primary,
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                insets: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                              dividerColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),

                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: SignUpForm(),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: SignInForm(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Google Sign-In Button
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // TODO: Implement Google sign-in
                            },
                            icon: Assets.images.googleLogo.image(width: 18),
                            label: const Text('Continue with Google'),
                          ),
                        ),
                        Text(
                          'By clicking start, you agree to our Terms and Conditions',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
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
