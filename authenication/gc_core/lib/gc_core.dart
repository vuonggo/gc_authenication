library gc_core;

export 'router/navigation_service.dart';
export 'router/deeplink_constant.dart';
export 'di/di_components.dart';
export 'helper/nullable.dart';
export 'styles/styles.dart';
export 'widgets/independent/custom_button.dart';
export 'widgets/form/form_container.dart';
export 'widgets/independent/button_container.dart';
export 'widgets/independent/scaffold.dart';
export 'widgets/independent/popup_handler.dart';
export 'widgets/independent/appbar.dart';
export 'widgets/independent/alignment_wrap.dart';
export 'widgets/independent/gradient_text.dart';
export 'widgets/independent/seperator.dart';
export 'widgets/independent/geo_bottomsheet.dart';
export 'widgets/independent/loader_screen.dart';
export 'widgets/independent/loading_screen.dart';
export 'widgets/independent/skeleton.dart';
export 'widgets/independent/transparent_image.dart';
export 'widgets/independent/avatar.dart';
export 'widgets/form/single_text_field.dart';
export 'widgets/form/date_field.dart';
export 'widgets/form/dropdown_field.dart';
export 'widgets/form/question_checkbox_field.dart';
export 'widgets/form/geo_dropdown.dart';
export 'widgets/form/display_field.dart';
export 'helper/validator.dart';
export 'helper/debug.dart';
export 'helper/hero_tag/banner_hero_tag.dart';
export 'env.dart';
export 'widgets/form/question_singlechoice_field.dart';
export 'helper/formatters/date_formatter.dart';
export 'package:gc_core/helper/datetime_helper.dart';

class DeviceInfo {
  String id; //DeviceId
  String token; //DeviceToken

  DeviceInfo({required this.id, required this.token});
}
