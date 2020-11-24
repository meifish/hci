import 'package:flutter/material.dart';

Widget PopupMenu() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            "Edit",
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Delete",
          ),
        ),
      ],
      offset: Offset(0, 100),
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      elevation: 4,
      padding: EdgeInsets.fromLTRB(0, 20, 10, 5),
    );
