import 'package:flutter/material.dart';
import '../auth/login.dart';
import '../auth/register.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _loginButtonAnimation;
  late Animation<double> _registerButtonAnimation;

  final List<Map<String, dynamic>> _features = [
    {
      'icon': Icons.work_outline,
      'title': 'Thousands of Jobs',
      'description': 'Access job opportunities from top companies worldwide.',
      'gradient': [Colors.blue.shade400, Colors.blue.shade600],
    },
    {
      'icon': Icons.person_outline,
      'title': 'Professional Profile',
      'description': 'Create an impressive profile to get noticed by recruiters.',
      'gradient': [Colors.purple.shade400, Colors.purple.shade600],
    },
    {
      'icon': Icons.trending_up,
      'title': 'Career Growth',
      'description': 'Access tools and resources to accelerate your career growth.',
      'gradient': [Colors.deepPurple.shade400, Colors.deepPurple.shade600],
    },
    {
      'icon': Icons.school_outlined,
      'title': 'Learning Platform',
      'description': 'Access courses and certifications to enhance your skills.',
      'gradient': [Colors.orange.shade400, Colors.deepOrange.shade600],
    },
    {
      'icon': Icons.people_outline,
      'title': 'Networking',
      'description': 'Connect with professionals and expand your network.',
      'gradient': [Colors.teal.shade400, Colors.teal.shade600],
    },
    {
      'icon': Icons.analytics_outlined,
      'title': 'Career Analytics',
      'description': 'Track your progress and get insights about your career path.',
      'gradient': [Colors.indigo.shade400, Colors.indigo.shade600],
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    ));

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    _loginButtonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
    ));

    _registerButtonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.7, 0.9, curve: Curves.easeOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner Section with Animated Background
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: MediaQuery.of(context).size.height * 0.45, // Reduced height
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.shade600,
                      Colors.purple.shade600,
                      Colors.deepPurple.shade500,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Animated Decorative Elements
                    ...List.generate(5, (index) {
                      return Positioned(
                        top: index * 40.0, // Reduced spacing
                        right: index * 25.0, // Reduced spacing
                        child: AnimatedBuilder(
                          animation: _rotateAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _rotateAnimation.value,
                              child: Container(
                                width: 60 - (index * 10), // Reduced size
                                height: 60 - (index * 10), // Reduced size
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.15 - (index * 0.02)),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                    width: 1, // Reduced border width
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    
                    // Banner Content with Animations
                    Padding(
                      padding: const EdgeInsets.all(16.0), // Reduced padding
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ScaleTransition(
                                scale: _scaleAnimation,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Find Your',
                                      style: TextStyle(
                                        fontSize: 24, // Reduced font size
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Text(
                                      'Dream Job',
                                      style: TextStyle(
                                        fontSize: 36, // Reduced font size
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12), // Reduced spacing
                              Text(
                                'Connect with top companies and unlock endless opportunities for your career growth',
                                style: TextStyle(
                                  fontSize: 14, // Reduced font size
                                  color: Colors.white.withOpacity(0.9),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 24), // Reduced spacing
                              Row(
                                children: [
                                  Expanded(
                                    child: ScaleTransition(
                                      scale: _loginButtonAnimation,
                                      child: _buildAnimatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                var begin = const Offset(0.0, 1.0);
                                                var end = Offset.zero;
                                                var curve = Curves.easeInOut;
                                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                                var offsetAnimation = animation.drive(tween);

                                                return SlideTransition(
                                                  position: offsetAnimation,
                                                  child: FadeTransition(
                                                    opacity: animation,
                                                    child: child,
                                                  ),
                                                );
                                              },
                                              transitionDuration: const Duration(milliseconds: 800),
                                            ),
                                          );
                                        },
                                        text: 'Sign In',
                                        isPrimary: true,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12), // Reduced spacing
                                  Expanded(
                                    child: ScaleTransition(
                                      scale: _registerButtonAnimation,
                                      child: _buildAnimatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation, secondaryAnimation) => const RegisterPage(),
                                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                var begin = const Offset(1.0, 0.0);
                                                var end = Offset.zero;
                                                var curve = Curves.easeInOut;
                                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                                var offsetAnimation = animation.drive(tween);

                                                return SlideTransition(
                                                  position: offsetAnimation,
                                                  child: ScaleTransition(
                                                    scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                                                    child: child,
                                                  ),
                                                );
                                              },
                                              transitionDuration: const Duration(milliseconds: 800),
                                            ),
                                          );
                                        },
                                        text: 'Register',
                                        isPrimary: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Statistics Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0), // Reduced padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatistic('1M+', 'Active Users'),
                    _buildStatistic('50K+', 'Companies'),
                    _buildStatistic('100K+', 'Job Posts'),
                    _buildStatistic('200+', 'Countries'),
                  ],
                ),
              ),

              // Information Section with Staggered Animations
              Padding(
                padding: const EdgeInsets.all(14.0), // Reduced padding
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12, // Reduced spacing
                    mainAxisSpacing: 12, // Reduced spacing
                    childAspectRatio: 0.58,
                  ),
                  itemCount: _features.length,
                  itemBuilder: (context, index) {
                    return _buildAnimatedInfoCard(
                      delay: index * 0.1,
                      icon: _features[index]['icon'],
                      title: _features[index]['title'],
                      description: _features[index]['description'],
                      gradient: _features[index]['gradient'],
                    );
                  },
                ),
              ),

              // Testimonials Section
              Container(
                padding: const EdgeInsets.all(16.0), // Reduced padding
                color: Colors.white,
                child: Column(
                  children: [
                    const Text(
                      'What Our Users Say',
                      style: TextStyle(
                        fontSize: 20, // Reduced font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16), // Reduced spacing
                    SizedBox(
                      height: 180, // Reduced height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return _buildTestimonialCard();
                        },
                      ),
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

  Widget _buildStatistic(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20, // Reduced font size
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12, // Reduced font size
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialCard() {
    return Container(
      width: 260, // Reduced width
      margin: const EdgeInsets.only(right: 12), // Reduced margin
      padding: const EdgeInsets.all(12), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20, // Reduced size
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person, color: Colors.grey.shade400, size: 20),
              ),
              const SizedBox(width: 8), // Reduced spacing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Reduced font size
                    ),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12, // Reduced font size
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12), // Reduced spacing
          Text(
            '"This platform helped me find my dream job! The process was smooth and the support team was amazing."',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12, // Reduced font size
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedButton({
    required VoidCallback onPressed,
    required String text,
    required bool isPrimary,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isPrimary ? Colors.white : Colors.transparent,
            foregroundColor: isPrimary ? Colors.blue.shade600 : Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Reduced padding
            side: isPrimary ? null : const BorderSide(color: Colors.white, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: isPrimary ? 3 : 0,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14, // Reduced font size
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedInfoCard({
    required double delay,
    required IconData icon,
    required String title,
    required String description,
    required List<Color> gradient,
  }) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double opacity = _controller.value > delay
            ? (((_controller.value - delay) / (1 - delay)).clamp(0.0, 1.0))
            : 0.0;
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - opacity)),
            child: Container(
              padding: const EdgeInsets.all(16), // Reduced padding
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: gradient[0].withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8), // Reduced padding
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 24, // Reduced size
                    ),
                  ),
                  const SizedBox(height: 12), // Reduced spacing
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16, // Reduced font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6), // Reduced spacing
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12, // Reduced font size
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
