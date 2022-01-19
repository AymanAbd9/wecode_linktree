import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'config.dart';
import 'widgets/url_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // container for pfp
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: 200,
                height: 150,
                child: Image.network(imgUrl),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              // status
              Container(
                width: 200,
                height: 30,
                child: const Center(child: Text('looking for a job')),
                color: Colors.grey[200],
              ),
              const SizedBox(
                height: 40,
              ),
              // name, title and location

              Text('${userInfo['name']}'),
              Text('${userInfo['title']}'),
              Text('${userInfo['location']}'),

              // Column(children: getUserInfo(userInfo)),

              const SizedBox(
                height: 40,
              ),

              // seperating line
              const Divider(
                color: Colors.black,
                indent: 50,
                endIndent: 50,
                thickness: 2,
              ),

              const SizedBox(
                height: 30,
              ),

              const Text('bio'),
              Container(
                width: 200,
                height: 70,
                margin: const EdgeInsets.all(10),
                child: Center(child: Text(userInfo['bio']!)),
              ),
              const SizedBox(
                height: 30,
              ),

              // get url widget list then pop them in the list
              ...getUrls(urls),

              // whatsapp and viber buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: generateContactButtons(userContacts),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // List<Widget> getUserInfo(Map<String, String> userInfo) {
  //   return userInfo.entries
  //       .map(
  //         (e) => Text(e.value),
  //       )
  //       .toList();
  // }

  List<Widget> getUrls(Map<String, String> urls) {
    return urls.entries
        .map((e) => UrlCard(title: e.key, url: e.value))
        .toList();
  }
}

List<Widget> generateContactButtons(List<Map<String, String>> userContacts) {
  List<Widget> contactsButtonList = [];
  for (int i = 0; i < userContacts.length; i++) {
    var title = userContacts[i]['title'];
    var number = userContacts[i]['value'];
    var iconUrl = userContacts[i]['iconUrl'];
    contactsButtonList.add(
      IconButton(
        onPressed: () async {
          await launch(title! + number!);
        },
        icon: Image.network(iconUrl!),
      ),
    );
  }
  return contactsButtonList;
}
