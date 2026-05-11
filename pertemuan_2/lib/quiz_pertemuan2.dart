import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Uint8List? profileImage;

  String tentang =
      'Saya suka belajar hal baru terutama teknologi dan mobile development.';

  String pendidikan =
      'Universitas Pasundan — Semester 6\nIPK: 3.75';

  String lokasi = 'Bandung, Indonesia';

  String kontak =
      'email@example.com\n+62 812-3456-7890';

  String skills =
      'Flutter • Dart • Firebase • UI/UX';

  Uint8List? pengalamanImage;

  String pengalamanTitle = 'Flutter Developer';

  String pengalamanDesc =
      'Membuat aplikasi mobile menggunakan Flutter dan Firebase.';

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),

      drawer: Drawer(
        child: ListView(
          children: [

            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),

              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),

              onTap: () async {

                Navigator.pop(context);

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditProfilePage(
                      tentang: tentang,
                      pendidikan: pendidikan,
                      lokasi: lokasi,
                      kontak: kontak,
                      skills: skills,
                      profileImage: profileImage,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {

                    tentang = result['tentang'];

                    pendidikan = result['pendidikan'];

                    lokasi = result['lokasi'];

                    kontak = result['kontak'];

                    skills = result['skills'];

                    profileImage = result['image'];
                  });
                }
              },
            ),

            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Edit Pengalaman'),

              onTap: () async {

                Navigator.pop(context);

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditExperiencePage(
                      title: pengalamanTitle,
                      desc: pengalamanDesc,
                      image: pengalamanImage,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {

                    pengalamanTitle = result['title'];

                    pengalamanDesc = result['desc'];

                    pengalamanImage = result['image'];
                  });
                }
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            CircleAvatar(
              radius: 55,

              backgroundImage:
              profileImage != null
                  ? MemoryImage(profileImage!)
                  : const AssetImage(
                'assets/images/profile.jpg',
              ) as ImageProvider,
            ),

            const SizedBox(height: 12),

            const Text(
              'I Made Surya Kartika',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () async {

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditProfilePage(
                      tentang: tentang,
                      pendidikan: pendidikan,
                      lokasi: lokasi,
                      kontak: kontak,
                      skills: skills,
                      profileImage: profileImage,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {

                    tentang = result['tentang'];

                    pendidikan = result['pendidikan'];

                    lokasi = result['lokasi'];

                    kontak = result['kontak'];

                    skills = result['skills'];

                    profileImage = result['image'];
                  });
                }
              },

              icon: const Icon(Icons.edit),

              label: const Text('Edit Profile'),
            ),

            const SizedBox(height: 24),

            Row(
              children: const [

                Expanded(
                  child: _StatBox(
                    label: 'Post',
                    value: '12',
                  ),
                ),

                Expanded(
                  child: _StatBox(
                    label: 'Teman',
                    value: '128',
                  ),
                ),

                Expanded(
                  child: _StatBox(
                    label: 'Like',
                    value: '1.2K',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            _SectionCard(
              icon: Icons.info_outline,
              title: 'Tentang',
              content: tentang,
            ),

            _SectionCard(
              icon: Icons.school,
              title: 'Pendidikan',
              content: pendidikan,
            ),

            _SectionCard(
              icon: Icons.location_on,
              title: 'Lokasi',
              content: lokasi,
            ),

            _SectionCard(
              icon: Icons.email,
              title: 'Kontak',
              content: kontak,
            ),

            _SectionCard(
              icon: Icons.code,
              title: 'Skills',
              content: skills,
            ),

            Card(
              margin: const EdgeInsets.only(top: 12),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(
                      'Pengalaman',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),

                      child:
                      pengalamanImage != null
                          ? Image.memory(
                        pengalamanImage!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                          : Image.asset(
                        'assets/images/pengalaman.jpg',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      pengalamanTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(pengalamanDesc),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {

  final String label;
  final String value;

  const _StatBox({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final String content;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Icon(
              icon,
              color: Colors.blue,
              size: 28,
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {

  final String tentang;
  final String pendidikan;
  final String lokasi;
  final String kontak;
  final String skills;
  final Uint8List? profileImage;

  const EditProfilePage({
    super.key,
    required this.tentang,
    required this.pendidikan,
    required this.lokasi,
    required this.kontak,
    required this.skills,
    required this.profileImage,
  });

  @override
  State<EditProfilePage> createState() =>
      _EditProfilePageState();
}

class _EditProfilePageState
    extends State<EditProfilePage> {

  late TextEditingController tentangC;
  late TextEditingController pendidikanC;
  late TextEditingController lokasiC;
  late TextEditingController kontakC;
  late TextEditingController skillsC;

  Uint8List? image;

  @override
  void initState() {
    super.initState();

    tentangC =
        TextEditingController(text: widget.tentang);

    pendidikanC =
        TextEditingController(text: widget.pendidikan);

    lokasiC =
        TextEditingController(text: widget.lokasi);

    kontakC =
        TextEditingController(text: widget.kontak);

    skillsC =
        TextEditingController(text: widget.skills);

    image = widget.profileImage;
  }

  Future pickImage() async {

    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {

      final bytes = await picked.readAsBytes();

      setState(() {
        image = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            GestureDetector(
              onTap: pickImage,

              child: CircleAvatar(
                radius: 55,

                backgroundImage:
                image != null
                    ? MemoryImage(image!)
                    : const AssetImage(
                  'assets/images/profile.jpg',
                ) as ImageProvider,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: tentangC,

              decoration: const InputDecoration(
                labelText: 'Tentang',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: pendidikanC,

              decoration: const InputDecoration(
                labelText: 'Pendidikan',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: lokasiC,

              decoration: const InputDecoration(
                labelText: 'Lokasi',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: kontakC,

              decoration: const InputDecoration(
                labelText: 'Kontak',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: skillsC,

              decoration: const InputDecoration(
                labelText: 'Skills',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                Navigator.pop(context, {

                  'tentang': tentangC.text,

                  'pendidikan': pendidikanC.text,

                  'lokasi': lokasiC.text,

                  'kontak': kontakC.text,

                  'skills': skillsC.text,

                  'image': image,
                });
              },

              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditExperiencePage extends StatefulWidget {

  final String title;
  final String desc;
  final Uint8List? image;

  const EditExperiencePage({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
  });

  @override
  State<EditExperiencePage> createState() =>
      _EditExperiencePageState();
}

class _EditExperiencePageState
    extends State<EditExperiencePage> {

  late TextEditingController titleC;
  late TextEditingController descC;

  Uint8List? image;

  @override
  void initState() {
    super.initState();

    titleC =
        TextEditingController(text: widget.title);

    descC =
        TextEditingController(text: widget.desc);

    image = widget.image;
  }

  Future pickImage() async {

    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {

      final bytes = await picked.readAsBytes();

      setState(() {
        image = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Edit Pengalaman'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            GestureDetector(
              onTap: pickImage,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),

                child:
                image != null
                    ? Image.memory(
                  image!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  'assets/images/pengalaman.jpg',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: titleC,

              decoration: const InputDecoration(
                labelText: 'Judul Pengalaman',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: descC,
              maxLines: 3,

              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                Navigator.pop(context, {

                  'title': titleC.text,

                  'desc': descC.text,

                  'image': image,
                });
              },

              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}