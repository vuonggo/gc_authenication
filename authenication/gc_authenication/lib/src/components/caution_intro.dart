import 'package:flutter/material.dart';
import 'package:gc_authenication/generated_images.dart';
import 'package:gc_core/gc_core.dart';

class CautionIntro extends StatelessWidget {
  const CautionIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(
          height: AppConsts.kDefaultPadding,
        ),
        Text(
          'Thông điệp 5K',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
        SizedBox(
          height: AppConsts.kDefaultPadding,
        ),
        _Item(
            number: 1,
            subtitle: 'Thường xuyên đeo khẩu trang khi đi ra ngoài',
            title: 'Khẩu trang',
            image: Img.mask),
        _Item(
            number: 2,
            subtitle: 'Rửa tay thường xuyên, vệ sinh bề mặt, lau chùi nhà cửa',
            title: 'Khử khuẩn',
            image: Img.killVirus),
        _Item(
            number: 3,
            subtitle:
                'Không tụ tập đông người, không ra ngoài khi không thực sự cần thiết',
            title: 'Không tụ tập',
            image: Img.noCrowded),
        _Item(
            number: 4,
            subtitle: 'Giữ khoảng cách khi tiếp xúc với người khác',
            title: 'Khoảng cách',
            image: Img.distance),
        _Item(
            number: 5,
            subtitle: 'Thường xuyên khai báo tình trạng sức khỏe',
            title: 'Khai báo',
            image: Img.notice)
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String subtitle;
  final int number;
  final String image;
  const _Item(
      {Key? key,
      required this.number,
      required this.subtitle,
      required this.title,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color(0xFFF4F4F6), borderRadius: AppConsts.kCardBorder),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.only(right: 4),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: AppColors.yellow),
                child: Center(
                  child: Text('$number'),
                ),
              ),
              SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TransparentImage(image)
        ],
      ),
    );
  }
}
