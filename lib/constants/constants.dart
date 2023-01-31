import 'package:chatgpt_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color scaffoldBackgroundColor = Color(0xFF4445654);
Color cardcolor = Color(0xFF444654);

List<String> models = [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
  'Model5',
  'Model6'
];

// List<DropdownMenuItem<String>>? get getModelsItem{
//   List<DropdownMenuItem<String>>? modelsItems = List<DropdownMenuItem<String>>.generate(
//       models.length, (index) => DropdownMenuItem(
//     value: models[index],
//       child: TextWidget(
//         label: models[index],
//         fontSize: 15.0,
//       )
//   ),
//   );
//   return modelsItems;
// }

final chatMessages = [
  {
    'msg' : 'Hello who are you?',
    'chatIndex' : 0,
  },
  {
    'msg' : 'Hello who are you?',
    'chatIndex' : 1,
  },
  {
    'msg' : 'Hello who are you?',
    'chatIndex' : 0,
  },
  {
    'msg' : 'Hello who are you?',
    'chatIndex' : 1,
  },
  {
    'msg' : 'Hello who are you?',
    'chatIndex' : 0,
  },
  {
    'msg' : 'Hello who are you?',
    'chatIndex' : 1,
  },
];