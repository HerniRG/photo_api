import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photo_api/model/photo_model.dart';

Future<List<Photo>> fetchListPhotos({
  required int page,
  required int perPage,
  required String query,
}) async {
  const accessKey = 'txv6sXjmtcapKheM_wDpkjHW0VqGAnZBSuKHPMSxscA';

  final url = Uri.parse(
      'https://api.unsplash.com/search/photos?page=$page&per_page=$perPage&query=$query');

  final response = await http.get(url, headers: {
    'Authorization': 'Client-ID $accessKey',
  });

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> results = data['results'];

    List<Photo> photos = results.map((photoData) {
      return Photo.fromJson(photoData);
    }).toList();

    return photos;
  } else {
    print('Error al realizar la solicitud: ${response.statusCode}');
    return [];
  }
}
