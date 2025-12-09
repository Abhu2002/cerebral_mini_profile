import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widget/profile_card.dart';
import 'profile_detail_screen.dart';

class ProfilesListScreen extends StatefulWidget {
  const ProfilesListScreen({super.key});

  @override
  State<ProfilesListScreen> createState() => _ProfilesListScreenState();
}

class _ProfilesListScreenState extends State<ProfilesListScreen> {
  late Future<List<Profile>> profilesFuture;

  @override
  void initState() {
    super.initState();
    profilesFuture = loadProfiles();
  }

  Future<List<Profile>> loadProfiles() async {
    final jsonStr =
    await DefaultAssetBundle.of(context).loadString('assets/profiles.json');

    final data = json.decode(jsonStr) as List;
    return data.map((e) => Profile.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- HEADER ----------------
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0,left: 10,right: 20,bottom: 10),
                child: const Text(
                  "Profiles",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // ---------------- LIST ----------------
            Expanded(
              child: FutureBuilder<List<Profile>>(
                future: profilesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text("Error loading profiles"));
                  }

                  final profiles = snapshot.data!;

                  return ListView.separated(
                    itemCount: profiles.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ProfileCard(
                          profile: profiles[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProfileDetailScreen(
                                  profile: profiles[index],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
