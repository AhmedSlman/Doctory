import 'package:doctory/core/utils/app_styles.dart';
import 'package:doctory/core/widgets/custom_circular_progress_indicator.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/category/category_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/category/category_state.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/offers_by_specialization/offers_by_specialization_cubit.dart';
import 'package:doctory/features/home/presentation/view_models/home_cubit/reserve/reserve_cubit.dart';
import 'package:doctory/features/settings/presentation/views/show_dialogs/booking_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'categories_list_view.dart';
import 'custom_home_appbar.dart';
import 'home_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// استيراد الترجمة
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String? categoryName;

  Future<void> _refreshData(BuildContext context) async {
    final categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
    categoriesCubit.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
      onRefresh: () => _refreshData(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeAppBar(),
            Expanded(
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const CustomCircularProgressIndicator();
                  } else if (state is CategoriesSuccess) {
                    final categories = state.categories;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).categories,
                          style: AppStyles.sBlack15,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        CategoriesListView(
                          categories: categories,
                          onCategorySelected: (selectedCategoryName) {
                            // تحديث categoryName عند اختيار فئة جديدة
                            setState(() {
                              categoryName = selectedCategoryName;
                              print(categoryName);
                            });
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          S.of(context).offers,
                          style: AppStyles.sBlack15,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Expanded(
                          flex: 2,
                          child: BlocProvider(
                            create: (context) => getIt<OffersBySpecCubit>(),
                            child: CustomOffersGridView(
                              // تمرير categoryName المحدثة أو الافتراضية
                              categoryName:
                                  categoryName ?? state.categories[0].name,
                             
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is CategoriesFailure) {
                    return Center(child: Text(state.error));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class HomeViewBody extends StatelessWidget {
//   const HomeViewBody({super.key});
//   Future<void> _refreshData(BuildContext context) async {
//     final homeCubit = BlocProvider.of<HomeCubit>(context);
//     homeCubit.getHomeData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final homeCubit = BlocProvider.of<HomeCubit>(context);
//    // homeCubit.getHomeData();
//     return RefreshIndicator(
//       color: AppColors.primaryColor,
//       backgroundColor: AppColors.whiteColor,
//       onRefresh: () => _refreshData(context),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.025),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const CustomHomeAppBar(),
//             Expanded(
//               child: BlocBuilder<HomeCubit, HomeState>(
//                 builder: (context, state) {
//                   if (state is HomeLoading) {
//                     return const CustomCircularProgressIndicator();
//                   } else if (state is HomeLoaded) {
//                     final offers = state.offers;
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           S.of(context).categories,
//                           style: AppStyles.sBlack15,
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                         CategoriesListView(
//                           categories: state.categories,
//                           onCategorySelected: (categoryName) {
//                             homeCubit.filterOffersByCategory(categoryName);
//                           },
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                         Text(
//                           S.of(context).offers,
//                           style: AppStyles.sBlack15,
//                         ),
//                         SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                         offers.isEmpty
//                             ? Center(child: Text(S.of(context).noOffers))
//                             : Expanded(
//                           child: CustomOffersGridView(
//                             items: offers,
//                             buttonText: S.of(context).bookNow,
//                             onPressed: (offer) async {
//                               final userId = FirebaseAuth.instance.currentUser!.uid;
//                               final hasBooked = await homeCubit.hasUserBookedOffer(offer.id, userId);
//                               if (hasBooked) {
//                                 showToast(
//                                   msg: S.of(context).alreadyBooked,
//                                   color: AppColors.redColor,
//                                 );
//                               } else {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return BlocProvider(
//                                       create: (context) => getIt<HomeCubit>(),
//                                       child: BookingDialog(offer: offer),
//                                     );
//                                   },
//                                 );
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     );
//                   } else if (state is HomeError) {
//                     return Center(child: Text(state.message));
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
