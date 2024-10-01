import 'package:core/core.dart';

import 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState>{
  ImagesCubit(): super(ImagesLoadingState()){
    _init();
  }


  Future<void> _init() async {
    //TODO
  }

}