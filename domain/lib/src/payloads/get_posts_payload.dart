import '../enums/enums.dart';

class GetPostsPayload {
  final int page;
  final SectionEnum sectionEnum;
  final SortEnum sortEnum;
  final WindowEnum windowEnum;

  const GetPostsPayload({
    this.page = 0,
    this.sectionEnum = SectionEnum.hot,
    this.sortEnum = SortEnum.viral,
    this.windowEnum = WindowEnum.day,
  });
}
