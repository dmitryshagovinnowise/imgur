import 'package:flutter/cupertino.dart';

import '../../core_ui.dart';

class Grid extends StatelessWidget {

  final int itemCount;
  final NullableIndexedWidgetBuilder builder;

  const Grid({super.key, required this.itemCount, required this.builder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_10,),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppDimens.gridImagesCount,
        mainAxisSpacing: AppDimens.PADDING_10,
        crossAxisSpacing: AppDimens.PADDING_10,
      ),
      itemBuilder: builder,
    );
  }

}