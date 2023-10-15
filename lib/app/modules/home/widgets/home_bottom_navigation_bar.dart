import 'package:courses_app/app/modules/home/home_store.dart';
import 'package:courses_app/utils/colors_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../utils/list_bottom_bar_item.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Modular.get<HomeStore>();
    return Observer(builder: (context) {
      int currentIndex = homeStore.index;
      return SizedBox(
        height: kBottomNavigationBarHeight,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorsGuide.strongBlue,
          unselectedItemColor: ColorsGuide.sadGray,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 10,
          currentIndex: currentIndex,
          onTap: (value) {
            homeStore.setIndex(value);
          },
          items: itens.map(
            (e) {
              // int index = itens.indexOf(e);
              return BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(e.icon),
                label: '',
              );
            },
          ).toList(),
        ),
      );
    });
  }
}
