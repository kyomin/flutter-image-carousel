import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      // 마지막 페이지에 도달했다면 첫 페이지로
      if (nextPage > 4) {
        nextPage = 0;
      }

      // 실제로 컨트롤러를 이용해 페이지를 이동시키는 작업을 진행한다.
      // animateToPage
      // ㄴ 첫 번째 인자는 이동하고 싶은 페이지
      // ㄴ 두 번째 인자는 페이지가 이동되는 애니메이션이 진행되는 속도
      // ㄴ 세 번째 인자는 화면이 이동되는 스타일
      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    super.dispose();

    if (timer != null) {
      timer!.cancel();
    }

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: controller,
      children: [1, 2, 3, 4, 5]
          .map((number) => Image.asset(
                'asset/img/image_$number.jpeg',
                fit: BoxFit.cover,
              ))
          .toList(),
    ));
  }
}
