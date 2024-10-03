import 'package:core/core.dart';
import 'package:retrofit/retrofit.dart';

import '../entities/entities.dart';

part 'imgur_provider.g.dart';

@RestApi()
abstract class ImgurProvider {
  factory ImgurProvider(Dio dio, {String? baseUrl}) = _ImgurProvider;

  @GET(ApiConstants.galleryPath)
  Future<GalleryEntity> gallery(
    @Header('Authorization') String authorization,
    @Path('section') String section,
    @Path('sort') String sort,
    @Path('window') String window,
    @Path('page') int page,
  );

  @GET(ApiConstants.detailsPath)
  Future<DetailsEntity> details(
    @Header('Authorization') String authorization,
    @Path('id') String id,
  );
}
