import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharexe/configs/router/app_router.dart';
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
    return BlocProvider(
      create: (_) => getIt<OnboardingCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder(
            builder: (context, currentIndex) {
              final cubit = context.read<OnboardingCubit>();
              final isLastPage = currentIndex == _items.length - 1;

              return Column(
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
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Image.asset(item.imagePath),
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
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      item.description,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        height: 1.5,
                                      ),
                                    ),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
                    child: Column(
                      children: [
                        // The indicator
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: _items.length,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: Color(0xFF40D6AC),
                            dotColor: Color(0xFFE0E0E0),
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Get started button - only available in last page
                        if (isLastPage)
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                await cubit.completeOnboarding();
                                if (context.mounted) context.go(AppRoutes.home);
                              },
                              child: const Text(
                                'GET STARTED!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
