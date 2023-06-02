class SkillsModel {
  final String? title, icons;

  SkillsModel({required this.title, required this.icons});
}

final skills = [
  SkillsModel(title: 'Flutter', icons: 'assets/icons/flutter.png'),
  SkillsModel(title: 'Dart', icons: 'assets/icons/dart.png'),
  SkillsModel(title: 'Firebase Auths', icons: 'assets/icons/firebaseauth.png'),
  SkillsModel(title: 'Cloud Firestore', icons: 'assets/icons/firestore.png'),
  SkillsModel(title: 'GitHub', icons: 'assets/icons/github.png'),
  SkillsModel(title: 'Postman', icons: 'assets/icons/postman.png'),
  SkillsModel(title: 'GCP', icons: 'assets/icons/gcp.png'),
  SkillsModel(title: 'Figma', icons: 'assets/icons/figma.png'),
  SkillsModel(title: 'Adobe Xd', icons: 'assets/icons/xd.png'),
];
