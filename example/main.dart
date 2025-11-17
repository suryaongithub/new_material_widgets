import 'package:flutter/material.dart';
import 'package:new_material_widgets/GlossyCeramic/GCColorSchema.dart';
import 'package:new_material_widgets/GlossyCeramic/GCAppBar.dart';
import 'package:new_material_widgets/GlossyCeramic/GCCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GCColorSchema colorScheme = GCColorSchema(
      backgroundColor: Colors.white,
      surfaceColor: Colors.grey.shade200,
      accentColor: Colors.blue,
      shadowColor: Colors.black12,
      tintColor: Colors.white70,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: GCAppbar(
          colorScheme,
          const Text(
            'GlossyCeramic Demo',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: colorScheme.backgroundColor,
        body: Center(
          child: GCCard(
            colorScheme: colorScheme,
            padding: const EdgeInsets.all(20),
            borderRadius: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Hello GlossyCeramic!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'This card uses the GC color schema and design.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
