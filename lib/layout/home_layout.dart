import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamic/Google_Ads/ads_manager.dart';
import 'package:islamic/bloc/cubit/islami_cubit.dart';
import 'package:islamic/bloc/stats/islami_stats.dart';
import 'package:islamic/style/color.dart';
import 'package:islamic/view/evening.dart';
import 'package:islamic/view/istighfar.dart';
import 'package:islamic/view/misbha.dart';
import 'package:islamic/view/morning.dart';
import 'package:islamic/widget/calendar.dart';
import 'package:islamic/widget/component.dart';
import 'package:islamic/widget/container_home.dart';
import 'package:islamic/widget/grid_view.dart';
import 'package:islamic/widget/my_drwer.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  // late BannerAd _bannerAd;
  // bool _adIsLoaded= false;
  // @override
  // void initState() {
  //   super.initState();
  //   _initGoogleMobileAds();
  //
  //   _bannerAd = BannerAd(
  //     adUnitId: AdsManager.bannerAdUnitId,
  //     size: AdSize.banner,
  //     request:const AdRequest(), listener: BannerAdListener(
  //     onAdFailedToLoad: (ad, error){
  //       setState(() {
  //         _adIsLoaded = false;
  //       });
  //     },
  //       onAdLoaded: (ad){
  //       setState(() {
  //         _adIsLoaded = true;
  //       });
  //     }
  //   ),
  //   );
  //   _bannerAd.load();
  // }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    List<String> title = ['اذكار المساء', 'اذكار الصباح', "مسبحة", 'استغفار'];
    List<String> imagePath = [
      'assets/json/muslem.json',
      'assets/json/muslim2.json',
      "assets/json/misbha.json",
      'assets/json/istigfar.json',
    ];
    List<Widget> pages = [
      const Evening(),
      const Morning(),
      const Misbha(),
      const Istigfar(),
    ];
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: h(context) / 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: BlocConsumer<IclamicCubit, IslamicState>(
                  listener: (_, state) {},
                  builder: (_, state) {
                    IclamicCubit cubit = IclamicCubit.get(context);
                    List<String> text = [
                      "عدد التسبيحات",
                      "عدد الدورات",
                      "الاستغفار"
                    ];
                    List call = [
                      cubit.count.toString(),
                      cubit.roll.toString(),
                      cubit.countIs.toString()
                    ];
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: text.length,
                      itemBuilder: (context, index) {
                        return HomeContainer(call[index], text[index]);
                      },
                    );
                  },
                )),
            Text(
              "مواقيت الصلاه",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(
                          2,
                          2,
                        )),
                    Shadow(color: AppColors.mainColor, blurRadius: 10)
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Adan(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: h(context)/2,
              child: Expanded(
                flex: 6,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: title.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        navigateTo(context: context, widget: pages[index]);
                      },
                      child: GridViewContainer(
                        title: title[index],
                        image: imagePath[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget BannerAdWidget(){
  //   if(_adIsLoaded){
  //     return Container(
  //       margin: const EdgeInsets.all(8),
  //       width: _bannerAd.size.width.toDouble(),
  //       height: _bannerAd.size.height.toDouble(),
  //       child: AdWidget(
  //         ad: _bannerAd,
  //       ),
  //     );
  //   }else{
  //     return Container();
  //   }
  // }
  //
  // Future<InitializationStatus> _initGoogleMobileAds(){
  //   return MobileAds.instance.initialize();
  // }

}
