import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/images_cubit.dart';
import '../bloc/images_state.dart';
import 'images_loaded.dart';
import 'images_loading.dart';
import 'images_loading_error.dart';

class ImagesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('titles.images'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (_, ImagesState state) {
          return switch (state) {
            ImagesLoadingState() => ImagesLoading(),
            ImagesLoadedState() => ImagesLoaded(
                gallery: state.gallery,
              ),
            ImagesLoadingErrorState() => ImagesLoadingError(),
          };
        },
      ),
    );
  }
}
