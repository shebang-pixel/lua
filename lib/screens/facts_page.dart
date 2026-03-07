import 'package:flutter/material.dart';
import '../models/facts_model.dart';
import '../services/facts_service.dart';

class FactsPage extends StatefulWidget{
  const FactsPage({super.key});

  @override
  State<FactsPage> createState() => _FactsPageState();
}

class _FactsPageState extends State<FactsPage> {
  // Instance of service class
  FactsService service = FactsService();
  // Future to hold fact
  late Future<FactsModel> factFuture;

  @override
  void initState() {
    super.initState();
    // Call api on widget load
  factFuture = service.fetchFact();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facts and Laughs'),),
      body: FutureBuilder(
        future: factFuture, 
        builder: (context, snapshot) {
          // Loading State
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }

          // Error state
          if(snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // if null
          if(!snapshot.hasData) {
            return Center(
              child: const Text('Error: Snapshot has no data'),
            );
          }

          // success state
          final fact = snapshot.data!;

          return Center(
            child: Column(
              children: [
                Text('Fact ID: ${fact.id}'),
                Text('Fact: ${fact.text}'),
                Text('Fact Source: ${fact.source}'),
              ],
            ),
          );
        },
        ),
    );
  }
}