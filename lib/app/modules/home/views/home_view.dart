import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momagictask/app/core/theme/theme_controller.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/section_title.dart';
import '../widgets/game_card.dart';
import '../widgets/subscription_card.dart';
import '../widgets/social_community_banner.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Symphony',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(CupertinoIcons.list_dash),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Get.theme.primaryColor,
              child: SafeArea(
                bottom: false,
                child: Row(
                  children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                       child: Text(
                        'My Symphony',
                        style: TextStyle(
                          color: Get.theme.textTheme.headlineMedium?.color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                                           ),
                     ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: Get.find<ThemeController>().isDarkMode,
                onChanged: (value) => Get.find<ThemeController>().toggleTheme(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/b1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Support Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/b3.png',
              ),
            ),
            // Trending Items Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trending items',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(controller.trendingItems.length,
                          (index) {
                        return _buildTrendingItem(
                            controller.trendingItems[index]['title'] ?? '',
                            controller.trendingItems[index]['imagePath'] ?? '');
                      }),
                    ),
                  ),
                ],
              ),
            ),
            // Entertainment Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Entertainment',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ent.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: SubscriptionCard(
                title: 'Helio 50',
                validDays: '406',
                expiryDate: 'December 10, 2024',
                onTap: () {},
              ),
            ),
            // Games Section

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                    title: 'Games',
                    onSeeMore: () {},
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GameCard(
                          imagePath: 'assets/images/g1.png',
                          onTap: () {},
                        ),
                        GameCard(
                          imagePath: 'assets/images/g2.png',
                          onTap: () {},
                        ),
                        GameCard(
                          imagePath: 'assets/images/g3.png',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Social Community Banner
            SocialCommunityBanner(
              onTap: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }



  Widget _buildTrendingItem(String title, String imagePath) {
    return Card(
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 100, // Adjust height for the image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
