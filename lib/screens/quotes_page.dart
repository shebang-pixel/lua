import 'package:flutter/material.dart';
import '../models/quotes_model.dart';
import '../services/quotes_service.dart';

class QuotesPage extends StatefulWidget{
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  // instance of service class
  final QuotesService service = QuotesService();
  // Future to hold quote data
  late Future<QuotesModel> quoteFuture;

  @override
  void initState() {
    super.initState();
    quoteFuture = service.fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes '),),
      body: FutureBuilder(
          future: quoteFuture,
          builder: (context,snapshot) {
          //   Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

          //   Error State
            if(snapshot.hasError) {
              return  Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

          //   no data Returned
            if(!snapshot.hasData) {
              return  const Center(
                  child: Text('No data'),
              );
            }

          //   success
            final quote = snapshot.data!;

            return Column(
              children: [
                Text('Quote: ${quote.q}'),
                Text('Author: ${quote.a}'),
                Text('Hint: ${quote.h}'),
              ],
            );
          }
      ),
    );
  }
}