import '../provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import '../config/index.dart';
import 'home_page.dart';
import 'categary_page.dart';
import 'personal.dart';
import 'shopingCart.dart';
// 用于屏幕适配 
import 'package:flutter_screenutil/flutter_screenutil.dart'; 

//  index页面使用 tabbar 路由其他子页面
class IndexPage extends StatelessWidget {                 
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(KString.homeTitle),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text(KString.category),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(KString.shopping_cart),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(KString.person),
    ),
  ];

  final List<Widget> tabBodies = [
    new HomePage(),
    new CategaryPage(),
    new ShopingCartPage(),
    new PersonalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // 将屏幕适配初始化；
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(
      // 取到当前索引状态值
      builder: (context, child, val) {
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: bottomTabs,
            currentIndex: currentIndex,
            onTap: (index){
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          )
        );
      }
    );


  }
}