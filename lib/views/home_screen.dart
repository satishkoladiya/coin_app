import 'package:coin_app/views/current_crypto_currencies_screen.dart';
import 'package:coin_app/views/favorites_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Coin'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Current Crypto',
            ),
            Tab(
              text: 'Favorites',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CurrentCryptoCurrenciesScreen(),
          FavoritesScreen(),
        ],
      ),
    );
  }
}
