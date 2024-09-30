import 'package:doctory/features/home/presentation/view_models/home_cubit/category/category_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offer/offer_cubit.dart';
import 'package:doctory/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<OffersCubit>()..fetchOffers(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
