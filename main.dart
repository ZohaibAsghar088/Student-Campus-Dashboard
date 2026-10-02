import 'package:flutter/material.dart';

void main() {
  runApp(const StudentCampusApp());
}

class StudentCampusApp extends StatelessWidget {
  const StudentCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Campus Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController noteController = TextEditingController();

  // ============================================================
  // COURSES
  // ============================================================

  final List<Map<String, dynamic>> courses = [
    {
      'code': 'CSC303',
      'name': 'Mobile Application Development',
      'icon': Icons.phone_android,
      'color': Colors.blue,
    },
    {
      'code': 'CSC323',
      'name': 'Operating Systems',
      'icon': Icons.computer,
      'color': Colors.deepPurple,
    },
    {
      'code': 'CSC325',
      'name': 'Computer Organization and Assembly Language',
      'icon': Icons.memory,
      'color': Colors.orange,
    },
    {
      'code': 'CSC336',
      'name': 'Web Technologies',
      'icon': Icons.language,
      'color': Colors.green,
    },
    {
      'code': 'CSC305',
      'name': 'Software Design and Architecture',
      'icon': Icons.architecture,
      'color': Colors.red,
    },
    {
      'code': 'MTh105',
      'name': 'Multivariable',
      'icon': Icons.functions,
      'color': Colors.teal,
    },
  ];

  String submittedNote = '';

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  // ============================================================
  // SUBMIT NOTE
  // ============================================================

  void submitNote() {
    setState(() {
      submittedNote = noteController.text.trim();
    });

    noteController.clear();

    if (submittedNote.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Note added successfully!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        title: const Text(
          'Campus Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.search),

            onPressed: () {
              showSearch(
                context: context,
                delegate: CourseSearchDelegate(courses),
              );
            },
          ),
        ],
      ),

      // ========================================================
      // DRAWER
      // ========================================================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.indigo),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,

                    child: Icon(Icons.person, size: 45, color: Colors.indigo),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Student Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Roll No: FA24-BSE-088',
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text('Digital ID Card'),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('My Courses'),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),

              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // ==================================================
              // WELCOME
              // ==================================================

              const Text(
                'Welcome, Student!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              Text(
                'Here is your campus information',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 20),

              // ==================================================
              // DIGITAL ID CARD
              // ==================================================
              Card(
                elevation: 6,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                    gradient: const LinearGradient(
                      colors: [Colors.indigo, Colors.blueAccent],

                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),

                  child: Column(
                    children: [
                      // ==========================================
                      // PROFILE IMAGE + ONLINE DOT
                      // ==========================================

                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.white,

                            child: CircleAvatar(
                              radius: 44,
                              backgroundColor: Colors.indigo,

                              child: Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          Positioned(
                            right: 2,
                            bottom: 2,

                            child: Container(
                              width: 20,
                              height: 20,

                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,

                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'DIGITAL STUDENT ID',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'Zohaib Asghar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 18),

                      // ==========================================
                      // STUDENT INFORMATION
                      // ==========================================
                      Container(
                        padding: const EdgeInsets.all(15),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: Column(
                          children: [
                            studentInfoRow('Roll No', 'FA24-BSE-O88'),

                            const SizedBox(height: 10),

                            studentInfoRow('Department', 'Computer Science'),

                            const SizedBox(height: 10),

                            studentInfoRow('Semester', '5th Semester'),

                            const SizedBox(height: 10),

                            studentInfoRow('Status', 'Active'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ==================================================
              // COURSES HEADING
              // ==================================================
              const Text(
                'My Courses',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 4),

              Text(
                'Current semester courses',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 15),

              // ==================================================
              // COURSE LIST
              // ==================================================
              ListView.builder(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                itemCount: courses.length,

                itemBuilder: (context, index) {
                  final course = courses[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),

                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        // ========================================
                        // COURSE LOGO
                        // ========================================

                        Container(
                          width: 62,
                          height: 62,

                          decoration: BoxDecoration(
                            color: course['color'].withOpacity(0.12),

                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Icon(
                            course['icon'],
                            size: 32,
                            color: course['color'],
                          ),
                        ),

                        const SizedBox(width: 15),

                        // ========================================
                        // COURSE DETAILS
                        // ========================================
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              // COURSE CODE

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 4,
                                ),

                                decoration: BoxDecoration(
                                  color: course['color'].withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: Text(
                                  course['code'],

                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: course['color'],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 7),

                              // COURSE NAME
                              Text(
                                course['name'],

                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              // SEMESTER
                              Row(
                                children: [
                                  Icon(
                                    Icons.school_outlined,
                                    size: 15,
                                    color: Colors.grey.shade600,
                                  ),

                                  const SizedBox(width: 5),

                                  Text(
                                    'Current Semester',

                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // ========================================
                        // ARROW
                        // ========================================
                        Container(
                          width: 36,
                          height: 36,

                          decoration: BoxDecoration(
                            color: course['color'].withOpacity(0.10),
                            shape: BoxShape.circle,
                          ),

                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: course['color'],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // ==================================================
              // QUICK NOTES
              // ==================================================
              const Text(
                'Quick Notes',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: noteController,
                maxLines: 3,

                decoration: InputDecoration(
                  hintText: 'Write your quick note here...',

                  prefixIcon: const Icon(Icons.note_alt),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 12),

              // ==================================================
              // SUBMIT BUTTON
              // ==================================================
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton.icon(
                  onPressed: submitNote,

                  icon: const Icon(Icons.send),

                  label: const Text(
                    'Submit Note',
                    style: TextStyle(fontSize: 16),
                  ),

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              // ==================================================
              // SUBMITTED NOTE
              // ==================================================
              if (submittedNote.isNotEmpty) ...[
                const SizedBox(height: 20),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Icon(Icons.sticky_note_2, color: Colors.indigo),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            submittedNote,

                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // STUDENT INFORMATION ROW
  // ============================================================

  Widget studentInfoRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,

            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),

        Expanded(
          child: Text(
            value,

            textAlign: TextAlign.right,

            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

// ================================================================
// SEARCH DELEGATE
// ================================================================

class CourseSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> courses;

  CourseSearchDelegate(this.courses);

  // ============================================================
  // SEARCH ACTIONS
  // ============================================================

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),

        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  // ============================================================
  // SEARCH BACK BUTTON
  // ============================================================

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),

      onPressed: () {
        close(context, '');
      },
    );
  }

  // ============================================================
  // SEARCH RESULTS
  // ============================================================

  @override
  Widget buildResults(BuildContext context) {
    final results = courses.where((course) {
      final name = course['name'].toString().toLowerCase();

      final code = course['code'].toString().toLowerCase();

      final search = query.toLowerCase();

      return name.contains(search) || code.contains(search);
    }).toList();

    return ListView.builder(
      itemCount: results.length,

      itemBuilder: (context, index) {
        final course = results[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: course['color'].withOpacity(0.12),

            child: Icon(course['icon'], color: course['color']),
          ),

          title: Text(
            course['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          subtitle: Text(course['code']),
        );
      },
    );
  }

  // ============================================================
  // SEARCH SUGGESTIONS
  // ============================================================

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = courses.where((course) {
      final name = course['name'].toString().toLowerCase();

      final code = course['code'].toString().toLowerCase();

      final search = query.toLowerCase();

      return name.contains(search) || code.contains(search);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,

      itemBuilder: (context, index) {
        final course = suggestions[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: course['color'].withOpacity(0.12),

            child: Icon(course['icon'], color: course['color']),
          ),

          title: Text(
            course['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          subtitle: Text(course['code']),

          onTap: () {
            query = course['code'];
            showResults(context);
          },
        );
      },
    );
  }
}
