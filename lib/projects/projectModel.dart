import 'package:pranavdave/utils/imports.dart';

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
  ProjectModel(title: 'Allwell', description: AppConst.allwellDesc),
  ProjectModel(title: 'Munch', description: AppConst.munchDesc),
  ProjectModel(title: 'JustWallet', description: AppConst.justWalletDesc),
  ProjectModel(
      title: 'Bussiness Budy', description: AppConst.bussinessBudyDesc),
  ProjectModel(
      title: 'Anim Button',
      description: AppConst.animButtonDesc,
      gitHub: GithubConst.animButton),
  ProjectModel(
      title: 'Solar System',
      description: AppConst.solarSystemDesc,
      gitHub: GithubConst.solarSystem),
  ProjectModel(
      title: 'Spotify UI',
      description: AppConst.spotifyDesc,
      gitHub: GithubConst.spotify),
];
