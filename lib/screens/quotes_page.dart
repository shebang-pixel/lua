import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget{
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes '),),
      body: Center(child: Text('Quotes and Inpiration')),
    );
  }
}