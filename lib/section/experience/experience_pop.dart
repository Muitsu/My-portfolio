import 'package:flutter/material.dart';

import '../../constant/portfolio_constants.dart';

class ExperiencePopUp extends StatelessWidget {
  final String companyName;
  final String jobPesignation;
  final String yearsWork;
  final String responsibility;
  final String techStack;
  const ExperiencePopUp({
    super.key,
    required this.companyName,
    required this.jobPesignation,
    required this.yearsWork,
    required this.responsibility,
    required this.techStack,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: responsiveSize(context, max: 300, mid: 150, min: 20)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Experience working at',
              style: TextStyle(
                  fontSize: responsiveSize(context, max: 20, mid: 18, min: 16),
                  fontWeight: FontWeight.w300),
            ),
          ),
          Center(
              child: Text(
            companyName,
            style: TextStyle(
                fontSize: responsiveSize(context, max: 24, mid: 22, min: 20),
                fontWeight: FontWeight.bold),
          )),
          const Divider(),
          SizedBox(
            height: size.height * 0.6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Job Designations: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        jobPesignation,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Duration of Work: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$yearsWork Years',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Responsibility',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    responsibility,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  const Text(
                    'Tech Stack',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    techStack,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
