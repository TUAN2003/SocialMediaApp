import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTabScreen extends StatefulWidget {
  const MyTabScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabScreenState createState() => _MyTabScreenState();
}

class _MyTabScreenState extends State<MyTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            child: const Text(
              "SocialMedia",
              style: TextStyle(
                  fontFamily: "SpaceMono",
                  fontSize: 30.0,
                  color: Colors.indigoAccent),
            )),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Home', icon: Icon(Icons.mail)),
            Tab(text: 'Contact', icon: Icon(Icons.perm_contact_cal_rounded)),
            Tab(text: 'Profile', icon: Icon(Icons.person_2_rounded)),
          ],
          labelColor: Colors.indigoAccent,
        ),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: _buildListView()),
          const Center(child: Text('Content of Contact')),
          const Center(child: Text('Content of Profile')),
        ],
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text('item #$index'),
          leading: const Icon(Icons.thumb_up),
          iconColor: Colors.blueAccent,
          onTap: () => {
            Fluttertoast.showToast(
                msg: 'liked $index',
                toastLength: Toast.LENGTH_SHORT,
                fontSize: 18,
                textColor: Colors.redAccent)
          },
        );
      },
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is the Second Screen',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Quay lại FirstScreen khi nút được nhấn
                Navigator.pop(context);
              },
              child: const Text('Back to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
