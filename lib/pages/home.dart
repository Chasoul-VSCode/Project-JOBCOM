import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12), // Reduced padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8), // Reduced radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3, // Reduced blur
                    offset: const Offset(0, 1), // Reduced offset
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search jobs, companies...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey.shade600, size: 20), // Reduced icon size
                  suffixIcon: Icon(Icons.tune, color: Colors.grey.shade600, size: 20), // Reduced icon size
                ),
              ),
            ),

            const SizedBox(height: 16), // Reduced spacing

            // Featured Jobs Section
            const Text(
              'Featured Jobs',
              style: TextStyle(
                fontSize: 16, // Reduced font size
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12), // Reduced spacing
            SizedBox(
              height: 160, // Reduced height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 240, // Reduced width
                    margin: const EdgeInsets.only(right: 12), // Reduced margin
                    padding: const EdgeInsets.all(12), // Reduced padding
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade400,
                          Colors.purple.shade400,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12), // Reduced radius
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6), // Reduced padding
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6), // Reduced radius
                              ),
                              child: Image.network(
                                'https://picsum.photos/32/32', // Reduced image size
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(width: 8), // Reduced spacing
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Senior Flutter Developer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14, // Reduced font size
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Tech Corp Inc.',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12, // Reduced font size
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12), // Reduced spacing
                        Row(
                          children: [
                            _buildJobDetail(Icons.location_on_outlined, 'Remote'),
                            const SizedBox(width: 12), // Reduced spacing
                            _buildJobDetail(Icons.work_outline, 'Full-time'),
                          ],
                        ),
                        const SizedBox(height: 6), // Reduced spacing
                        Row(
                          children: [
                            _buildJobDetail(Icons.payments_outlined, '\$80k-120k/year'),
                            const SizedBox(width: 12), // Reduced spacing
                            _buildJobDetail(Icons.timer_outlined, '2 days ago'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16), // Reduced spacing

            // Recent Jobs Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Jobs',
                  style: TextStyle(
                    fontSize: 16, // Reduced font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All', style: TextStyle(fontSize: 12)), // Reduced font size
                ),
              ],
            ),
            const SizedBox(height: 12), // Reduced spacing
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8), // Reduced margin
                  elevation: 1, // Reduced elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Reduced radius
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12), // Reduced padding
                    leading: Container(
                      padding: const EdgeInsets.all(6), // Reduced padding
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6), // Reduced radius
                      ),
                      child: Image.network(
                        'https://picsum.photos/32/32', // Reduced image size
                        width: 32,
                        height: 32,
                      ),
                    ),
                    title: const Text(
                      'UI/UX Designer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14, // Reduced font size
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Design Studio Ltd', style: TextStyle(fontSize: 12)), // Reduced font size
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            _buildJobTag('Full-time'),
                            const SizedBox(width: 6), // Reduced spacing
                            _buildJobTag('Remote'),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.bookmark_border, size: 20), // Reduced icon size
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 14), // Reduced icon size
        const SizedBox(width: 2), // Reduced spacing
        Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 10, // Reduced font size
          ),
        ),
      ],
    );
  }

  Widget _buildJobTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(3), // Reduced radius
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue.shade700,
          fontSize: 10, // Reduced font size
        ),
      ),
    );
  }
}
