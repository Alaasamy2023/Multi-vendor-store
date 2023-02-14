import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant/constants.dart';
import 'search_form.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<String> text = [
    'الاعلى سعر',
    'الاقل سعر',
    'الاعلى تقييما',
    'الاقل تقييما',
    'الاعلى مبيعا ',
    'الخصومات ',
  ];
  List<bool> isEnable = [true, false, false, false, false, false];
  // ignore: no_leading_underscores_for_local_identifiers
  RangeValues _currentRangeValues = const RangeValues(1000, 5000);

//....................................................................................

  @override
  Widget build(BuildContext context) {
    return _mBottomSheet7(context);
  }

//....................................................................................

  Widget _mBottomSheet7(var context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtered By :',
              style: boldTextStyle(size: 20),
            ),
            24.height,
            Form(
              child: TextFormField(
                onSaved: (value) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "ابحث عن ",
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset("assets/icons/Search.svg"),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: text.map(
                  (e) {
                    int index = text.indexOf(e);
                    return Container(
                      // ignore: sort_child_properties_last
                      child: Text(
                        e,
                        style: secondaryTextStyle(
                          color: isEnable[index]
                              ? Colors.white
                              : textSecondaryColorGlobal,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: boxDecorationDefault(
                        color:
                            isEnable[index] ? primaryColor : context.cardColor,
                      ),
                    ).onTap(
                      () {
                        setState(() {});
                        isEnable[index] = !isEnable[index];
                      },
                    );
                  },
                ).toList()),
            const Spacer(),
            Text(
              'اختار السعر',
              style: boldTextStyle(size: 20),
            ),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 5,
                inactiveTrackColor: context.dividerColor,
                activeTrackColor: primaryColor,
                thumbColor: primaryColor,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 50.0,
                  disabledThumbRadius: 50,
                  elevation: 3,
                ),
                overlayColor: Colors.grey.withAlpha(32),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 25.0),
                showValueIndicator: ShowValueIndicator.always,
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 10000,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ),
            const Spacer(),
            Row(
              children: [
                AppButton(
                  onTap: () {},
                  color: context.cardColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius()),
                  text: 'cancle',
                  textStyle: primaryTextStyle(),
                ).expand(),
                16.width,
                AppButton(
                  onTap: () {},
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius()),
                  text: 'Search ',
                  textStyle: primaryTextStyle(
                    color: Colors.white,
                  ),
                  color: primaryColor,
                ).expand()
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 32);
      },
    );
  }

//....................................................................................

}
