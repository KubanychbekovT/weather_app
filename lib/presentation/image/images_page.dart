import 'package:flutter/material.dart';
import 'package:weather/presentation/story/widgets/stories.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  List<ImageData> images = [
    ImageData(
      imageUrl: 'assets/posts/sun.jpg',
      description: 'Sunny or clear means there are no clouds in the sky, and cloudy means the entire sky is covered by clouds. One of the most misused weather terms is "fair." The NWS uses "fair," typically at night, to describe less than 3/8 cloud cover, with no precipitation and no extremes of visibility, temperature or winds.',
      ),
    ImageData(
      imageUrl: 'assets/posts/rain.jpg',
      description: 'Rain is liquid precipitation: water falling from the sky. Raindrops fall to Earth when clouds become saturated, or filled, with water droplets. Millions of water droplets bump into each other as they gather in a cloud. When a small water droplet bumps into a bigger one, it condenses, or combines, with the larger one.',
    ),
    ImageData(
      imageUrl: 'assets/posts/snow.jpg',
      description: 'Snow is precipitation that forms when water vapor freezes. Snow falls as ice crystals from clouds when temperatures drop below freezing and there is enough humidity in the air.',
    ),
    ImageData(
      imageUrl: 'assets/posts/wind.jpg',
      description: 'Wind is the movement of air from an area of high pressure to an area of low pressure. In fact, wind exists because the sun unevenly heats the surface of the Earth. As hot air rises, cooler air moves in to fill the void. As long as the sun shines, the wind will blow.',
    ),
    ImageData(
      imageUrl: 'assets/posts/storm.jpg',
      description: 'Storms are raging atmospheric disturbance that is characterized by cloud cover, low barometric pressure, precipitation, and also with wild winds. They are also coupled with thunder and lightning. The cause of the storm is the moisture content in the air.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stories',
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
          StoriesWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                final imageData = images[index];
                return Column(
                  children: [
                    SizedBox(height: 16),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageData.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      imageData.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}

class ImageData {
  final String imageUrl;
  final String description;

  ImageData({
    required this.imageUrl,
    required this.description,
  });
}
