import 'package:doctory/features/pharmacies/presentation/view_models/pharmacies_cubit.dart';
import 'package:doctory/features/pharmacies/presentation/views/widgets/pharmacies_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class PharmaciesView extends StatelessWidget {
  const PharmaciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PharmaciesCubit>(),
      child: const Scaffold(
        body: SafeArea(child: PharmaciesViewBody()),
      ),
    );
  }
}
