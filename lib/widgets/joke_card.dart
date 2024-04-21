import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/models/joke.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({super.key, required this.joke});

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 300,
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              joke.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  joke.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Карточка с изображением'),
//         ),
//         body: CardWithImageAndText(),
//       ),
//     );
//   }
// }

// class CardWithImageAndText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200, // Высота карточки
//       margin: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: Offset(0, 3), // изменение положения тени
//           ),
//         ],
//       ),
//       child: Stack(
//         children: <Widget>[
//           // Изображение на заднем фоне
//           Positioned.fill(
//             child: Opacity(
//               opacity: 0.7, // Прозрачность изображения
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: AssetImage('assets/background_image.jpg'), // ваш путь к изображению
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Текст внизу
//           Positioned(
//             left: 16,
//             bottom: 16,
//             child: Text(
//               'Ваш текст',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
