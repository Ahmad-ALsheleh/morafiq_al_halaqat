import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant.dart';
import '../controllers/nav_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColoe,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: goldenColor, size: 35),
            onPressed: () {
              print('هذه الميزة غير متاحة حالياً');
            },
          ),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              width: 30,
              height: 30,
            ),
            SizedBox(width: 5),
            Text(
              'مرافق الحلقات',
              style: TextStyle(color: praimaryColor, fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 65),
          ],
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(right: 17),
          child: CircleAvatar(
            backgroundColor: greyColor,
            child: Icon(Icons.person, color: praimaryColor, size: 29),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: greyColor,
              ),
              width: double.infinity,
              height: 120,
              child: Center(
                child: Text(
                  '\u202E﴿وَرَتِّلِ القُرآنَ تَرتيلًا﴾ِ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'الدروس الأخيرة',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 60),
                Expanded(
                  child: ListTile(
                    trailing: Icon(Icons.arrow_drop_down, size: 25),
                    title: Text(
                      'عرض الكل',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: praimaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 45, color: whiteColoe),
        onPressed: () {},
      ),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changePage,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'البروفايل'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'حلقتي'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'ابحث هنا'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'الإحصائيات'),
        ],
      )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constant.dart';
// import '../../account/controllers/nav_controller.dart';
// import '../../account/views/profile_view.dart';
// import '../controllers/nav_controller.dart';
//
//
// class HomeView extends StatefulWidget {
//   HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   final NavController navController = Get.put(NavController()); // استدعاء الكونترولر
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: whiteColoe,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu, color: goldenColor, size: 35),
//             onPressed: () {
//               print('هذه الميزة غير متاحة حالياً');
//             },
//           ),
//         ],
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//               'assets/images/Logo.png',
//               width: 30,
//               height: 30,
//             ),
//             SizedBox(width: 5),
//             Text(
//               'مرافق الحلقات',
//               style: TextStyle(color: praimaryColor, fontSize: 30, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(width: 65),
//           ],
//         ),
//         centerTitle: true,
//         leading: Padding(
//           padding: const EdgeInsets.only(right: 17),
//           child: CircleAvatar(
//             backgroundColor: greyColor,
//             child: Icon(Icons.person, color: praimaryColor, size: 29),
//           ),
//         ),
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: greyColor,
//               ),
//               width: double.infinity,
//               height: 120,
//               child: Center(
//                 child: Text(
//                   '\u202E﴿وَرَتِّلِ القُرآنَ تَرتيلًا﴾ِ',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 SizedBox(width: 10),
//                 Text(
//                   'الدروس الأخيرة',
//                   style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(width: 60),
//                 Expanded(
//                   child: ListTile(
//                     trailing: Icon(Icons.arrow_drop_down, size: 25),
//                     title: Text(
//                       'عرض الكل',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     onTap: () {},
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: praimaryColor,
//         shape: CircleBorder(),
//         child: Icon(Icons.add, size: 45, color: whiteColoe),
//         onPressed: () {},
//       ),
//
//
//
//       bottomNavigationBar: Obx(
//             () => BottomNavigationBar(
//           currentIndex: navController.selectedIndex.value,
//           onTap: navController.changePage,
//           selectedItemColor: Colors.teal,
//           unselectedItemColor: Colors.grey,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'البروفايل'),
//             BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'حلقتي'),
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
//             BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'ابحث هنا'),
//             BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'الإحصائيات'),
//           ],
//         ),
//       )
//
//     );
//   }
// }

