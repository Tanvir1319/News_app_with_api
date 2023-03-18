import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_news_app_api/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({
    super.key,
    required this.newsModel,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.toString()),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            height: 250,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: widget.newsModel.urlToImage.toString(),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(widget.newsModel.source!.name.toString()),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
              ),
              Text(widget.newsModel.publishedAt.toString()),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(widget.newsModel.author == null
              ? ""
              : " Written By " + widget.newsModel.author.toString()),
          SizedBox(
            height: 12,
          ),
          Text(widget.newsModel.title.toString()),
          SizedBox(
            height: 12,
          ),
          Divider(
            thickness: 3.0,
          ),
          Text(widget.newsModel.description.toString()),
          SizedBox(
            height: 12,
          ),
          Divider(
            color: Colors.grey,
          ),
          ElevatedButton(
            onPressed: () async {
              final Uri uri = Uri.parse(widget.newsModel.url.toString());
              if (!await launchUrl(uri)) {
                throw Exception('Could not found');
              }
            },
            child: Text("Read More"),
          ),
        ],
      ),
    );
  }
}
