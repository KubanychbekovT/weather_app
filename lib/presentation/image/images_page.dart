import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:weather/presentation/story/widgets/stories.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com';
  final String quoteApiUrl = 'https://api.quotable.io/random';

  Random random = Random();
  List<Map<String, dynamic>> posts = [];
  String quote = '';

  @override
  void initState() {
    super.initState();
    fetchPosts();
    fetchQuote();
  }

  Future<String> fetchQuote() async {
    final response = await http.get(Uri.parse(quoteApiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String quote = data['content'];
      setState(() {
        this.quote = quote;
      });
      return quote;
    } else {
      throw Exception('Failed to fetch quote');
    }
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$apiUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        posts = data.cast<Map<String, dynamic>>();
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
            const StoriesWidget(),
            for (final post in posts) ...[
              buildPublication(post),
              const SizedBox(height: 12),
              buildLikesAndComments(post),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildPublication(Map<String, dynamic> post) {
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
                    image: NetworkImage(
                        'https://picsum.photos/seed/${post['id']}/40/40'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  post['title'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
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
              image:
                  NetworkImage('https://picsum.photos/seed/${post['id']}/400'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 32,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.mode_comment_outlined,
                    size: 32,
                  ),
                  SizedBox(width: 20),
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
                  style: const TextStyle(
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
                const TextSpan(
                  text: 'Author: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: quote,
                  style: const TextStyle(
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

  Widget buildLikesAndComments(Map<String, dynamic> post) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'View all comments (${random.nextInt(500)})',
            style: const TextStyle(
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
