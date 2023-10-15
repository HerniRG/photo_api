import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:photo_api/model/photo_model.dart';
import 'package:transparent_image/transparent_image.dart';

Widget buildPhotoCard(context, Photo photo) {
  const aspectRatio = 3 / 5; // Proporción 3:4 para fotos verticales

  return Stack(children: [
    Card(
      elevation: 4.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: photo.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    Positioned(
      bottom: 10,
      right: 10,
      child: FloatingActionButton.small(
        onPressed: () => _saveImage(context, photo),
        child: const Icon(
          Icons.save_alt,
        ),
      ),
    )
  ]);
}

Future<void> _saveImage(BuildContext context, Photo photo) async {
  String? message;
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  try {
    // Descargar la imagen
    final http.Response response = await http.get(Uri.parse(photo.imageUrl));
    // Obtener el directorio temporal
    final dir = await getTemporaryDirectory();
    // Generar un nombre de archivo único basado en la fecha y la hora
    final now = DateTime.now();
    final formattedDate =
        "${now.year}${_twoDigits(now.month)}${_twoDigits(now.day)}_${_twoDigits(now.hour)}${_twoDigits(now.minute)}${_twoDigits(now.second)}";
    var filename = '${dir.path}/image_$formattedDate.png';
    // Guardar la imagen
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes);
    // Solicitar al usuario que guarde la imagen
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final filePath = await FlutterFileDialog.saveFile(params: params);

    if (filePath != null) {
      message = 'Imagen guardada correctamente';
    }
  } catch (e) {
    message = 'Ha ocurrido un error durante la descarga de la imagen';
  }
  if (message != null) {
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  }
}

String _twoDigits(int n) => n.toString().padLeft(2, '0');
