import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.profile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(       // <-- FIX: Provides Material for InkWell
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // Profile Image (rounded square like UI mock)
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  profile.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 16),

              // Name + Age + Bio (exact spacing)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      profile.age.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      profile.bio,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
