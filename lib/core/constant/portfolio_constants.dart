import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constant/assets_img.dart';

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
  heitech(
      name: 'Heitech Padu Berhad',
      duration: '2021 - Present',
      jobPesignation: 'Software Developer',
      yearsWork: '2',
      responsibility:
          'As a mobile developer, it is your responsibility to design, develop, and maintain innovative and user-friendly mobile applications that meet the needs and expectations of the users while adhering to industry best practices and standards.',
      techStack: 'Flutter, Figma, Framer, Photoshop, Rest API, Firebase'),
  esra(
      name: 'Esra Technology',
      duration: '2019 - 2021',
      jobPesignation: 'Software Developer (Internship)',
      yearsWork: '0.5',
      responsibility:
          'Responsible for assisting the developer team to develop the system according to the Technical diagram and user requirement. Responsible to fix defect for System testing. ',
      techStack: 'PHP, HTML, CSS, MySQl, Orcale, JavaScript, JQuery');

  final String name;
  final String duration;
  final String jobPesignation;
  final String yearsWork;
  final String responsibility;
  final String techStack;

  const ExperienceList(
      {required this.name,
      required this.duration,
      required this.jobPesignation,
      required this.yearsWork,
      required this.responsibility,
      required this.techStack});
}

enum DownloadUrl {
  resume(
      name: '(RESUME) AHMAD MUIZZUDDIN SHAHREL',
      url:
          'https://drive.google.com/uc?export=download&id=1EyxlIEBWhzgmC5GsIvGW9bYp5rnYdOKo');

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
  ksp(name: 'Kulim Smart Parking', img: AssetsImg.ksp),
  enf(name: 'Kulim Esnforcement', img: AssetsImg.enf),
  sps(name: 'Smart Parking Solution', img: AssetsImg.sps),
  ;

  final String name;
  final String img;
  const MyProject({required this.name, required this.img});
}

responsiveSize(BuildContext context,
    {required double max, required double mid, required double min}) {
  Size size = MediaQuery.of(context).size;
  return size.width < 850
      ? min
      : (size.width < 1150 && size.width >= 850)
          ? mid
          : max;
}
