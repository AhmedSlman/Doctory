import 'package:flutter/material.dart';

import 'custom_categories_list_view.item.dart';


class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.05),
      child: SizedBox(
        height: MediaQuery.of(context).size.height *.14,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index)
            {
              return  const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                child:CustomCategoriesListViewItem(),
              );
            }
        ),
      ),
    );
  }
}
