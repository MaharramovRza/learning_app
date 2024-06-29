import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:learning_app/pages/profile/settings/widgets/settings_widgets.dart';

import '../../../global.dart';
import '../../application/bloc/app_blocs.dart';
import '../../application/bloc/app_events.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData(){
    context.read<AppBlocs>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(child:
            BlocBuilder<SettingsBlocs, SettingStates>(
                builder: (context, state) {
          return Column(
            children: [
              settingsButton(context,removeUserData)
            ],
          );
        })));
  }
}
