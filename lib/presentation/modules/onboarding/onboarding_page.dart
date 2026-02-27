import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharexe/configs/router/app_router.dart';
import 'package:sharexe/configs/theme/app_styles.dart';
import 'package:sharexe/core/di/injection.dart';
import 'package:sharexe/generated/assets/assets.gen.dart';
import 'package:sharexe/presentation/modules/onboarding/cubit/onboarding_cubit.dart';
import 'package:sharexe/presentation/modules/onboarding/models/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  final List<OnboardingItem> _items = [
    OnboardingItem(
      imagePath: Assets.images.onboarding1.path,
      title: 'Request Ride',
      description: 'Request a ride get picked up by a nearby community driver',
    ),
    OnboardingItem(
      imagePath: Assets.images.onboarding2.path,
      title: 'Confirm Your Driver',
      description:
          'Huge drivers network helps you find comfortable, safe and cheap ride',
    ),
    OnboardingItem(
      imagePath: Assets.images.onboarding3.path,
      title: 'Track your ride',
      description:
          'Know your driver in advance and be able to view current location in real time on the map',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return BlocProvider(
      create: (_) => getIt<OnboardingCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, int>(
            builder: (context, currentIndex) {
              final cubit = context.read<OnboardingCubit>();
              final isLastPage = currentIndex == _items.length - 1;
              final screenWidth = MediaQuery.of(context).size.width;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  children: [
                    // PageView - the sliding part
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _items.length,
                        onPageChanged: cubit.onPageChanged,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image (50% of the screen)
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Image.asset(
                                    item.imagePath,
                                    width: screenWidth * 0.8,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              // Text
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        item.title,
                                        style: textTheme.headlineSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        item.description,
                                        textAlign: TextAlign.center,
                                        style: textTheme.bodyLarge,
                                      ),
                                      const Spacer(),

                                      AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        child: isLastPage
                                            ? SizedBox(
                                                width: 190,
                                                height: 50,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    await cubit
                                                        .completeOnboarding();
                                                    if (context.mounted) {
                                                      context.go(
                                                        AppRoutes.auth,
                                                      );
                                                    }
                                                  },
                                                  child: const Text(
                                                    'GET STARTED!',
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 50,
                                                child: TextButton(
                                                  onPressed: () => {
                                                    _pageController.nextPage(
                                                      duration: const Duration(
                                                        milliseconds: 300,
                                                      ),
                                                      curve: Curves.easeInOut,
                                                    ),
                                                  },
                                                  style:
                                                      TextButton.styleFrom(
                                                        shape:
                                                            const CircleBorder(),
                                                      ).merge(
                                                        AppStyles
                                                            .button
                                                            .iconPrimary,
                                                      ),
                                                  child: const Icon(
                                                    Icons.arrow_forward_ios,
                                                  ),
                                                ),
                                              ),
                                      ),

                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // Footer (Indicator + Button)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // The indicator
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: _items.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: colorScheme.primary,
                            dotColor: theme.brightness == Brightness.dark
                                ? Colors.grey.shade700
                                : Colors.grey.shade200,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
