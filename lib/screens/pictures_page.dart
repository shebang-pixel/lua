import 'package:flutter/material.dart';

class PicturesPage extends StatefulWidget{
  const PicturesPage({super.key});

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pictures and Laughs'),),
      body: Center(child: Text('Jokes')),
    );
  }
}