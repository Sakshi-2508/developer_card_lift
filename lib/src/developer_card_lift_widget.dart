import 'package:developer_card_lift/models/developer_skill.dart';
import 'package:developer_card_lift/widgets/avatar_section.dart';
import 'package:developer_card_lift/widgets/skill_chip.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeveloperCardLift extends StatelessWidget {
  final String name;
  final String role;
  final ImageProvider avatar;
  final List<DeveloperSkill> skills;
  final String githubUrl;
  final String linkedinUrl;
  final int projects;
  final String experience;
  final String? bio;
  final String? portfolioUrl;
  final bool isDarkTheme;
  final String? instagramUrl;
  final String? twitterUrl;
  final String? whatsappNumber;

  const DeveloperCardLift({
    super.key,
    required this.name,
    required this.role,
    required this.avatar,
    required this.skills,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.projects,
    required this.experience,
    this.bio,
    this.portfolioUrl,
    this.isDarkTheme = true,
    this.instagramUrl,
    this.twitterUrl,
    this.whatsappNumber,
    required String whatsappUrl,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = isDarkTheme ? const Color(0xFF0F172A) : Colors.white;

    final secondaryColor =
        isDarkTheme ? const Color(0xFF1E293B) : const Color(0xFFF3F4F6);

    final codeColor =
        isDarkTheme ? const Color(0xFF111827) : const Color(0xFFE5E7EB);

    final primaryText = isDarkTheme ? Colors.white : Colors.black87;

    final secondaryText = isDarkTheme ? Colors.white70 : Colors.black54;

    final String? whatsappUrl = whatsappNumber != null &&
            whatsappNumber!.trim().isNotEmpty
        ? 'https://wa.me/${whatsappNumber!.replaceAll(RegExp(r'[^0-9]'), '')}'
        : null;

    return Center(
      child: Container(
        width: 380,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF1E293B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  _dot(Colors.red),
                  const SizedBox(width: 6),
                  _dot(Colors.orange),
                  const SizedBox(width: 6),
                  _dot(Colors.green),
                  const SizedBox(width: 12),
                  const Text(
                    'developer.dart',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            AvatarSection(
              avatar: avatar,
              online: true,
              status: 'Open To Work',
            ),

            const SizedBox(height: 16),

            Text(
              name,
              style: TextStyle(
                color: primaryText,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              role,
              style: TextStyle(
                color: secondaryText,
                fontSize: 15,
              ),
            ),

            if (bio != null && bio!.trim().isNotEmpty) ...[
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  bio!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 14,
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],

            const SizedBox(height: 20),

            /// Code block
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: codeColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'class Developer {',
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontFamily: 'monospace',
                    ),
                  ),
                  Text(
                    '  name: "$name";',
                    style: TextStyle(
                      color: primaryText,
                      fontFamily: 'monospace',
                    ),
                  ),
                  Text(
                    '  role: "$role";',
                    style: TextStyle(
                      color: primaryText,
                      fontFamily: 'monospace',
                    ),
                  ),
                  Text(
                    '}',
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: skills
                  .map(
                    (skill) => SkillChip(
                      label: skill.label,
                      icon: skill.icon,
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _statCard(
                    '$projects',
                    'Projects',
                    secondaryColor,
                    secondaryText,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    experience,
                    'Experience',
                    secondaryColor,
                    secondaryText,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                _socialButton(Icons.code, 'GitHub', githubUrl),
                _socialButton(Icons.business, 'LinkedIn', linkedinUrl),
                if (portfolioUrl != null && portfolioUrl!.trim().isNotEmpty)
                  _socialButton(Icons.language, 'Portfolio', portfolioUrl!),
              ],
            ),

            const SizedBox(height: 16),

// Social Icons
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                _socialIcon(
                  FontAwesomeIcons.instagram,
                  instagramUrl,
                ),
                const SizedBox(width: 16),
                _socialIcon(
                  FontAwesomeIcons.whatsapp,
                  whatsappUrl,
                ),
                const SizedBox(width: 16),
                _socialIcon(
                  FontAwesomeIcons.xTwitter,
                  twitterUrl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (url.trim().isEmpty) return;

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _dot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _statCard(
    String value,
    String title,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(
    IconData icon,
    String label,
    String url,
  ) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF1E293B),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _socialColor(IconData icon) {
    if (icon == FontAwesomeIcons.instagram) {
      return const Color(0xFFE4405F);
    }

    if (icon == FontAwesomeIcons.whatsapp) {
      return const Color(0xFF25D366);
    }

    if (icon == FontAwesomeIcons.xTwitter) {
      return Colors.white;
    }

    return Colors.white;
  }

  Widget _socialIcon(
    IconData icon,
    String? url,
  ) {
    if (url == null || url.isEmpty) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Color(0xFF1E293B),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 18,
            color: _socialColor(icon),
          ),
        ),
      ),
    );
  }
}
