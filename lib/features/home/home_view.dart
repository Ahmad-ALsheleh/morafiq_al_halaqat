import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../search_view.dart';
import '../../core/constant.dart';
import '../account/views/profile_view.dart';
import '../halaqah/views/my_halaqah_view.dart';
import 'nav_controller.dart';
import '../halaqah_statistics/views/halaqah_statistics_view.dart';
import 'home_main_view.dart';

class HomeView extends StatefulWidget {
  //HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [
    ProfileView(),
    MyHalaqahView(),
    HomeMainView(),
    Searchview(),
    HalaqahStatisticsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: goldenColor, size: 35),
            onPressed: () {
              Get.snackbar(
                "ميزة قيد التطوير",
                "هذه الميزة غير متاحة حالياً",
                snackPosition: SnackPosition.TOP,
                backgroundColor: praimaryColor,
                colorText: whiteColor,
                duration: Duration(seconds: 2),
                borderRadius: 10,
                margin: EdgeInsets.all(10),
                icon: Icon(Icons.info, color: whiteColor, size: 28),
              );
            },
          ),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              width: 35,
              height: 35,
            ),
            SizedBox(width: 10),
            Text(
              'مرافق الحلقات',
              style: TextStyle(color: praimaryColor, fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 65),
          ],
        ),

      ),

      body: IndexedStack(
        index: navController.selectedIndex.value,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changePage,
        selectedItemColor: praimaryColor,
        unselectedItemColor: GgreyColor,
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
