import 'package:flutter/material.dart';
import '../models/pictures_model.dart';
import '../services/pictures_service.dart';

class PicturesPage extends StatefulWidget{
  const PicturesPage({super.key});

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  // instance of class Service
  PicturesService service = PicturesService();
  // Future to hold pic url
  late Future<PictureModel> pictureFuture;

  @override
  void initState() {
    super.initState();
    // Call api on widget refresh and init picFuture
    pictureFuture = service.fetchPicture();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pictures and Laughs'),),
      body: FutureBuilder(
        future: pictureFuture, 
        builder: (context, snapshot) {
          // Loading State
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error state
          if(snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // No data returned state
          if(!snapshot.hasData) {
            return const Center(
              child: Text('Error: Snapshot has no data!'),
            );
          }

          // success state
          final picture = snapshot.data!;

          return Center(
            child: Column(
              children: [
                Image.network(picture.message),
              ],
            ),
          );
        }
      ),
    );
  }
}