import 'package:flutter/material.dart';
import 'package:lua/services/weather_service.dart';
import '../models/jokes_model.dart';
import '../services/jokes_service.dart';

class JokesPage extends StatefulWidget{
  const JokesPage({super.key});

  @override
  State<JokesPage> createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {
  // Instance of service
  final JokesService service = JokesService();
  // Future to hold jokes data
  late Future<JokesModel> jokesFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //   Call APi when Widget loads
    jokesFuture = service.fetchJoke();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jokes and Laughs'),),
      body: FutureBuilder(
          future: jokesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            if (!snapshot.hasData) {
              return const Text("No weather data");

            }

            final joke = snapshot.data!;
            print(joke);

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Joke Type: ${joke.type}'),
                  Text('Setup: ${joke.setup}'),
                  Text('Punchline: ${joke.punchline}'),
                  Text('Joke ID: ${joke.id}'),
                ],
              ),
            );

          } ,
      ),
    );
  }
}