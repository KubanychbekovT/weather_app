import 'package:flutter/material.dart';
import 'package:weather/presentation/story/widgets/stories.dart';
import 'dart:math';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final List<String> images = [
    'assets/posts/snow.jpg',
    'assets/posts/rain.jpg',
    'assets/posts/sun.jpg',
  ];

  final List<String> profileImages = [
    'assets/posts/plant.jpg',
    'assets/posts/storm.jpg',
    'assets/posts/wind.jpg',
  ];

  final List<String> profileNames = [
    'weatherlover',
    'nature.republic.kyrgyzstan',
    'weather_enthusiast',
  ];

  final List<String> quotes = [
    'Enjoying the snowy weather!',
    'Rain reminds all things to grow.',
    'Embracing the sunny days!',
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weather',
                        style: TextStyle(
                          color: Color(0xff3d4a73),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            StoriesWidget(),
            // const Divider(color: Colors.white.withOpacity(0.3)),
            for (int i = 0; i < images.length; i++) ...[
              buildPublication(images[i], i),
              const SizedBox(height: 12),
              buildLikesAndComments(),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildPublication(String imagePath, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        AssetImage(profileImages[index % profileImages.length]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                profileNames[index % profileNames.length],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 32,
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    Icons.mode_comment_outlined,
                    size: 32,
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    Icons.near_me_outlined,
                    size: 32,
                  ),
                ],
              ),
              Icon(
                Icons.bookmark_border,
                size: 32,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Likes: ${random.nextInt(5000)} ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: profileNames[index % profileNames.length] + ' ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: quotes[index % quotes.length],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLikesAndComments() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'View all comments (${random.nextInt(500)})',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
