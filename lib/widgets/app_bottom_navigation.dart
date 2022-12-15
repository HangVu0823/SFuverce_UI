import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/screens/chat/chat_admin/chat_admin.dart';
import 'package:sfuverce_app/screens/delivery/trackorder.dart';
import 'package:sfuverce_app/screens/order_screen/order_screen.dart';
import 'package:sfuverce_app/screens/user_profile/user.dart';
import 'package:sfuverce_app/screens/wallet/wallet.dart';

import '../screens/home_screens/home/home_screen.dart';

// class AppBottomNavigation extends StatefulWidget {
//   @override
//   _AppBottomNavigationState createState() => _AppBottomNavigationState();
// }

// class _AppBottomNavigationState extends State<AppBottomNavigation> {
//   int _selectedIndex = 0;
//   List<dynamic> menuItems = [
//     {
//       'icon': 'assets/icons/home.svg',
//       'label': 'Home',
//     },
//     {
//       'icon': 'assets/icons/box.svg',
//       'label': 'Delivery',
//     },
//     {
//       'icon': 'assets/icons/chat.svg',
//       'label': 'Messages',
//     },
//     {
//       'icon': 'assets/icons/wallet.svg',
//       'label': 'Wallet',
//     },
//     {
//       'icon': 'assets/icons/profile.svg',
//       'label': 'Profile',
//     },
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       showUnselectedLabels: true,
//       unselectedItemColor: Colors.black87,
//       elevation: 32.0,
//       type: BottomNavigationBarType.fixed,
//       selectedLabelStyle: TextStyle(
//         height: 1.5,
//         fontSize: 12,
//       ),
//       unselectedLabelStyle: TextStyle(
//         height: 1.5,
//         fontSize: 12,
//       ),
//       items: menuItems.map((i) {
//         return BottomNavigationBarItem(
//           icon: SvgPicture.asset(i['icon']),
//           activeIcon: SvgPicture.asset(
//             i['icon'],
//             color: primaryColor,
//           ),
//           label: i['label'],
//         );
//       }).toList(),
//       currentIndex: 0,
//       selectedItemColor: primaryColor,
//       onTap: _onItemTapped,
//     );
//   }
// }

class PageNavigation extends StatefulWidget {
  @override
  _PageNavigationState createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  int _selectedIndex = 0;
  List<dynamic> menuItems = [
    {
      'icon': 'assets/icons/home.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/box.svg',
      'label': 'Delivery',
    },
    {
      'icon': 'assets/icons/chat.svg',
      'label': 'Messages',
    },
    {
      'icon': 'assets/icons/wallet.svg',
      'label': 'Wallet',
    },
    {
      'icon': 'assets/icons/profile.svg',
      'label': 'Profile',
    },
  ];

  Widget _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Widget res = null;
    switch (_selectedIndex) {
      case 1:
        {
          res = OrderScreen();
          break;
        }
      case 2:
        {
          res = ChatAdminScreen();
          break;
        }
      case 3:
        {
          res = Wallet();
          break;
        }
      case 4:
        {
          res = UserScreen();
          break;
        }
      default:
        {
          res = HomeScreen();
        }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _onItemTapped(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black87,
          elevation: 32.0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            height: 1.5,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            height: 1.5,
            fontSize: 12,
          ),
          items: menuItems.map((i) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(i['icon']),
              activeIcon: SvgPicture.asset(
                i['icon'],
                color: primaryColor,
              ),
              label: i['label'],
            );
          }).toList(),
          currentIndex: 0,
          selectedItemColor: primaryColor,
          onTap: _onItemTapped,
        ));
  }
}
