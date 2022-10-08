import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

void main() {
  runApp(const MyApp());
}

final themeMode = ValueNotifier(2);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeMode,
      builder: ((context, value, child) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => CarouselDemoHome(),
            '/basic': (ctx) => BasicDemo(),
            '/nocenter': (ctx) => NoCenterDemo(),
            '/image': (ctx) => ImageSliderDemo(),
            '/complicated': (ctx) => ComplicatedImageDemo(),
            '/enlarge': (ctx) => EnlargeStrategyDemo(),
            '/manual': (ctx) => ManuallyControlledSlider(),
            // '/noloop': (ctx) => NoonLoopingDemo(),
            // '/vertical': (ctx) => VerticalSliderDemo(),
            // '/fullscreen': (ctx) => FullscreenSliderDemo(),
            // '/ondemand': (ctx) => OnDemandCarouselDemo(),
            // '/indicator': (ctx) => CarouselWithIndicatorDemo(),
            // '/prefetch': (ctx) => PrefetchImageDemo(),
            // '/reason': (ctx) => CarouselChangeReasonDemo(),
            // '/position': (ctx) => KeepPageviewPositionDemo(),
            // '/multiple': (ctx) => MultipleItemDemo(),
          },
        );
      }),
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  final Color? color;
  DemoItem(this.title, this.route, {this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      tileColor: color,
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Demo'),
        actions: [
          IconButton(
            onPressed: () {
              themeMode.value = themeMode.value == 1 ? 2 : 1;
              print(themeMode.value);
            },
            icon: Icon(Icons.nightlight_round),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          DemoItem('Basic demo', '/basic'),
          DemoItem('No center mode demo', '/nocenter'),
          DemoItem('Image carousel slider', '/image'),
          DemoItem('More complicated image slider', '/complicated'),
          DemoItem('Enlarge strategy demo slider', '/enlarge'),
          DemoItem('Manually controlled slider', '/manual'),
          // DemoItem('Noon-looping carousel slider', '/noloop'),
          // DemoItem('Vertical carousel slider', '/vertical'),
          // DemoItem('Fullscreen carousel slider', '/fullscreen'),
          // DemoItem('Carousel with indicator controller demo', '/indicator'),
          // DemoItem('On-demand carousel slider', '/ondemand'),
          // DemoItem('Image carousel slider with prefetch demo', '/prefetch'),
          // DemoItem('Carousel change reason demo', '/reason'),
          // DemoItem('Keep pageview position demo', '/position'),
          // DemoItem('Multiple item in one screen demo', '/multiple'),
        ],
      ),
    );
  }
}

class BasicDemo extends StatelessWidget {
  const BasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Demo'),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(),
          items: list
              .map((item) => Container(
                    child: Center(child: Text(item.toString())),
                    color: Colors.green,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class NoCenterDemo extends StatelessWidget {
  const NoCenterDemo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        title: Text('No Center Demo'),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(disableCenter: true),
          items: list
              .map((item) => Container(
                    child: Text(item.toString()),
                    color: Colors.green,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  const ImageSliderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Slider Demo'),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(),
          items: imgList
              .map(
                (item) => Container(
                  child: Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Center Demo'),
      ),
    );
  }
}

class EnlargeStrategyDemo extends StatelessWidget {
  const EnlargeStrategyDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Center Demo'),
      ),
    );
  }
}

class ManuallyControlledSlider extends StatelessWidget {
  const ManuallyControlledSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Center Demo'),
      ),
    );
  }
}
