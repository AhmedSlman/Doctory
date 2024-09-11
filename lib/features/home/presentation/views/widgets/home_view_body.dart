import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/features/settings/presentation/views/show_dialogs/booking_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/offer_model.dart';
import '../../view_models/home_cubit/home_cubit.dart';
import '../../view_models/home_cubit/home_state.dart';
import 'categories_list_view.dart';
import 'custom_home_appbar.dart';
import 'home_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.getHomeData();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHomeAppBar(),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const CustomCircularProgressIndicator();
                } else if (state is HomeLoaded) {
                  final offers = state.offers;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).categories,
                        style: AppStyles.sBlack15,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      CategoriesListView(
                        categories: state.categories,
                        onCategorySelected: (categoryName) {
                          homeCubit.filterOffersByCategory(categoryName);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        S.of(context).offers,
                        style: AppStyles.sBlack15,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      offers.isEmpty
                          ? Center(child: Text(S.of(context).noOffers)) // No offers message
                          : Expanded(
                        child: CustomOffersGridView(
                          items: offers.map((offer) => OffersModel(
                            title: offer.title,
                            image: offer.image,
                            oldPrice: offer.oldPrice,
                            price: offer.price,
                            clinicName: offer.clinicName,
                            id: offer.id,
                            categoryName: offer.categoryName,
                          )).toList(),
                          buttonText: S.of(context).bookNow,
                          onPressed: (offer) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BlocProvider(
                                  create: (context) => getIt<HomeCubit>(),
                                  child: BookingDialog(offer: offer),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is HomeError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
