import 'package:developer_card_lift/developer_card_lift.dart';
import 'package:developer_card_lift/models/developer_skill.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Card Lift Demo',
      home: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: DeveloperCardLift(
                name: 'Christopher Baker',
                role: 'Flutter Developer',
                bio:
                    'Passionate Flutter developer crafting beautiful apps.',

                avatar: const NetworkImage(
                  'https://i.pravatar.cc/300?img=12',
                ),

                githubUrl: 'https://github.com/christopherbaker',
                linkedinUrl: 'https://linkedin.com/in/christopherbaker',
                portfolioUrl: 'https://christopherbaker.dev',
                instagramUrl: 'https://instagram.com/christopherbaker',
                twitterUrl: 'https://x.com/christopherbaker',
                whatsappUrl: 'https://wa.me/919999999999',

                projects: 12,
                experience: '3Y',

                skills: const [
                  DeveloperSkill(
                    label: 'Flutter',
                    icon: Icons.flutter_dash,
                  ),
                  DeveloperSkill(
                    label: 'Firebase',
                    icon: Icons.local_fire_department,
                  ),
                  DeveloperSkill(
                    label: 'PHP',
                    icon: Icons.code,
                  ),
                  DeveloperSkill(
                    label: 'React Native',
                    icon: Icons.phone_android,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}