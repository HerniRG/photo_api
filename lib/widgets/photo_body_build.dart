import 'package:flutter/material.dart';
import 'package:photo_api/provider/photo_gallery_provider.dart';
import 'package:photo_api/widgets/photos_list_build.dart';
import 'package:photo_api/widgets/tabs_build.dart';
import 'package:provider/provider.dart';

class PhotoTabsWidget extends StatelessWidget {
  const PhotoTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final photoGalleryModel = Provider.of<PhotoGalleryModel>(context);

    return DefaultTabController(
      length: photoGalleryModel.queries.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: buildTabs(photoGalleryModel),
          ),
          Expanded(
            child: TabBarView(
              children: photoGalleryModel.queries.asMap().entries.map((entry) {
                final index = entry.key;
                return buildPhotoList(index, photoGalleryModel);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
