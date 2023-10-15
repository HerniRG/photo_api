import 'package:flutter/material.dart';
import 'package:photo_api/widgets/photo_body_build.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxisScrolled) => [
            const SliverAppBar(
              title: Text('Galería de Fotos'),
            ),
          ],
          body: const PhotoTabsWidget(),
        ),
      ),
    );
  }
}
