import 'package:flutter/material.dart';

enum SingingCharacter { today, tomorrow, upcomming }

// ignore: must_be_immutable
class RadioCategoryButton extends StatefulWidget {
  int currentTap;
  RadioCategoryButton({Key? key, required this.currentTap}) : super(key: key);

  @override
  State<RadioCategoryButton> createState() => _RadioCategoryButtonState();
}

class _RadioCategoryButtonState extends State<RadioCategoryButton> {
  SingingCharacter? _character = SingingCharacter.today;

  @override
  void initState() {
    super.initState();

    switch (widget.currentTap) {
      case 0:
        _character = SingingCharacter.today;
        break;
      case 1:
        _character = SingingCharacter.tomorrow;
        break;
      case 2:
        _character = SingingCharacter.upcomming;
        break;
      default:
        _character = SingingCharacter.today;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text('Today'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.today,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        ListTile(
          title: const Text('Tomorrow'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.tomorrow,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Upcoming'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.upcomming,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
