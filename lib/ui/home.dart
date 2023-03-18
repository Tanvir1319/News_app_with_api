import 'package:fake_news_app_api/ui/widgets/all_news.dart';
import 'package:fake_news_app_api/ui/widgets/breaking_news.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Fake News App'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Breaking',),
              Tab(text: 'All News',),
            ]),
        ),
        body:TabBarView(
          children: [
            BreakingNews(),
            AllNews(),
          ],
        ) ,
      ),
    );
  }
}