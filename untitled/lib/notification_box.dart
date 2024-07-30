import 'package:flutter/material.dart';

class NotificationBox extends StatefulWidget {
  const NotificationBox({
    super.key,
    this.titleBox = '',
    this.funBox,
    this.iconBox,
  });
  final String titleBox;
  final Function? funBox;
  final String? iconBox;
  @override
  State<NotificationBox> createState() => _NotificationBoxState();
}

class _NotificationBoxState extends State<NotificationBox> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: Text(
          "${widget.titleBox}",
        ),
        trailing: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ),
    );
  }
}
