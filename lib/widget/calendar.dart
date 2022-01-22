import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:islamic/style/color.dart';

class Adan extends StatelessWidget {
  const Adan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Cairo start
    final myCoordinatesCairo = Coordinates(
        29.91611, 31.20194); // Replace with your own location lat, lng.
    final paramsCairo = CalculationMethod.egyptian.getParameters();
    paramsCairo.adjustments;
    final prayerTimesCairo = PrayerTimes.today(myCoordinatesCairo, paramsCairo);
// Cairo end
    double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  adanData(
                    text: "الفجر",
                    title: DateFormat.jm().format(prayerTimesCairo.fajr),
                  ),
                  adanData(
                    text: "الشروق",
                    title: DateFormat.jm().format(prayerTimesCairo.sunrise),
                  ),
                  adanData(
                    text: "الظهر",
                    title: DateFormat.jm().format(prayerTimesCairo.dhuhr),
                  ),
                  adanData(
                    text: "العصر",
                    title: DateFormat.jm().format(prayerTimesCairo.asr),
                  ),
                  adanData(
                    text: "المغرب",
                    title: DateFormat.jm().format(prayerTimesCairo.maghrib),
                  ),
                  adanData(
                    text: "العشاء",
                    title: DateFormat.jm().format(prayerTimesCairo.isha),
                  ),
                ],
              ),
            ),
          ),
           Text(
            "مواقيت الصلاه حسب التوقيت المحلي بمدينة القاهره",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget adanData({required String text, required String title}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              2,
              0,
            ),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: AppColors.mainColor,
      ),
      child: Column(children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const Divider(
          color: Colors.white,
          thickness: 5,
          height: 2,
          indent: 5,
          endIndent: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ]),
    );
  }
}
