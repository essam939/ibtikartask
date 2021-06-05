import 'package:flutter/material.dart';
import 'package:ibtikartask/model/home_model.dart';
import 'package:ibtikartask/services/services.dart';
import 'package:image_downloader/image_downloader.dart';

class DetailsScreen extends StatefulWidget {
final Results results;
  const DetailsScreen({required this.results});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
          body: Center(
            child: Container(
              child: ListView(
                children: [
                  Image.network("$imagePath${widget.results.posterPath}"),
                  ElevatedButton(onPressed: ()async{
                  await  ImageDownloader.downloadImage("$imagePath${widget.results.posterPath}");
                  }, child: Text("download Image")),
                  Center(child: Text("${widget.results.overview}",style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ),
    );
  }
}
