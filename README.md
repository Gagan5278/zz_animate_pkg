<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

 An example of PageView with page index animation in Flutter. There is way to add images from assets and short description as well. Support for carausal animation.

## Features

 Support local images added in assets. 
 Loading progress anination for high resolution images. 
 Ability to modify page index color, font, style etc.
 

## Getting started

Create a flutter project and in your pubsec.yaml add below dependency 

 ```dependencies:
  zz_animate_pkg: ^0.0.1```

## Usage

first create a List of map (image description and image name in assets folder)as below 
 List<Map<String, String>> imagesModel = [{
    'message': 'Ipsum is simply dummy text',
    'image': '1.jpg',
  },
  {
    'message':
        'There are many variations of passages of Lorem Ipsum.',
    'image': '2.jpg',
  },
  {
    'message':
        'It is a long established fact that a reader will be distracted.',
    'image': '3.jpg',
  },........]
  
  Inside you class, add below code 
  
  
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        imagesArray: imagesModel,
      ),
    );
  }
}


## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
