import 'package:my_portfolio/constant/assets_img.dart';

const double desktopHorizontalPadding = 180;
const double tabletHorizontalPadding = 120;
const double mobileHorizontalPadding = 20;

enum MyName {
  fullName(name: 'AHMAD MUIZZUDDIN BIN SHAHREL'),
  basicName(name: 'AHMAD MUIZZUDDIN'),
  nameWhitespace(name: 'AHMAD\nMUIZZUDDIN.'),
  shortName(name: 'Muiz'),
  ;

  final String name;
  const MyName({required this.name});
}

enum InfoTab {
  about(name: 'About'),
  exp(name: 'Experience'),
  project(name: 'Projects'),
  ;

  final String name;
  const InfoTab({required this.name});
}

enum AboutMe {
  contact(miniTitle: '', title: '', desc: ''),
  about(
      miniTitle: 'About me',
      title: "Let's talk more about me. Here some information",
      desc:
          "Hi! I'm Muiz, a software developer with 2 years of experience specializing in front-end development. I'm seeking new opportunities and challenges to improve my skill set."),
  ;

  final String miniTitle;
  final String title;
  final String desc;
  const AboutMe(
      {required this.miniTitle, required this.title, required this.desc});
}

enum ExperienceList {
  heitech(name: 'Heitech Padu Berhad', duration: '2021 - Present'),
  esra(name: 'Esra Technology', duration: '2019 - 2021');

  final String name;
  final String duration;
  const ExperienceList({required this.name, required this.duration});
}

enum DownloadUrl {
  resume(
      name: '(RESUME) AHMAD MUIZZUDDIN SHAHREL',
      url:
          'https://drive.google.com/uc?export=download&id=1oa9cT6G__ni0WkGcZcr9zF1fyc-Uji5V');

  final String name;
  final String url;
  const DownloadUrl({required this.name, required this.url});
}

enum TechStack {
  flutter(name: 'Flutter', img: AssetsImg.flutter),
  firebase(name: 'Firebase', img: AssetsImg.firebase),
  figma(name: 'Figma', img: AssetsImg.figma),
  html(name: 'Html', img: AssetsImg.html),
  js(name: 'Js', img: AssetsImg.js),
  ;

  final String name;
  final String img;
  const TechStack({required this.name, required this.img});
}

enum LottiefileAsset {
  orange(url: 'https://assets3.lottiefiles.com/packages/lf20_rmpmxft3.json'),
  bear(url: 'https://assets10.lottiefiles.com/packages/lf20_ZsoSL7RsIe.json');

  final String url;
  const LottiefileAsset({required this.url});
}

enum MyProject {
  ksp,
  enf,
  sps;
}
