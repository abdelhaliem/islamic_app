import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/bloc/stats/islami_stats.dart';
import 'package:islamic/layout/home_layout.dart';
import 'package:islamic/model/evening_data.dart';
import 'package:islamic/model/evening_dooa_data.dart';
import 'package:islamic/model/morning_data.dart';
import 'package:islamic/model/morning_dooa_data.dart';
import 'package:islamic/style/color.dart';
import 'package:islamic/widget/component.dart';
import 'package:lottie/lottie.dart';

class IclamicCubit extends Cubit<IslamicState> {
  IclamicCubit() : super(IslamicInitialState());

  static IclamicCubit get(context) => BlocProvider.of(context);

  int countIs = 0;
  String nameIs = 'استغفر الله ';

  void increment() {
    countIs++;
    emit(IslamicCounterlState());
  }

  // Misbha
  int count = 0;
  int roll = 0;
  String name = 'سبحان الله';

  void counterInc() {
    if (count == 33) {
      name = "الحمد لله";
    }
    if (count == 66) {
      name = "الله اكبر";
    }
    if (count == 99) {
      name = "لا إله إلا الله";
    }
    if (count == 100) {
      roll++;
      count = 0;
      name = "سبحان الله";

    } else {
      count += 0;
    }
    count++;
    emit(IslamicCounterMlState());
  }

  void rollStart() {
    roll = 0;
    count = 0;
    emit(IslamicRollState());
  }

// Morning Dooa

  List<MorningData> morningData = [
    MorningData(
        id: 1,
        counter: 1,
        data:
            '( أَصبَحْنا على فِطرةِ الإسلامِ، وعلى كَلِمةِ الإخلاصِ، وعلى دِينِ نَبيِّنا محمَّدٍ صلَّى اللهُ عليه وسلَّمَ، وعلى مِلَّةِ أبِينا إبراهيمَ، حَنيفًا مُسلِمًا، وما كان مِنَ المُشرِكينَ )'),
    MorningData(
        id: 2,
        counter: 3,
        data:
            '( بسمِ اللهِ الذي لا يَضرُ مع اسمِه شيءٌ في الأرضِ ولا في السماءِ وهو السميعُ العليمِ )'),
    MorningData(
        id: 3,
        counter: 1,
        data:
            '( سبحانَ اللَّهِ وبحمدِه لا قوَّةَ إلَّا باللَّهِ ما شاءَ اللَّهُ كانَ وما لم يشأ لم يَكن أعلمُ أنَّ اللَّهَ على كلِّ شيءٍ قديرٌ وأنَّ اللَّهَ قد أحاطَ بِكلِّ شيءٍ علمًا )'),
    MorningData(
        id: 4,
        counter: 1,
        data:
            '( اللَّهمَّ بِكَ أصبَحنا، وبِكَ أمسَينا، وبِكَ نحيا وبِكَ نموتُ وإليكَ المصيرُُ )'),
    MorningData(
        id: 5,
        counter: 1,
        data:
            '( رَضيتُ باللَّهِ ربًّا، وبالإسلامِ دينًا، وبِمُحمَّدٍ رسولًا )'),
    MorningData(
        id: 6,
        counter: 1,
        data:
            '( اللَّهمَّ عالِمَ الغَيبِ والشَّهادةِ، فاطرَ السَّمواتِ والأرضِ رَبَّ كلِّ شيءٍ ومَليكَهُ أشهدُ أن لا إلَهَ إلَّا أنتَ أعوذُ بِكَ مِن شرِّ نفسي وشرِّ الشَّيطانِ وشِركِهِ )'),
    MorningData(
        id: 7,
        counter: 1,
        data:
            '( اللَّهمَّ ما أصبحَ بي من نعمةٍ أو بأحدٍ من خلقِكَ فمنكَ وحدَكَ لا شريكَ لكَ فلكَ الحمدُ ولكَ الشُّكرُ )'),
    MorningData(
        id: 8,
        counter: 3,
        data:
            '( سُبْحَانَ اللهِ وَبِحَمْدِهِ، عَدَدَ خَلْقِهِ وَرِضَا نَفْسِهِ وَزِنَةَ عَرْشِهِ وَمِدَادَ كَلِمَاتِهِ )'),
    MorningData(
        id: 9,
        counter: 1,
        data:
            '( اللَّهُمَّ إنِّي أصبَحتُ أُشهِدُك، وأُشهِدُ حَمَلةَ عَرشِكَ، ومَلائِكَتَك، وجميعَ خَلقِكَ: أنَّكَ أنتَ اللهُ لا إلهَ إلَّا أنتَ، وأنَّ مُحمَّدًا عبدُكَ ورسولُكَ )'),
    MorningData(
        id: 10,
        counter: 1,
        data:
            '( أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُ بِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر )'),
    MorningData(
        id: 11,
        counter: 1,
        data:
            '( أستغفرُ اللهَ العظيمَ الذي لا إلهَ إلَّا هو الحيَّ القيومَ وأتوبُ إليه )'),
    MorningData(
        id: 12,
        counter: 1,
        data:
            '( لا إلهَ إلَّا اللهُ وحدَه لا شريكَ له له الملكُ وله الحمدُ وهو على كلِّ شيءٍ قديرٌ )'),
  ];

// Evening Dooa
  List<EveningData> eveningData = [
    EveningData(
      id: 1,
      data:
          "( بسمِ اللهِ الذي لا يَضرُ مع اسمِه شيءٌ في الأرضِ ولا في السماءِ وهو السميعُ العليمِ )",
      counter: 3,
    ),
    EveningData(
        id: 2,
        data:
            "(رَضِيتُ بِاللهِ رَبًّا، وَبِالْإِسْلَامِ دِينًا، وَبِمُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ نَبِيًّا، إِلَّا كَانَ حَقًّا عَلَى اللهِ أَنْ يُرْضِيَهُ يَوْمَ الْقِيَامَةِ)",
        counter: 1),
    EveningData(
        id: 3,
        data:
            "(اللَّهمَّ بِكَ أمسَينا وبِكَ أصبَحنا وبِكَ نحيا وبِكَ نموتُ وإليكَ المصير)",
        counter: 1),
    EveningData(
        id: 4,
        data:
            "(سُبْحَانَ اللهِ وَبِحَمْدِهِ، عَدَدَ خَلْقِهِ وَرِضَا نَفْسِهِ وَزِنَةَ عَرْشِهِ وَمِدَادَ كَلِمَاتِهِ)",
        counter: 1),
    EveningData(
        id: 5,
        data:
            "(اللَّهُمَّ إنِّي أمسيت أُشهِدُك، وأُشهِدُ حَمَلةَ عَرشِكَ، ومَلائِكَتَك، وجميعَ خَلقِكَ: أنَّكَ أنتَ اللهُ لا إلهَ إلَّا أنتَ، وأنَّ مُحمَّدًا عبدُكَ ورسولُكَ)",
        counter: 1),
    EveningData(
        id: 6,
        data:
            "(اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد، فقد جاء في الحديث: مَن صلى عَلَيَّ حين يُصْبِحُ عَشْرًا، وحين يُمْسِي عَشْرًا، أَدْرَكَتْه شفاعتي يومَ القيامةِ)",
        counter: 1),
    EveningData(
        id: 7,
        data:
            "(لا إلهَ إلَّا اللهُ وحدَه لا شريكَ له له الملكُ وله الحمدُ وهو على كلِّ شيءٍ قديرٌ).",
        counter: 1),
    EveningData(
        id: 8,
        data:
            "(أمسَيْنا على فِطرةِ الإسلامِ وعلى كَلِمةِ الإخلاصِ وعلى دينِ نبيِّنا محمَّدٍ صلَّى اللهُ عليه وسلَّم وعلى مِلَّةِ أبينا إبراهيمَ حنيفًا مسلمًا وما كان مِنَ المشركينَ)",
        counter: 1),
    EveningData(
        id: 9,
        data:
            "(اللَّهمَّ عافِني في بدَني اللَّهمَّ عافِني في سمعي اللَّهمَّ عافِني في بصري لا إلهَ إلَّا أنت، اللَّهمَّ إنِّي أعوذُ بِكَ منَ الكُفْرِ والفقرِ اللَّهمَّ إنِّي أعوذُ بكَ من عذابِ القبرِ لا إلهَ إلَّا أنت)",
        counter: 3),
  ];

// Evening
  List<EveningDooaData> eveningDooaData = [
    EveningDooaData(
        id: 1,
        data:
            "(اللَّهمَّ عافِني في بدَني اللَّهمَّ عافِني في سمعي اللَّهمَّ عافِني في بصري لا إلهَ إلَّا أنت، اللَّهمَّ إنِّي أعوذُ بِكَ منَ الكُفْرِ والفقرِ اللَّهمَّ إنِّي أعوذُ بكَ من عذابِ القبرِ لا إلهَ إلَّا أنت)",
        counter: 3),
    EveningDooaData(
        id: 2,
        data:
            "(اللهم إنا نعوذُ بك من أن نُشرِكَ بك شيئًا نعلَمُه، و نستغفرُك لما لا نعلمُه)",
        counter: 1),
    EveningDooaData(
        id: 3,
        data:
            "من قال: أستغفرُ اللهَ العظيمَ الذي لا إلهَ إلَّا هو الحيَّ القيومَ وأتوبُ إليه؛ غُفِرَ له وإنْ كان فرَّ من الزحفِ)",
        counter: 1),
    EveningDooaData(
        id: 4,
        data:
            "(اللَّهمَّ إنِّي أسألُكَ عِلمًا نافعًا ورزقًا طيِّبًا وعملًا متقبَّلًا)",
        counter: 1),
    EveningDooaData(
        id: 5,
        data:
            "(يا حيُّ يا قيُّومُ، برَحمتِكَ أستَغيثُ، أصلِح لي شأني كُلَّهُ، ولا تَكِلني إلى نَفسي طرفةَ عينٍ)",
        counter: 1),
    EveningDooaData(
        id: 6,
        data:
            "(اللَّهمَّ عالِمَ الغَيبِ والشَّهادةِ، فاطرَ السَّمواتِ والأرضِ، رَبَّ كلِّ شيءٍ ومَليكَهُ، أشهدُ أن لا إلَهَ إلَّا أنتَ، أعوذُ بِكَ مِن شرِّ نفسي وشرِّ الشَّيطانِ وشِركِهِ)",
        counter: 1),
    EveningDooaData(
        id: 7,
        data:
            "(اللهمَّ فاطرَ السمواتِ والأرضِ، عالمَ الغيبِ والشهادةِ، لا إلهَ إلَّا أنتَ ربَّ كلِّ شيءٍ ومَليكَه، أعوذُ بك من شرِّ نفسي ومن شرِّ الشيطانِ وشرَكِه، وأنْ أقترفَ على نفسي سوءًا أو أجرَّهُ إلى مسلمٍ)",
        counter: 1),
    EveningDooaData(
        id: 8,
        data:
            "(اللهمَّ إنِّي أعوذُ بك من الهمِّ والحزنِ، والعجزِ والكسلِ، والبُخلِ والجُبنِ، وضَلَعِ الدَّينِ، وغَلَبَةِ الرجالِ)",
        counter: 1),
    EveningDooaData(
        id: 9,
        data: "(أعوذُ بكلماتِ اللهِ التَّامَّاتِ مِن شرِّ ما خلَق)",
        counter: 1),
    EveningDooaData(
        id: 10,
        data:
            "(اللهمَّ إني أسألُك العفوَ والعافيةَ، في الدنيا والآخرةِ، اللهمَّ إني أسألُك العفوَ والعافيةَ، في دِيني ودنيايَ وأهلي ومالي، اللهمَّ استُرْ عوراتي، وآمِنْ روعاتي، واحفظني من بين يدي، ومن خلفي، وعن يميني، وعن شمالي، ومن فوقي، وأعوذُ بك أن أُغْتَالَ من تحتي)",
        counter: 1),
    EveningDooaData(
        id: 11,
        data:
            "(أَمْسَيْنَا وَأَمْسَى المُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ لا إلَهَ إلَّا اللَّهُ، وَحْدَهُ لا شَرِيكَ له، له المُلْكُ وَلَهُ الحَمْدُ وَهو علَى كُلِّ شيءٍ قَدِيرٌ، رَبِّ أَسْأَلُكَ خَيْرَ ما في هذِه اللَّيْلَةِ وَخَيْرَ ما بَعْدَهَا، وَأَعُوذُ بكَ مِن شَرِّ ما في هذِه اللَّيْلَةِ وَشَرِّ ما بَعْدَهَا، رَبِّ أَعُوذُ بكَ مِنَ الكَسَلِ وَسُوءِ الكِبَرِ، رَبِّ أَعُوذُ بكَ مِن عَذَابٍ في النَّارِ وَعَذَابٍ في القَبْرِ)",
        counter: 1),
    EveningDooaData(
        id: 12,
        data:
            "(اللَّهُمَّ أنْتَ رَبِّي لا إلَهَ إلَّا أنْتَ، خَلَقْتَنِي وأنا عَبْدُكَ، وأنا علَى عَهْدِكَ ووَعْدِكَ ما اسْتَطَعْتُ، أعُوذُ بكَ مِن شَرِّ ما صَنَعْتُ، أبُوءُ لكَ بنِعْمَتِكَ عَلَيَّ، وأَبُوءُ لكَ بذَنْبِي فاغْفِرْ لِي، فإنَّه لا يَغْفِرُ الذُّنُوبَ إلَّا أنْتَ)",
        counter: 1),
    EveningDooaData(
        id: 13,
        data:
            "(اللَّهمَّ إنِّي أسألُكَ خيرَ هذه الليلة فتحَها، ونصرَها، ونورَها، وبرَكتَها، وَهداها، وأعوذُ بِكَ من شرِّ ما فيها وشرِّ ما بعدَها)",
        counter: 1),
  ];

// Morning
  List<MorningDooaData> morningDooaData = [
    MorningDooaData(
        id: 1,
        data:
            "(اللَّهُمَّ أنْتَ رَبِّي لا إلَهَ إلَّا أنْتَ، خَلَقْتَنِي وأنا عَبْدُكَ، وأنا علَى عَهْدِكَ ووَعْدِكَ ما اسْتَطَعْتُ، أعُوذُ بكَ مِن شَرِّ ما صَنَعْتُ، أبُوءُ لكَ بنِعْمَتِكَ عَلَيَّ، وأَبُوءُ لكَ بذَنْبِي فاغْفِرْ لِي، فإنَّه لا يَغْفِرُ الذُّنُوبَ إلَّا أنْتَ)",
        counter: 1),
    MorningDooaData(
        id: 2,
        data:
            "(اللهمَّ إني أسألُك العفوَ والعافيةَ، في الدنيا والآخرةِ، اللهمَّ إني أسألُك العفوَ والعافيةَ، في دِيني ودنيايَ وأهلي ومالي، اللهمَّ استُرْ عوراتي، وآمِنْ روعاتي، واحفظني من بين يدي، ومن خلفي، وعن يميني، وعن شمالي، ومن فوقي، وأعوذُ بك أن أُغْتَالَ من تحتي)",
        counter: 1),
    MorningDooaData(
        id: 3,
        data:
            "(اللهمَّ إنِّي أعوذُ بك من الهمِّ والحزنِ، والعجزِ والكسلِ، والبُخلِ والجُبنِ، وضَلَعِ الدَّينِ، وغَلَبَةِ الرجالِ)",
        counter: 1),
    MorningDooaData(
        id: 4,
        data:
            "(يا حيُّ يا قيُّومُ، برَحمتِكَ أستَغيثُ، أصلِح لي شأني كُلَّهُ، ولا تَكِلني إلى نَفسي طرفةَ عينٍ)",
        counter: 1),
    MorningDooaData(
        id: 5,
        data:
            "(اللهم إنا نعوذُ بك من أن نُشرِكَ بك شيئًا نعلَمُه، و نستغفرُك لما لا نعلمُه)",
        counter: 1),
    MorningDooaData(
        id: 6,
        data:
            "اللَّهُمَّ إنِّي أسألُكَ العافيةَ في الدُّنيا والآخِرةِ، اللَّهُمَّ إنِّي أسألُكَ العَفوَ والعافيةَ في دِيني ودُنيايَ، وأهْلي ومالي، اللَّهُمَّ استُرْ عَوْراتي، وآمِنْ رَوْعاتي، اللَّهُمَّ احْفَظْني من بينِ يَدَيَّ، ومن خَلْفي، وعن يَميني، وعن شِمالي، ومن فَوْقي، وأعوذُ بعَظَمتِكَ أنْ أُغْتالَ من تَحْتي)",
        counter: 1),
    MorningDooaData(
        id: 7,
        data:
            "(اللَّهمَّ إنِّي أسألُكَ خيرَ هذا اليومِ فتحَه، ونصرَه، ونورَه، وبرَكتَه، وَهدايتَهُ، وأعوذُ بِكَ من شرِّ ما فيهِ وشرِّ ما بعدَه)",
        counter: 1),
    MorningDooaData(
        id: 8,
        data:
            "(اللَّهمَّ عافِني في بدَني اللَّهمَّ عافِني في سمعي اللَّهمَّ عافِني في بصري لا إلهَ إلَّا أنت، اللَّهمَّ إنِّي أعوذُ بِكَ منَ الكُفْرِ والفقرِ اللَّهمَّ إنِّي أعوذُ بكَ من عذابِ القبرِ لا إلهَ إلَّا أنت)",
        counter: 3),
    MorningDooaData(
        id: 9,
        data:
            "(اللَّهمَّ إنِّي أسألُكَ عِلمًا نافعًا ورزقًا طيِّبًا وعملًا متقبَّلًا)",
        counter: 1),
    MorningDooaData(
        id: 10,
        data: "(أعوذُ بكلماتِ اللهِ التَّامَّاتِ مِن شرِّ ما خلَق)",
        counter: 3),
  ];

  void decrement({required int index, required data}) {
    data[index].counter--;
    emit(IslamicDecrementState());
  }

  void remove(
      {required int index, required BuildContext context, required data}) {
    if (data[index].counter <= 0) {
      data.removeAt(index);
    }
    if (data.isEmpty) {
      showMyDialog(context);
    }
  }

  void delete({required int index, required data}) {
    data.removeAt(index);
    emit(IslamicDeleteState());
  }

  Future<void> showMyDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Center(
          child: Text(
            "هل صليت علي النبي اليوم",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              Expanded(
                  flex: 8,
                  child: LottieBuilder.asset("assets/json/done.json")),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: AppColors.mainColor,
                            width: 2,
                          ))),
                  onPressed: () {
                    navigateTo(widget: const HomeLayout(), context: context);
                  },
                  child: const Text(
                    "الذهاب للقائمة الرئيسية",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
