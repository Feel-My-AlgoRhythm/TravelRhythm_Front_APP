import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/constant/style/style.dart';
import 'package:sw_travelrhythm/module/search_address/search_address_controller.dart';

class SearchAddress extends GetView<SearchAddressController> {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: mainAppBar,
        body: Padding(
          padding: EdgeInsets.fromLTRB(WidthWithRatio.small,
              HeightWithRatio.xSmall, WidthWithRatio.small, GapSize.medium),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '지역 검색',
                        style: TextStyle(fontSize: FontSize.medium),
                      ),
                      const SizedBox(
                        height: GapSize.small,
                      ),
                      Obx(
                        () => DropdownButton2(
                          isExpanded: true,
                          items: controller.regionNameList.value
                              .map((val) => DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  ))
                              .toList(),
                          value: controller.selectedRegion.value,
                          onChanged: (val) {
                            controller.setSelectedRegion(val.toString());
                          },
                          dropdownMaxHeight: Get.height * 0.5,
                          hint: const Text(
                            '지역 검색',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: HeightWithRatio.small,
                      ),
                      const Text(
                        '대분류 선택',
                        style: TextStyle(fontSize: FontSize.medium),
                      ),
                      const SizedBox(
                        height: GapSize.small,
                      ),
                      _buildCategoryToogleLayout(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                height: ButtonHeight.large,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    '검색',
                    style: TextStyle(
                        fontSize: FontSize.large,
                        color: Colors.white,
                        fontFamily: 'NotoB'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildCategoryToogleLayout() {
    return Obx(
      () => Column(
        children: [
          ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              // All buttons are selectable.
              controller.selectedCategorys[0][index] =
                  !controller.selectedCategorys[0][index];
            },
            borderRadius:
                const BorderRadius.all(Radius.circular(RadiusSize.small)),
            selectedBorderColor: Colors.green[700],
            selectedColor: Colors.white,
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints: BoxConstraints(
              minHeight: GapSize.xxLarge,
              minWidth: WidthWithRatio.xxLarge,
            ),
            isSelected: controller.selectedCategorys[0].value,
            children: controller.categorys[0],
          ),
          const SizedBox(
            height: GapSize.small,
          ),
          ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              // All buttons are selectable.
              controller.selectedCategorys[1][index] =
                  !controller.selectedCategorys[1][index];
            },
            borderRadius:
                const BorderRadius.all(Radius.circular(RadiusSize.small)),
            selectedBorderColor: Colors.green[700],
            selectedColor: Colors.white,
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints: BoxConstraints(
              minHeight: GapSize.xxLarge,
              minWidth: WidthWithRatio.xxLarge,
            ),
            isSelected: controller.selectedCategorys[1].value,
            children: controller.categorys[1],
          ),
          const SizedBox(
            height: GapSize.small,
          ),
          ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              // All buttons are selectable.
              controller.selectedCategorys[2][index] =
                  !controller.selectedCategorys[2][index];
            },
            borderRadius:
                const BorderRadius.all(Radius.circular(RadiusSize.small)),
            selectedBorderColor: Colors.green[700],
            selectedColor: Colors.white,
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints: BoxConstraints(
              minHeight: GapSize.xxLarge,
              minWidth: WidthWithRatio.xxLarge,
            ),
            isSelected: controller.selectedCategorys[2].value,
            children: controller.categorys[2],
          ),
        ],
      ),
    );
  }
}
