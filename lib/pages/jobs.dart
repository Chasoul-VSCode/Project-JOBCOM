import 'package:flutter/material.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80, // Reduced height
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.shade600,
                      Colors.purple.shade600,
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Applied Jobs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Reduced font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0), // Reduced padding
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 6), // Reduced margin
                    elevation: 1,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8), // Reduced padding
                      leading: Container(
                        padding: const EdgeInsets.all(4), // Reduced padding
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(4), // Reduced radius
                        ),
                        child: Image.network(
                          'https://picsum.photos/32/32', // Reduced image size
                          width: 32,
                          height: 32,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Software Engineer ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14, // Reduced font size
                            ),
                          ),
                          const SizedBox(height: 2), // Reduced spacing
                          Text(
                            'Tech Company ${index + 1}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12, // Reduced font size
                            ),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4), // Reduced padding
                        child: Row(
                          children: [
                            _buildStatusChip('Applied', Colors.blue),
                            const SizedBox(width: 4), // Reduced spacing
                            Text(
                              '2 days ago',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 10, // Reduced font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.more_vert, size: 18), // Reduced icon size
                        onPressed: () {
                          // Show options menu
                        },
                      ),
                    ),
                  );
                },
                childCount: 10, // Number of applied jobs
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), // Reduced padding
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8), // Reduced radius
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10, // Reduced font size
        ),
      ),
    );
  }
}
