import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/bottom_navigation_item.dart';
import 'package:flutter_chat_app/config/app_icons.dart';
import 'package:flutter_chat_app/config/app_strings.dart';
import 'package:flutter_chat_app/pages/home_page.dart';
import 'package:flutter_chat_app/pages/profile_page.dart';
import 'package:flutter_chat_app/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //for making BottomNavigation  floating
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: MyBottomNavigation(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
      ),
    );
  }

  final pages = [
    HomePage(),
    Center(
      child: Text(AppStrings.favorites),
    ),
    Center(
      child: Text('Add Post'),
    ),
    Center(
      child: Text('Messages'),
    ),
    ProfilePage(),
  ];
}

//custom BottomNavigation
enum Menus {
  home,
  favorite,
  add,
  messages,
  user,
}

class MyBottomNavigation extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const MyBottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  Expanded(
                      child: BottomNavigationItem(
                          onPressed: () => onTap(Menus.home),
                          icon: AppIcons.icHome,
                          current: currentIndex,
                          name: Menus.home)),
                  Expanded(
                      child: BottomNavigationItem(
                          onPressed: () => onTap(Menus.favorite),
                          icon: AppIcons.icFavorite,
                          current: currentIndex,
                          name: Menus.favorite)),
                  //fo adding space between buttons
                  Spacer(),
                  Expanded(
                      child: BottomNavigationItem(
                          onPressed: () => onTap(Menus.messages),
                          icon: AppIcons.icMessage,
                          current: currentIndex,
                          name: Menus.messages)),
                  Expanded(
                      child: BottomNavigationItem(
                          onPressed: () => onTap(Menus.user),
                          icon: AppIcons.icUser,
                          current: currentIndex,
                          name: Menus.user)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            //for handling taps
            child: GestureDetector(
              onTap: () => (Menus.add),
              child: Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppIcons.icAdd),
              ),
            ),
          )
        ],
      ),
    );
  }
}

  





//default BottomNavigationBar
// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: MyBottomNavigation(),
//       BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppIcons.icHome),
//             label: AppStrings.home,
//           ),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(AppIcons.icFavorite),
//               label: AppStrings.favorites),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppIcons.icAdd),
//             label: AppStrings.add,
//           ),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(AppIcons.icMessage),
//               label: AppStrings.messages),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppIcons.icUser),
//             label: AppStrings.profile,
//           ),
//         ],
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         backgroundColor: Colors.amber,
//       ),
//     );
//   }

//   final pages = [
//     HomePage(),
//     Center(
//       child: Text(AppStrings.favorites),
//     ),
//     Center(
//       child: Text('Add Post'),
//     ),
//     Center(
//       child: Text('Messages'),
//     ),
//     ProfilePage(),
//   ];
// }