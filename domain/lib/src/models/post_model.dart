import 'image_model.dart';

class PostModel {
  final String id;
  final String title;
  final String? description;
  final int datetime;
  final List<ImageModel> images;

  const PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    required this.images,
  });
}
