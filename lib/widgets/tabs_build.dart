// Función auxiliar para construir las pestañas
import 'package:flutter/material.dart';
import 'package:photo_api/constants/tabs.dart';
import 'package:photo_api/provider/photo_gallery_provider.dart';

List<Widget> buildTabs(PhotoGalleryModel photoGalleryModel) {
  return photoGalleryModel.queries.asMap().entries.map((entry) {
    final index = entry.key;
    final query = entry.value;
    final category = Constants.categories[index];
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Tab(
        child: Column(
          children: [
            Icon(category.icon),
            Text(query),
          ],
        ),
      ),
    );
  }).toList();
}
