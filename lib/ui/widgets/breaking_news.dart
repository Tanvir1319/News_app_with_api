import 'package:fake_news_app_api/models/news_model.dart';
import 'package:fake_news_app_api/services/api_service.dart';
import 'package:fake_news_app_api/ui/widgets/news_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getBreakingNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articlelist = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItemList(
                    newsModel: articlelist[index],
                  );
                },
                itemCount: articlelist.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          ),
    );
  }
}
