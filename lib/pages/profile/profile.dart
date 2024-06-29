import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/pages/profile/widgets/profile_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
    );
  }
}
