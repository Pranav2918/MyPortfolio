class ProjectModel {
  final String title;
  final String description;
  final String? gitHub;
  final List<String>? screenshot;

  ProjectModel({
    required this.title,
    required this.description,
    this.gitHub,
    this.screenshot,
  });
}

final List<ProjectModel> projectList = [
  ProjectModel(title: 'Coupinos', description: 'Coupinos Desc'),
  ProjectModel(title: 'Piatto', description: 'Piatto Desc'),
  ProjectModel(title: 'Chitti', description: 'Chitti Desc'),
  ProjectModel(title: 'Pokedex', description: 'Coupinos Desc'),
  ProjectModel(title: 'Tic-tac-toe', description: 'Coupinos Desc'),
  ProjectModel(title: 'Designs sea', description: 'Coupinos Desc'),
  ProjectModel(title: 'Travel UI', description: 'Coupinos Desc'),
  ProjectModel(title: 'Solar System', description: 'Coupinos Desc'),
  ProjectModel(title: 'Spotify UI', description: 'Coupinos Desc'),
];
