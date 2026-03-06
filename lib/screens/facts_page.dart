import 'package:flutter/material.dart';

class FactsPage extends StatefulWidget{
  const FactsPage({super.key});

  @override
  State<FactsPage> createState() => _FactsPageState();
}

class _FactsPageState extends State<FactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facts and Laughs'),),
      body: Center(child: Text('Jokes')),
    );
  }
}