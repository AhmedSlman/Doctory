import 'package:doctory/features/pharmacies/presentation/views/widgets/pharmacies_view_body.dart';
import 'package:flutter/material.dart';

class PharmaciesView extends StatelessWidget {
  const PharmaciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: PharmaciesViewBody()),
    );
  }
}
