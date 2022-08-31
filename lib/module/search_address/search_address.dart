import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sw_travelrhythm/constant/style/size.dart';
import 'package:sw_travelrhythm/constant/style/style.dart';
import 'package:sw_travelrhythm/module/search_address/search_address_controller.dart';

class SearchAddress extends GetView<SearchAddressController> {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: mainAppBar,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: WidthWithRatio.small,
              vertical: HeightWithRatio.xSmall),
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
              Container(
                padding: const EdgeInsets.only(bottom: GapSize.xSmall),
                width: Get.width / 1.5,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: GapSize.xSmall),
                  child: TextField(
                    controller: controller.editAddress,
                    focusNode: controller.editAddressFocus,
                    style: const TextStyle(
                        fontSize: FontSize.large,
                        fontFamily: 'NotoSansKR-Medium'),
                    decoration: const InputDecoration(
                      hintText: '지역 검색',
                      hintStyle: TextStyle(
                          fontSize: FontSize.large,
                          fontFamily: 'NotoSansKR-Medium',
                          color: Colors.grey),
                      contentPadding: EdgeInsets.zero,
                      filled: false,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
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
              SizedBox(
                height: HeightWithRatio.small,
              ),
              SizedBox(
                width: Get.width,
                height: ButtonHeight.large,
                child: ElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  child: const Text('검색', style: TextStyle(fontSize: FontSize.large, color: Colors.white, fontFamily: 'NotoB'),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCategoryToogleLayout(){
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
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: Colors.green[700],
            selectedColor: Colors.white,
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints:  BoxConstraints(
              minHeight: GapSize.xxLarge,
              minWidth: WidthWithRatio.xxLarge,
            ),
            isSelected: controller.selectedCategorys[0].value,
            children: controller.categorys[0],
          ),
          SizedBox(
            height: GapSize.small,
          ),
          ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              // All buttons are selectable.
              controller.selectedCategorys[1][index] =
              !controller.selectedCategorys[1][index];
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: Colors.green[700],
            selectedColor: Colors.white,
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints:  BoxConstraints(
              minHeight: GapSize.xxLarge,
              minWidth: WidthWithRatio.xxLarge,
            ),
            isSelected: controller.selectedCategorys[1].value,
            children: controller.categorys[1],
          ),
          SizedBox(
            height: GapSize.small,
          ),
          ToggleButtons(
            direction: Axis.horizontal,
            onPressed: (int index) {
              // All buttons are selectable.
              controller.selectedCategorys[2][index] =
              !controller.selectedCategorys[2][index];
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: Colors.green[700],
            selectedColor: Colors.white,
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints:  BoxConstraints(
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
