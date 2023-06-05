import 'package:pranavdave/projects/const.dart';

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
  ProjectModel(title: 'Coupinos', description: AppConst.coupinoDesc),
  ProjectModel(title: 'Piatto', description: AppConst.piattoDesc),
  ProjectModel(
      title: 'Chitti',
      description: AppConst.chittiDesc,
      gitHub: GithubConst.chitti),
  ProjectModel(
      title: 'Pokedex',
      description: AppConst.pokedexDesc,
      gitHub: GithubConst.pokedex),
  ProjectModel(
      title: 'Tic-tac-toe',
      description: AppConst.tictactoeDesc,
      gitHub: GithubConst.tictactoe),
  ProjectModel(
      title: 'Designs sea',
      description: AppConst.designSeaDesc,
      gitHub: GithubConst.designSea),
  ProjectModel(
      title: 'Solar System',
      description: AppConst.solarSystemDesc,
      gitHub: GithubConst.solarSystem),
  ProjectModel(
      title: 'Spotify UI',
      description: AppConst.spotifyDesc,
      gitHub: GithubConst.spotify),
];
