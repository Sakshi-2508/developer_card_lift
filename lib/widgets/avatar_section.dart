import 'package:flutter/material.dart';

class AvatarSection extends StatelessWidget {
  final ImageProvider avatar;
  final bool online;

  const AvatarSection({
    super.key,
    required this.avatar,
    this.online = true, required String status,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF3B82F6),
              width: 3,
            ),
          ),
        ),
        CircleAvatar(
          radius: 55,
          backgroundImage: avatar,
        ),
        if (online)
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF0F172A),
                  width: 3,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
