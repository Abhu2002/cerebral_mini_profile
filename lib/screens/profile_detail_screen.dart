import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfileDetailScreen extends StatelessWidget {
  final Profile profile;

  const ProfileDetailScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ---------------- BACK BUTTON ----------------
              Container(
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios, size: 22),
                        ),
                      ),
                    ),
                    // ---------------- PROFILE IMAGE ----------------
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          profile.image,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                
                
                    // ---------------- NAME ----------------
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        profile.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                
                
                    // ---------------- AGE ----------------
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "${profile.age}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                
                  ],
                ),
              ),
              
              // ---------------- TAGS ----------------
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0,top: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: profile.interests.map((tag) {
                    return Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F2FF), // soft blue background
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // ---------------- FAVORITE BUTTON ----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.favorite_border, size: 22),
                      SizedBox(width: 10),
                      Text(
                        "Favorite",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
