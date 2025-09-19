class BlogModel {
  BlogModel(
      {required this.title, required this.imageUrl, required this.redirectUrl});

  final String title;
  final String imageUrl;
  final String redirectUrl;
}

final List<BlogModel> blogs = <BlogModel>[
  BlogModel(
    title: 'Clean & Readable Flutter UI with Dart Extensions',
    imageUrl: 'assets/images/extensions.jpg',
    redirectUrl:
        'https://medium.com/@pranavdave.code/clean-readable-flutter-ui-with-dart-extensions-f38cacf59358',
  ),
  BlogModel(
    title: 'A Clean Code Guide of Flutter',
    imageUrl: 'assets/images/clean_code.jpg',
    redirectUrl:
        'https://medium.com/@pranavdave.code/a-clean-code-guide-to-flutter-naming-conventions-folder-structure-and-best-practices-f6632d85e779',
  ),
  BlogModel(
    title: 'CI/CD for Flutter Apps with Code Magic',
    imageUrl: 'assets/images/ci_cd.jpg',
    redirectUrl:
        'https://medium.com/@pranavdave.code/ci-cd-for-flutter-setting-up-codemagic-for-seamless-deployment-%EF%B8%8F-4b5bad0cf583',
  ),
  BlogModel(
    title: 'Build a scalable flutter app + Clean architecture',
    imageUrl: 'assets/images/clean_architecture.jpg',
    redirectUrl:
    'https://medium.com/@pranavdave.code/how-to-build-a-scalable-flutter-app-using-clean-architecture-and-getx-5f2d02bfe794',
  ),
];
