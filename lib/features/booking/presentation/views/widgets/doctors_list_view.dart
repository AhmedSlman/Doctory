
import 'package:flutter/material.dart';

import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index)=>Padding(
        padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height *0.019),
        child: const DoctorsListViewItem(),
      ),
      itemCount: 10,
      physics:const BouncingScrollPhysics(),


    );
  }
}
