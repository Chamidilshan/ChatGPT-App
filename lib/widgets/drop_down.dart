import 'package:flutter/material.dart';
import 'package:chatgpt_app/constants/constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String currentModels  = 'Model1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
        iconEnabledColor: Colors.white,
        items: getModelsItem,
        value: currentModels,
        onChanged: (value) {
          setState(() {
            currentModels = value.toString();
          });
        }
    );
  }
}
