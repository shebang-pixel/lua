import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/facts_model.dart';
import '../services/facts_service.dart';

class FactsPage extends StatefulWidget {
  const FactsPage({super.key});

  @override
  State<FactsPage> createState() => _FactsPageState();
}

class _FactsPageState extends State<FactsPage> {

  // Service responsible for calling the API
  final FactsService service = FactsService();

  // Future that will hold the fact returned from the API
  late Future<FactsModel> factFuture;


  @override
  void initState() {
    super.initState();

    // Load the fact when the page opens
    factFuture = loadFact();
  }


  /// Loads a fact from the API and saves it locally
  Future<FactsModel> loadFact() async {

    // 1️Fetch fact from API
    final fact = await service.fetchFact();

    // 2️ Save the fact locally
    await saveFact(fact.text);

    // 3️ Return the fact so the UI can display it
    return fact;
  }


  /// Saves a fact to local storage
  Future<void> saveFact(String text) async {

    // Open local storage
    final prefs = await SharedPreferences.getInstance();

    // Save fact using the key "facts"
    await prefs.setString("facts", text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facts and Laughs'),
      ),

      body: FutureBuilder<FactsModel>(
        future: factFuture,

        builder: (context, snapshot) {

          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error state
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          //  No data state
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Error: Snapshot has no data'),
            );
          }

          // Success state
          final fact = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Fact ID
                Text('Fact ID: ${fact.id}'),

                const SizedBox(height: 10),

                // Fact text
                Text('Fact: ${fact.text}'),

                const SizedBox(height: 10),

                // Fact source
                Text('Fact Source: ${fact.source}'),
              ],
            ),
          );
        },
      ),
    );
  }
}