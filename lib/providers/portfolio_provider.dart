import 'package:flutter/material.dart';
import 'package:my_portfolio/features/education/educatin_model.dart';
import 'package:my_portfolio/features/experience/experience_model.dart';
import 'package:my_portfolio/features/project/project_model.dart';

class PortfolioProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  bool showFloatingAppBar = false;

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey educationeKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void initController() {
    scrollController.addListener(() {
      if (scrollController.offset > 100 && !showFloatingAppBar) {
        showFloatingAppBar = true;
        WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
      } else if (scrollController.offset <= 100 && showFloatingAppBar) {
        showFloatingAppBar = false;
        WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
      }
    });
  }

  void disposeController() {
    scrollController.dispose();
  }

  //============================================
  // MARK: - MAIN HOME
  //============================================

  void scrollToAbout() => _scrollToSection(aboutKey);
  void scrollToEducationeKey() => _scrollToSection(educationeKey);
  void scrollToExperience() => _scrollToSection(experienceKey);
  void scrollToProject() => _scrollToSection(projectsKey);
  void scrollToContact() => _scrollToSection(contactKey);

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  //============================================
  // MARK: - HERO
  //============================================
  String name = "Ahmad Muizzuddin";
  String role = 'Mobile Developer.';
  String heroDesc =
      'Building exceptional mobile experiences with modern technologies.'
      'Specialized in Flutter, clean architecture, and scalable app solutions.';
  //============================================
  // MARK: - ABOUT
  //============================================
  String about1 =
      'With over ${DateTime.now().year - 2021}+ years of experience in software development,'
      'I focus on building reliable and scalable, applications that deliver real value to users.'
      'I believe in clean architecture, maintainable code, and creating solutions that balance technical excellence with practical user needs.';
  String about2 =
      'I specialize in developing high-performance mobile applications using Flutter, supported by robust'
      'backend systems and cloud infrastructure. My experience spans the full development lifecycle — from '
      'architecture design and implementation to deployment and continuous improvement.';

  List<(String, double)> skills = [
    ('Flutter', 0.97),
    ('Dart', 0.95),
    ('Mobile App Architecture', 0.92),
    ('3rd Party SDK Integration', 0.80),
    ('Firebase / Cloud Services', 0.88),
    ('Android Native (Java)', 0.80),
    ('Spring Boot', 0.40),
  ];

  //============================================
  // MARK: - EDUCATION
  //============================================
  List<EducatinModel> get educations => [
        EducatinModel(
          title: 'University Teknologi MARA (UiTM)',
          subtitle: 'Bachelor of Computer Science',
          period: '2017 - 2021',
          description:
              'Developed a Smart Attendance System using OpenCV and FaceNet (Computer Vision).',
        ),
        EducatinModel(
          title: 'Selangor Matriculation College',
          subtitle: 'Foundation in Accounting',
          period: '2016 - 2017',
          description:
              'Learning through professional certifications in Accounting',
        ),
      ];
  //============================================
  // MARK: - EXPERIENCE
  //============================================
  List<ExperienceModel> get experiences => [
        ExperienceModel(
          company: 'Laureate System Solutions SDN BHD',
          role: 'Mobile Developer',
          period: 'May 2024 - Present',
          icon: Icons.grid_view_rounded,
          points: [
            'Contribute on Maintaining goverment- backed parking apps DBKL EZ KL Smart Park',
            'Mentoring 2 junior Flutter developers, establishing scalable architecture',
          ],
        ),
        ExperienceModel(
          company: 'Heitech Padu Berhad',
          role: 'Software Developer',
          period: 'May 2021 - May 2024',
          icon: Icons.grid_view_rounded,
          points: [
            'Develop 4 major public-sector applications, including Kulim Smart Parking and Park Smart Plus,',
            'Developed custom Flutter/Native plugins for WoosimBluetooth printers',
          ],
        ),
      ];
  //============================================
  // MARK: - PROJECTS
  //============================================
  final List<ProjectModel> projects = [
    ProjectModel(
      title: 'CloudSync',
      description:
          'Real-time file synchronization platform with conflict resolution. Handles 100K+ concurrent users.',
      image: 'https://picsum.photos/seed/cloud/600/400',
      tags: ['Next.js', 'WebSocket', 'AWS S3'],
      stars: 2340,
    ),
    ProjectModel(
      title: 'DevMetrics',
      description:
          'Analytics dashboard for development teams. Track productivity and code quality metrics.',
      image: 'https://picsum.photos/seed/metrics/600/400',
      tags: ['React', 'D3.js', 'PostgreSQL'],
      stars: 1856,
    ),
    ProjectModel(
      title: 'CodeFlow',
      description:
          'Open-source CI/CD pipeline tool with visual workflow builder and Git integration.',
      image: 'https://picsum.photos/seed/flow/600/400',
      tags: ['Go', 'Docker', 'Kubernetes'],
      stars: 3102,
    ),
    ProjectModel(
      title: 'NotionClone',
      description:
          'Collaborative workspace with block-based editor and real-time collaboration features.',
      image: 'https://picsum.photos/seed/notion/600/400',
      tags: ['TypeScript', 'Yjs', 'SQLite'],
      stars: 4521,
    ),
  ];
  //============================================
  // MARK: - CONTACTS
  //============================================

  String email = "ahmadmuizzuddin13@gmail.com";
  String location = "Kuala Lumpur, Malaysia";
  String status = "Available for work";
}
