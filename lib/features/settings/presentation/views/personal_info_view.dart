import 'package:doctory/features/settings/presentation/views/widgets/personal_info_view_body.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: PersonalInfoViewBody(),
    ));
  }
}
