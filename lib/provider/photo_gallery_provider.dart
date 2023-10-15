import 'package:flutter/material.dart';
import 'package:photo_api/constants/tabs.dart';
import 'package:photo_api/fetch/fetch_list_photos.dart';
import 'package:photo_api/model/photo_model.dart';

class PhotoGalleryModel extends ChangeNotifier {
  final List<String> queries =
      Constants.categories.map((category) => category.name).toList();
  final int perPage = 15;
  int currentPage = 1;
  List<List<Photo>> photosByCategory = [];
  List<bool> isLoadingByCategory = [];
  int currentCategoryIndex = 0;

  PhotoGalleryModel() {
    for (var i = 0; i < queries.length; i++) {
      photosByCategory.add([]);
      isLoadingByCategory.add(false);
      loadMorePhotos(i);
    }
  }

  Future<void> loadMorePhotos(int categoryIndex) async {
    if (isLoadingByCategory[categoryIndex]) return;

    isLoadingByCategory[categoryIndex] = true;
    notifyListeners();

    final response = await fetchListPhotos(
      page: currentPage,
      perPage: perPage,
      query: queries[categoryIndex],
    );

    isLoadingByCategory[categoryIndex] = false;
    if (response.isNotEmpty) {
      photosByCategory[categoryIndex].addAll(response);
      currentPage++;
    }
    notifyListeners();
  }

  void changeCategory(int index) {
    if (currentCategoryIndex != index) {
      currentCategoryIndex = index;
      notifyListeners();
    }
  }
}
