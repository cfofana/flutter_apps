import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:share_plus/share_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  runApp(MyApp(initialLink: initialLink));
}

class MyApp extends StatefulWidget {
  final PendingDynamicLinkData? initialLink;
  const MyApp({Key? key, this.initialLink}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? path;
  @override
  void initState() {
    if (widget.initialLink != null) {
      path = widget.initialLink!.link.path;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Demonstrate p-->' + path.toString(),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(primary: Colors.green),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.share),
                    Text('Share with friends'),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () async {
                  // String url = 'https://ceesayshare.page.link/share-stuff';
                  // await Share.share(url);
                  final dynamicLinkParams = DynamicLinkParameters(
                    link: Uri.parse(
                        'https://www.ceesayfofana.com/book1'), //for web browser
                    uriPrefix: 'https://ceesayshare.page.link', // live url
                    androidParameters: AndroidParameters(
                      packageName: 'com.example.share',
                      fallbackUrl: Uri.parse('https://myandroidapp.link'),
                    ),
                    iosParameters: IOSParameters(
                      bundleId: 'com.example.share123',
                      fallbackUrl: Uri.parse('https://myIOSapp.link'),
                    ),
                  );
                  Uri link = await FirebaseDynamicLinks.instance
                      .buildLink(dynamicLinkParams);
                  print(link);
                  Share.share(link.toString());
                },
                child: Row(
                  children: [
                    Icon(Icons.share),
                    Text('Share'),
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
