import 'package:app/data/model/article.dart';
import 'package:app/data/model/source.dart';

final dummyArticle = Article(
  source: Source(id: 'wasabeef', name: 'Daichi Furiya'),
  author: 'wasabeef',
  title: 'flutter architecture blueprints',
  description:
      'Flutter Architecture Blueprint is a project that introduces MVVM architecture and project structure approaches to developing Flutter apps.',
  url: 'https://github.com/wasabeef/flutter-architecture-blueprints',
  publishedAt: DateTime.now(),
  content: 'content',
);
