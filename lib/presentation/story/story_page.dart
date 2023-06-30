import 'package:flutter/material.dart';
import 'package:weather/presentation/story/stories/story_1.dart';
import 'package:weather/presentation/story/stories/story_2.dart';
import 'package:weather/presentation/story/stories/story_3.dart';
import 'package:weather/presentation/story/widgets/progress_bar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> myStories = [
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];

  double totalPercentWatched = 0;

  @override
  void initState() {
    super.initState();
  }

  void _goToNextStory() {
    if (currentStoryIndex < myStories.length - 1) {
      setState(() {
        currentStoryIndex++;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 2) {
      setState(() {
        if (currentStoryIndex > 0) {
          currentStoryIndex--;
        }
      });
    } else {
      _goToNextStory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      child: Scaffold(
        body: Stack(
          children: [
            myStories[currentStoryIndex],
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MyProgressBar(percentWatched: totalPercentWatched),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: Opacity(
                  opacity: 0.5,
                  child: GestureDetector(
                    onTap: _goToNextStory,
                    behavior: HitTestBehavior.translucent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
