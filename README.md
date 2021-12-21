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
Package support for local and network image both.

## Features

Support local images added in assets.
Support for network images.
Loading progress anination for high resolution images.
Ability to modify page index color, font, style etc.

## Getting started

Create a flutter project and in your pubsec.yaml add below dependency

```dependencies:
 zz_animate_pkg: ^0.0.1
```

## Usage

first create a List of map (image description and image name in assets/images/ folder)as below

```
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
```

For network images, create a list of map<String, String> as below

```
const List<Map<String, String>> networkImagesModel = [
{
  'message': 'Ipsum is simply dummy text of the printing',
  'image': 'https://images.pexels.com/photos/624015/pexels-photo-624015.jpeg',
},
{
  'message':
      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form',
  'image':
      'https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg',
},....
```

Inside you class, add below code for Local images

```
  void main() {
   runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Pageview Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
     ),
     home: HomeScreen(
        imagesArray: imagesModel,
      ),
    );
  }
}
```

For adding viewPort support

```
  void main() {
   runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Pageview Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
     ),
     home: HomeScreen(
        imagesArray: imagesModel,
        isViewFraction: true,
      ),
    );
  }
}
```

For network image support

```
  void main() {
   runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Pageview Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
     ),
     home: HomeScreen(
        imagesArray: networkImagesModel,
      ),
    );
  }
}
```

## Additional information

HomeScreen parameters

```
isNetowrkImage: By deafult 'false'. pass as 'true' value if network image support requires.
isViewFraction: By deafult 'false'. Make 'true' if carusal view support requires.

```
