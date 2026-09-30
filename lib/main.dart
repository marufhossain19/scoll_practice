import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class UserModel {
  UserModel({required this.name, required this.msg});
  final String name;
  final String msg;
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> users = [
    UserModel(name: 'Mehedi', msg: 'Hii!'),
    UserModel(name: 'Maria', msg: 'Hii!'),
    UserModel(name: 'Akash', msg: 'Hii!'),
    UserModel(name: 'Nisa', msg: 'Hii!'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          centerTitle: true,
          elevation: 4,
        ),
        body: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return UserCard.withValue(
              name: users[index].name,
              msg: users[index].msg,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}

class GridViewBuilderExample extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return UserCard.card();
      },
    );
  }
}

class GridViewExample extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      children: [
        UserCard.card(),
        UserCard.card(),
        UserCard.card(),
        UserCard.card(),
        UserCard.card(),
        UserCard.card(),
      ],
    );
  }
}

class ListViewBuilderExample extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return UserCard();
      },
    );
  }
}

class ListViewExample extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        UserCard(),
        UserCard(),
        UserCard(),
        UserCard(),
        UserCard(),
        UserCard(),
        UserCard(),
        UserCard(),
        UserCard(),
      ],
    );
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            UserCard(),
            UserCard(),
            UserCard(),
            UserCard(),
            UserCard(),
            UserCard(),
            UserCard(),
            UserCard(),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key}) : isCard = false, name = null, msg = null;
  const UserCard.card({super.key}) : isCard = true, name = null, msg = null;
  const UserCard.withValue({super.key, required this.name, required this.msg})
    : isCard = false;

  final bool isCard;
  final String? name;
  final String? msg;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double width = isCard ? size.width * .40 : .infinity;

    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      child: Flex(
        direction: isCard ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 30),
          isCard ? SizedBox(height: 16) : SizedBox(width: 16),
          Column(
            crossAxisAlignment: isCard
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                name ?? 'Maruf Hossain',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                msg ?? 'Sent you a text',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
