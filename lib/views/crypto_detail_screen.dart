import 'package:coin_app/models/models.dart';
import 'package:flutter/material.dart';

class CryptoDetailScreen extends StatelessWidget {
  const CryptoDetailScreen({Key? key, required this.crypto}) : super(key: key);

  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Platform: ${crypto.platform?.name ?? 'N/A'}'),
            const SizedBox(
              height: 10,
            ),
            Text('First Historical Data : ${crypto.firstHistoricalData}'),
            const SizedBox(
              height: 10,
            ),
            Text('Last Historical Data : ${crypto.lastHistoricalData}'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
