import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/application/student/student_main_navigation_hub.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final hub = HubProvider.of<StudentMainNavigationHub>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        elevation: 4,
        shadowColor: Colors.black26,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF667eea).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Profile Avatar
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        hub.studentProfile.data.gender.toLowerCase() == 'female' ? '👩‍🎓' : '👨‍🎓',
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    hub.studentProfile.data.studentName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${hub.studentProfile.data.session.section.classInfo.className} - ${hub.studentProfile.data.session.section.sectionName}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Roll Number: ${hub.studentProfile.data.session.rollNumber}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Profile Information Cards
            _buildInfoCard(
              icon: Icons.person,
              title: 'Personal Information',
              items: [
                'Date of Birth: ${hub.studentProfile.data.dateOfBirth}',
                'Gender: ${hub.studentProfile.data.gender.toUpperCase()}',
                'Phone: ${hub.studentProfile.data.mobile}',
                'Email: ${hub.studentProfile.data.user.email}',
                if (hub.studentProfile.data.detail.bloodGroup != null) 'Blood Group: ${hub.studentProfile.data.detail.bloodGroup}',
                if (hub.studentProfile.data.aadhar != null) 'Aadhar: ${hub.studentProfile.data.aadhar}',
              ],
            ),

            const SizedBox(height: 16),

            _buildInfoCard(
              icon: Icons.school,
              title: 'Academic Information',
              items: [
                'Class: ${hub.studentProfile.data.session.section.classInfo.className}',
                'Section: ${hub.studentProfile.data.session.section.sectionName}',
                'Roll Number: ${hub.studentProfile.data.session.rollNumber}',
                'Admission Number: ${hub.studentProfile.data.admissionNumber}',
                'Admission Date: ${hub.studentProfile.data.admissionDate}',
                'Admission Session: ${hub.studentProfile.data.admissionSession}',
                'Current Session: ${hub.studentProfile.data.session.sessionInfo.sessionName}',
                'Student Type: ${hub.studentProfile.data.session.studentType.toUpperCase()}',
                'Status: ${hub.studentProfile.data.session.status.toUpperCase()}',
                if (hub.studentProfile.data.station.stationName.isNotEmpty) 'Station: ${hub.studentProfile.data.station.stationName}',
              ],
            ),

            const SizedBox(height: 16),

            _buildInfoCard(
              icon: Icons.family_restroom,
              title: 'Parent Information',
              items: [
                'Father: ${hub.studentProfile.data.fatherName}',
                'Mother: ${hub.studentProfile.data.motherName}',
                'Contact Phone: ${hub.studentProfile.data.mobile}',
              ],
            ),

            const SizedBox(height: 16),

            // Address Information (if available)
            if (hub.studentProfile.data.detail.currentAddress != null || hub.studentProfile.data.detail.permanentAddress != null)
              _buildInfoCard(
                icon: Icons.location_on,
                title: 'Address Information',
                items: [
                  if (hub.studentProfile.data.detail.currentAddress != null) ...[
                    'Current Address: ${hub.studentProfile.data.detail.currentAddress}',
                    if (hub.studentProfile.data.detail.currentCity != null) 'City: ${hub.studentProfile.data.detail.currentCity}',
                    if (hub.studentProfile.data.detail.currentPincode != null) 'Pincode: ${hub.studentProfile.data.detail.currentPincode}',
                  ],
                  if (hub.studentProfile.data.detail.permanentAddress != null) ...[
                    if (hub.studentProfile.data.detail.currentAddress != null) '---',
                    'Permanent Address: ${hub.studentProfile.data.detail.permanentAddress}',
                    if (hub.studentProfile.data.detail.permanentCity != null) 'City: ${hub.studentProfile.data.detail.permanentCity}',
                    if (hub.studentProfile.data.detail.permanentPincode != null) 'Pincode: ${hub.studentProfile.data.detail.permanentPincode}',
                  ],
                ],
              ),

            // Health Information (if available)
            if (hub.studentProfile.data.detail.height != null || hub.studentProfile.data.detail.weight != null) const SizedBox(height: 16),

            if (hub.studentProfile.data.detail.height != null || hub.studentProfile.data.detail.weight != null)
              _buildInfoCard(
                icon: Icons.health_and_safety,
                title: 'Health Information',
                items: [
                  if (hub.studentProfile.data.detail.bloodGroup != null) 'Blood Group: ${hub.studentProfile.data.detail.bloodGroup}',
                  if (hub.studentProfile.data.detail.height != null) 'Height: ${hub.studentProfile.data.detail.height}',
                  if (hub.studentProfile.data.detail.weight != null) 'Weight: ${hub.studentProfile.data.detail.weight}',
                ],
              ),

            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3498DB),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, color: Colors.white),
                    label: const Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C3E50),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required List<String> items,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3498DB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF3498DB),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3498DB),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF34495E),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
