import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Contact Keeper'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
