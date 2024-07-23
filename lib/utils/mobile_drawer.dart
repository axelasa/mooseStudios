import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/header_item.dart';
import '../constants/nav_items.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onNavItemTap});

  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),),
        image: DecorationImage(image: const AssetImage('assets/road.jpg',),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.55), BlendMode.darken)
        ),
      ),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: ListView(
          //shrinkWrap: true,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 20,bottom: 20,),
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.close,color:AppColors.whiteSecondary),),
              ),
            ),
            for(int i = 0; i<navIcons.length; i++)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30
                ),
                titleTextStyle: const TextStyle(
                  color: AppColors.whitePrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                onTap:(){
                  onNavItemTap(i);
                },
                leading: Icon(navIcons[i],color: AppColors.whiteSecondary,),
                title: Text(headerTitles[i]),
              )
          ],
        ),
      ),
    );
  }
}
