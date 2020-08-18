import 'package:app/data/model/article.dart';
import 'package:app/data/model/source.dart';

final dummyArticle = Article(
  source: const Source(id: 'wasabeef', name: 'Daichi Furiya'),
  author: 'wasabeef',
  title: 'flutter architecture blueprints',
  description:
      'Flutter Architecture Blueprint is a project that introduces MVVM architecture and project structure approaches to developing Flutter apps.',
  url: 'https://github.com/wasabeef/flutter-architecture-blueprints',
// TODO(wasabeef): Workaround for testing CachedNetworkImage
//  urlToImage:
//      'https://raw.githubusercontent.com/wasabeef/art/master/flutter-architecture-blueprints/cover.png',
  publishedAt: DateTime.now(),
  content: 'content',
);
