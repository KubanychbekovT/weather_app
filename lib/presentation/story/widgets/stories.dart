import 'package:flutter/material.dart';
import 'package:weather/presentation/story/story_page.dart';
import 'package:weather/presentation/story/widgets/stories_circle.dart';

class StoriesWidget extends StatefulWidget {
  const StoriesWidget({super.key});

  @override
  State<StoriesWidget> createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {

  void _openStory() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage(),));
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return StoryCircle(
                function: _openStory,
              );
            },),
        )
      ],
    );
  }
}