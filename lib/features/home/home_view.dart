import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../search_view.dart';
import '../../core/constant.dart';
import '../account/views/profile_view.dart';
import '../students/views/students_view.dart';
import 'nav_controller.dart';
import '../halaqah_statistics/views/halaqah_statistics_view.dart';
import '../lessons/views/lesson_view.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [
    ProfileView(),
    StudentsView(),
    LessonView(),
    Searchview(),
    HalaqahStatisticsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  width: 28,
                  height: 24,
                ),
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
                  style: TextStyle(
                      color: praimaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
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
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/profile.svg',
                    width: 16,
                    height: 18,
                    colorFilter: ColorFilter.mode(GgreyColor, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset('assets/icons/profile.svg',
                    width: 16,
                    height: 18,
                    colorFilter:
                        ColorFilter.mode(praimaryColor, BlendMode.srcIn)),
                label: 'البروفايل',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/my_halaqah.svg',
                    width: 22.75,
                    height: 22.75,
                    colorFilter: ColorFilter.mode(GgreyColor, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset('assets/icons/my_halaqah.svg',
                    width: 22.75,
                    height: 22.75,
                    colorFilter:
                        ColorFilter.mode(praimaryColor, BlendMode.srcIn)),
                label: 'حلقتي',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/home.svg',
                    width: 23,
                    height: 23,
                    colorFilter: ColorFilter.mode(GgreyColor, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset('assets/icons/home.svg',
                    width: 23,
                    height: 23,
                    colorFilter:
                        ColorFilter.mode(praimaryColor, BlendMode.srcIn)),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/search.svg',
                    width: 22.51,
                    height: 22.51,
                    colorFilter: ColorFilter.mode(GgreyColor, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset('assets/icons/search.svg',
                    width: 22.51,
                    height: 22.51,
                    colorFilter:
                        ColorFilter.mode(praimaryColor, BlendMode.srcIn)),
                label: 'ابحث هنا',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/statistics.svg',
                    width: 23,
                    height: 19.82,
                    colorFilter: ColorFilter.mode(GgreyColor, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset('assets/icons/statistics.svg',
                    width: 23,
                    height: 19.82,
                    colorFilter:
                        ColorFilter.mode(praimaryColor, BlendMode.srcIn)),
                label: 'الإحصائيات',
              ),
            ],
          )),
    );
  }
}
