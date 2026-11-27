import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api.dart';
import 'theme.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false; // fonts come from assets/google_fonts/
  runApp(RaadkaygaApp(api: Api()));
}

class RaadkaygaApp extends StatelessWidget {
  const RaadkaygaApp({super.key, required this.api});
  final Api api;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Raadkayga',
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
        home: HomePage(api: api),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.api});
  final Api api;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<String> _status = widget.api.health();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('Raadkayga', style: heading(56, color: AppColors.sky)),
            const SizedBox(height: 16),
            FutureBuilder<String>(
              future: _status,
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return const CircularProgressIndicator();
                }
                if (snap.hasError) {
                  return Text(
                    'API not reachable: ${snap.error}',
                    style: const TextStyle(color: AppColors.redEarth),
                  );
                }
                return Text('API: ${snap.data}', style: const TextStyle(fontSize: 18));
              },
            ),
          ]),
        ),
      );
}