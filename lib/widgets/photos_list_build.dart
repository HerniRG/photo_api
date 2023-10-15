// Función auxiliar para construir la lista de fotos
import 'package:flutter/material.dart';
import 'package:photo_api/provider/photo_gallery_provider.dart';
import 'package:photo_api/widgets/circular_progress.dart';
import 'package:photo_api/widgets/photo_card.dart';

Widget buildPhotoList(int index, PhotoGalleryModel photoGalleryModel) {
  return NotificationListener<ScrollNotification>(
    onNotification: (notification) {
      if (notification is ScrollEndNotification &&
          notification.metrics.extentAfter == 0) {
        photoGalleryModel.loadMorePhotos(index);
      }
      return false;
    },
    child: ListView.builder(
      itemCount: photoGalleryModel.photosByCategory[index].length +
          (photoGalleryModel.isLoadingByCategory[index] ? 1 : 0),
      itemBuilder: (context, itemIndex) {
        if (itemIndex < photoGalleryModel.photosByCategory[index].length) {
          return buildPhotoCard(
            context,
            photoGalleryModel.photosByCategory[index][itemIndex],
          );
        } else if (photoGalleryModel.isLoadingByCategory[index]) {
          return buildProgressIndicator();
        }
        return null;
      },
    ),
  );
}
