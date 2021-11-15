// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Xin chào`
  String get hello {
    return Intl.message(
      'Xin chào',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại`
  String get enterMobile {
    return Intl.message(
      'Nhập số điện thoại',
      name: 'enterMobile',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp tục`
  String get next {
    return Intl.message(
      'Tiếp tục',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực`
  String get verify_otp {
    return Intl.message(
      'Xác thực',
      name: 'verify_otp',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã OTP để tiếp tục`
  String get enter_otp_msg {
    return Intl.message(
      'Nhập mã OTP để tiếp tục',
      name: 'enter_otp_msg',
      desc: '',
      args: [],
    );
  }

  /// `Nếu không nhận được mã OTP, vui lòng nhấn`
  String get resend_otp_msg {
    return Intl.message(
      'Nếu không nhận được mã OTP, vui lòng nhấn',
      name: 'resend_otp_msg',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại mã`
  String get resend {
    return Intl.message(
      'Gửi lại mã',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Xong`
  String get done {
    return Intl.message(
      'Xong',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get complete {
    return Intl.message(
      'Hoàn thành',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Chọn gói điều trị`
  String get choosePackage {
    return Intl.message(
      'Chọn gói điều trị',
      name: 'choosePackage',
      desc: '',
      args: [],
    );
  }

  /// `Chọn gói điều trị phù hợp với bạn`
  String get chooseTreatment {
    return Intl.message(
      'Chọn gói điều trị phù hợp với bạn',
      name: 'chooseTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi gói chữa trị`
  String get changeTreatment {
    return Intl.message(
      'Thay đổi gói chữa trị',
      name: 'changeTreatment',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực`
  String get confirm {
    return Intl.message(
      'Xác thực',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã OTP đã nhận để tiếp tục`
  String get inputPhone {
    return Intl.message(
      'Nhập mã OTP đã nhận để tiếp tục',
      name: 'inputPhone',
      desc: '',
      args: [],
    );
  }

  /// `Chưa nhận được mã OTP?`
  String get dontReceiveOTP {
    return Intl.message(
      'Chưa nhận được mã OTP?',
      name: 'dontReceiveOTP',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng đăng nhập bằng số điện thoại`
  String get loginDescription {
    return Intl.message(
      'Vui lòng đăng nhập bằng số điện thoại',
      name: 'loginDescription',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin cá nhân`
  String get userInformation {
    return Intl.message(
      'Thông tin cá nhân',
      name: 'userInformation',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên`
  String get fullname {
    return Intl.message(
      'Họ tên',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `Điện thoại`
  String get mobile {
    return Intl.message(
      'Điện thoại',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Ngày sinh`
  String get birthDay {
    return Intl.message(
      'Ngày sinh',
      name: 'birthDay',
      desc: '',
      args: [],
    );
  }

  /// `Giới tính`
  String get gender {
    return Intl.message(
      'Giới tính',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Số thẻ bảo hiểm y tế`
  String get insuranceCardNumber {
    return Intl.message(
      'Số thẻ bảo hiểm y tế',
      name: 'insuranceCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `CMND/CCCD/Hộ chiếu`
  String get identify {
    return Intl.message(
      'CMND/CCCD/Hộ chiếu',
      name: 'identify',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cấp`
  String get providedDay {
    return Intl.message(
      'Ngày cấp',
      name: 'providedDay',
      desc: '',
      args: [],
    );
  }

  /// `Nơi cấp`
  String get providedPlace {
    return Intl.message(
      'Nơi cấp',
      name: 'providedPlace',
      desc: '',
      args: [],
    );
  }

  /// `Quốc tịch`
  String get nationality {
    return Intl.message(
      'Quốc tịch',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ thường trú`
  String get permanentAddress {
    return Intl.message(
      'Địa chỉ thường trú',
      name: 'permanentAddress',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh thành`
  String get city {
    return Intl.message(
      'Tỉnh thành',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Quận/Huyện`
  String get district {
    return Intl.message(
      'Quận/Huyện',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Phường/Xã`
  String get ward {
    return Intl.message(
      'Phường/Xã',
      name: 'ward',
      desc: '',
      args: [],
    );
  }

  /// `Nơi ở hiện tại`
  String get currentTemporaryAddress {
    return Intl.message(
      'Nơi ở hiện tại',
      name: 'currentTemporaryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ tạm trú trùng với địa chỉ thường trú`
  String get temporaryPermanentAddress {
    return Intl.message(
      'Địa chỉ tạm trú trùng với địa chỉ thường trú',
      name: 'temporaryPermanentAddress',
      desc: '',
      args: [],
    );
  }

  /// `Số nhà, phố, tổ dân phố/thôn/đội`
  String get address {
    return Intl.message(
      'Số nhà, phố, tổ dân phố/thôn/đội',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Nam`
  String get male {
    return Intl.message(
      'Nam',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Nữ`
  String get female {
    return Intl.message(
      'Nữ',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Bằng việc sử dụng ứng dụng,\nTôi đồng ý với {rules} của {galaxyCare}`
  String policy(Object rules, Object galaxyCare) {
    return Intl.message(
      'Bằng việc sử dụng ứng dụng,\nTôi đồng ý với $rules của $galaxyCare',
      name: 'policy',
      desc:
          'Bằng cách nhấn Đăng ký, bạn đồng ý với điều khoản và bảo mật của Dr. Aibolit',
      args: [rules, galaxyCare],
    );
  }

  /// `Điều khoản sử dụng`
  String get rules {
    return Intl.message(
      'Điều khoản sử dụng',
      name: 'rules',
      desc: '',
      args: [],
    );
  }

  /// `Bảo mật`
  String get secured {
    return Intl.message(
      'Bảo mật',
      name: 'secured',
      desc: '',
      args: [],
    );
  }

  /// `Dr. Aibolit`
  String get galaxyCare {
    return Intl.message(
      'Dr. Aibolit',
      name: 'galaxyCare',
      desc: '',
      args: [],
    );
  }

  /// `Điều khoản sử dụng ứng dụng Việt\n Nam khỏe mạnh`
  String get policyTitle {
    return Intl.message(
      'Điều khoản sử dụng ứng dụng Việt\n Nam khỏe mạnh',
      name: 'policyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Người dùng vui lòng đọc kỹ toàn bộ nội dung của Điều Khoản Sử Dụng ("Điều Khoản Sử Dụng") trước khi tiến hành cài đặt bất kỳ phần nào của Ứng dụng Việt Nam Khỏe Mạnh (“Healthy Vietnam” hay “Ứng dụng”) (bao gồm nhưng không giới hạn các phần mềm, các file và tài liệu liên quan). Người dùng chấp thuận và đồng ý bị ràng buộc bởi các quy định và điều kiện trong Điều khoản sử dụng này khi thực hiện các thao tác trên đây.\n\nĐiều 1. Giới thiệu chung về Ứng dụng Healthy Vietnam\n\n1.1    Ứng dụng Healthy Vietnam là Ứng dụng phi lợi nhuận do Bộ Thông tin và Truyền thông phối hợp với Công ty TNHH GalaxyOne (Tập đoàn Sovico) triển khai với mục đích bảo vệ sức khỏe cộng đồng trước đại dịch Covid-19.\n\n1.2    Ứng dụng Healthy Vietnam có các nhóm tính năng chính sau:\n\nGiới thiệu về của Ứng dụng, quản lý thành viên đã đăng ký.\n\nỨng dụng bao gồm trang chủ, trang thông tin người dùng, cảnh báo rủi ro lây nhiễm, thông tin liên hệ.\n\nĐăng ký nhập cảnh, đăng ký cách ly, giúp người dùng tuân thủ quy định về cách ly tại nhà của Chính phủ.\n\nQuản lý cách ly như đăng ký loại hình cách ly và cung cấp chứng nhận hoàn thành cách ly điện tử.\n\nKhai báo y tế, khai báo di chuyển nội địa, checkin, khai báo nhập cảnh theo các mẫu khai báo hiện hành của Bộ Y tế, lưu trữ tờ khai y tế và cho phép kiểm tra khai báo y tế nhanh.\n\nQuản lý địa điểm, đăng ký địa điểm, tạo mẫu QR và xem báo cáo lược đến.\n\nTruy vết tiếp xúc bằng công nghệ Bluetooth, broadcast và ghi thông tin thiết bị, báo cáo lên trung tâm dữ liệu.\n\nQuản lý vắc xin: thông báo lịch tiêm vắc xin, cho phép người dùng đặt lịch tiêm vắc xin theo tuyến, địa điểm tiêm chủng, quản lý liều vắc xin. Cấp và lưu trữ hộ chiếu vắc xin điện tử.\n\nQuyên góp ủng hộ vắc xin: Ứng dụng là kênh kết nối để người dân quyên góp vào Quỹ vắc xin phòng Covid-19.\n\nCung cấp thông tin rủi ro dịch bệnh từ các nguồn tin chính thống, cập nhật thông tin và tương tác khuyến khích người dân khai báo y tế, tiếp nhận phản ánh bất thường.\n\nĐiều 2. Cập nhật\n\nĐiều khoản sử dụng này có thể được cập nhật, bổ sung, điều chỉnh thường xuyên bởi Đơn vị quản lý Ứng dụng theo từng thời điểm. Phiên bản cập nhật sẽ được công bố tại Ứng dụng Healthy Vietnam và website: [https://vietnamkhoemanh.vn/]. Phiên bản cập nhật sẽ thay thế cho các quy định và điều khoản trong thỏa thuận ban đầu. Người dùng có thể truy cập vào Ứng dụng hoặc vào website trên để xem nội dung chi tiết của phiên bản cập nhật.\n\nĐiều 3. Quyền truy cập\n\nKhi sử dụng Ứng dụng Healthy Vietnam, người dùng đồng ý cho phép Ứng dụng có quyền sử dụng những chức năng dưới đây trên điện thoại/máy tính/thiết bị thông minh của mình. Tất cả các truy cập này chỉ được chúng tôi thực hiện khi có sự đồng ý của người dùng, vì vậy, người dùng thừa nhận và đồng ý rằng, khi người dùng đã cấp quyền cho chúng tôi, người dùng sẽ không có bất kỳ khiếu nại nào đối với việc truy cập này:\n\nĐọc và ghi lịch sử tiếp xúc, lich sử di chuyển.\n\nSử dụng Bluetooth và quyền truy cập vị trí để ghi nhận lịch sử tiếp xúc gần.\n\nTruy cập vào Internet từ thiết bị của người dùng.\n\nSử dụng Camera để quét mã QR và chụp ảnh chứng minh nhân dân/căn cước công dân.\n\nTruy cập ảnh, video, âm thanh và tệp để lưu mã QR về điện thoại.\n\nTruy cập Hoạt động thể chất (Android) hoặc Dữ liệu sức khỏe (iOS) để đếm bước chân trong tiện ích Sức khỏe.\n\nTruy cập vị trí để tìm kiếm các cơ sở tiêm chủng gần người dùng trong các tiện ích về tiêm chủng.\n\nĐiều 4. Đăng ký thông tin cá nhân\n\nNgười dùng có quyền lựa chọn đăng ký thông tin cá nhân của mình để nhận được thông tin, hướng dẫn và trợ giúp của cơ quan y tế khi cần thiết. Thông tin cá nhân bao gồm: Họ và tên, Ngày tháng năm sinh, Số điện thoại, Địa chỉ, Chứng minh nhân dân/Căn cước công dân.\n\nBằng việc đăng ký thông tin cá nhân, người dùng đồng ý cho cơ quan y tế sử dụng thông tin do người dùng cung cấp với mục đích phòng chống dịch bệnh Covid-19.\n\nNgười dùng tự chịu trách nhiệm về năng lực hành vi trong việc cung cấp thông tin cá nhân, đăng ký, sử dụng Ứng dụng.\n\nĐiều 5. Bảo vệ sự riêng tư và bản quyền\n\nDữ liệu của người dùng được thu thập, lưu trữ và sử dụng để phục vụ cho các mục đích nêu tại Điều 1 của Điều khoản sử dụng này. Dữ liệu sẽ được lưu trữ và bảo mật bởi đơn vị quản lý Ứng dụng và chỉ sử dụng vào mục đích giúp người dân bảo vệ sức khoẻ và phòng chống dịch bệnh Covid-19. Đơn vị quản lý Ứng dụng cam kết tuyệt đối không sử dụng thông tin thu thập được vào mục đích thương mại, không xâm phạm đời tư, không phát tán thông tin của bất cứ cá nhân, tổ chức nào.\n\nNgoài các mục đích trên, đơn vị quản lý Ứng dụng không được phép thu thập, sử dụng thông tin của người dùng vào bất kỳ mục đích nào khác với mục đích đã nêu tại Điều 1 của Điêu Khoản Sử Dụng này. Đơn vị quản lý Ứng dụng sẽ không tiết lộ bất kỳ thông tin nào có thể gây tổn hại hoặc thực hiện bất kỳ hành vi bất hợp pháp nào về quyền riêng tư của người dùng theo quy định của pháp luật Việt Nam hoặc chính sách của Ứng dụng Healthy Vietnam.\n\nĐiều 6. Nội dung cung cấp, trao đổi thông tin\n\nỨng dụng cho phép người dùng lựa chọn đăng ký thông tin cơ bản về cá nhân mình, bao gồm: Họ và tên, Số điện thoại, Địa chỉ, Chứng minh nhân dân/Căn cước công dân.\n\nNgười dùng nhận được thông tin, cảnh báo về nguy cơ lây nhiễm, được các cơ quan y tế liên hệ, hướng dẫn và hỗ trợ y tế kịp thời nếu đã từng tiếp xúc gần với ca nhiễm, ca nghi nhiễm, được thông tin về việc tiêm vắc xin phòng Covid-19 và quyên góp và quỹ vắc xin phòng Covid-19.\n\nVề phía cơ quan chức năng: Ứng dụng Healthy Vietnam giúp cơ quan chức năng nhanh chóng xác định, khoanh vùng, cách ly, hỗ trợ các ca nhiễm, ca nghi nhiễm và những người có tiếp xúc gần họ.\n\nĐiều 7. Quyền và trách nhiệm của người dùng\n\nTuân thủ các quy định về bảo đảm an toàn và bảo mật thông tin, an ninh thông tin. Người dùng đảm bảo khai báo các thông tin chính xác, có độ xác thực cao. Người dùng sẽ tự chịu trách nhiệm về tính chính xác và đầy đủ của thông tin do mình cung cấp.\n\nNgười dùng được bảo vệ bí mật thông tin cá nhân và thông tin người dùng theo quy định của pháp luật.\n\nTrong quá trình sử dụng Ứng dụng, người dùng được sử dụng các dịch vụ hỗ trợ theo quy định. Khi phát hiện ra lỗi của Ứng dụng, người dùng vui lòng thông báo cho chúng tôi qua đội ngũ phát triển Ứng dụng Healthy Việt Nam.\n\nThực hiện quyền và trách nhiệm khác theo quy định pháp luật.;`
  String get policyDescription {
    return Intl.message(
      'Người dùng vui lòng đọc kỹ toàn bộ nội dung của Điều Khoản Sử Dụng ("Điều Khoản Sử Dụng") trước khi tiến hành cài đặt bất kỳ phần nào của Ứng dụng Việt Nam Khỏe Mạnh (“Healthy Vietnam” hay “Ứng dụng”) (bao gồm nhưng không giới hạn các phần mềm, các file và tài liệu liên quan). Người dùng chấp thuận và đồng ý bị ràng buộc bởi các quy định và điều kiện trong Điều khoản sử dụng này khi thực hiện các thao tác trên đây.\n\nĐiều 1. Giới thiệu chung về Ứng dụng Healthy Vietnam\n\n1.1    Ứng dụng Healthy Vietnam là Ứng dụng phi lợi nhuận do Bộ Thông tin và Truyền thông phối hợp với Công ty TNHH GalaxyOne (Tập đoàn Sovico) triển khai với mục đích bảo vệ sức khỏe cộng đồng trước đại dịch Covid-19.\n\n1.2    Ứng dụng Healthy Vietnam có các nhóm tính năng chính sau:\n\nGiới thiệu về của Ứng dụng, quản lý thành viên đã đăng ký.\n\nỨng dụng bao gồm trang chủ, trang thông tin người dùng, cảnh báo rủi ro lây nhiễm, thông tin liên hệ.\n\nĐăng ký nhập cảnh, đăng ký cách ly, giúp người dùng tuân thủ quy định về cách ly tại nhà của Chính phủ.\n\nQuản lý cách ly như đăng ký loại hình cách ly và cung cấp chứng nhận hoàn thành cách ly điện tử.\n\nKhai báo y tế, khai báo di chuyển nội địa, checkin, khai báo nhập cảnh theo các mẫu khai báo hiện hành của Bộ Y tế, lưu trữ tờ khai y tế và cho phép kiểm tra khai báo y tế nhanh.\n\nQuản lý địa điểm, đăng ký địa điểm, tạo mẫu QR và xem báo cáo lược đến.\n\nTruy vết tiếp xúc bằng công nghệ Bluetooth, broadcast và ghi thông tin thiết bị, báo cáo lên trung tâm dữ liệu.\n\nQuản lý vắc xin: thông báo lịch tiêm vắc xin, cho phép người dùng đặt lịch tiêm vắc xin theo tuyến, địa điểm tiêm chủng, quản lý liều vắc xin. Cấp và lưu trữ hộ chiếu vắc xin điện tử.\n\nQuyên góp ủng hộ vắc xin: Ứng dụng là kênh kết nối để người dân quyên góp vào Quỹ vắc xin phòng Covid-19.\n\nCung cấp thông tin rủi ro dịch bệnh từ các nguồn tin chính thống, cập nhật thông tin và tương tác khuyến khích người dân khai báo y tế, tiếp nhận phản ánh bất thường.\n\nĐiều 2. Cập nhật\n\nĐiều khoản sử dụng này có thể được cập nhật, bổ sung, điều chỉnh thường xuyên bởi Đơn vị quản lý Ứng dụng theo từng thời điểm. Phiên bản cập nhật sẽ được công bố tại Ứng dụng Healthy Vietnam và website: [https://vietnamkhoemanh.vn/]. Phiên bản cập nhật sẽ thay thế cho các quy định và điều khoản trong thỏa thuận ban đầu. Người dùng có thể truy cập vào Ứng dụng hoặc vào website trên để xem nội dung chi tiết của phiên bản cập nhật.\n\nĐiều 3. Quyền truy cập\n\nKhi sử dụng Ứng dụng Healthy Vietnam, người dùng đồng ý cho phép Ứng dụng có quyền sử dụng những chức năng dưới đây trên điện thoại/máy tính/thiết bị thông minh của mình. Tất cả các truy cập này chỉ được chúng tôi thực hiện khi có sự đồng ý của người dùng, vì vậy, người dùng thừa nhận và đồng ý rằng, khi người dùng đã cấp quyền cho chúng tôi, người dùng sẽ không có bất kỳ khiếu nại nào đối với việc truy cập này:\n\nĐọc và ghi lịch sử tiếp xúc, lich sử di chuyển.\n\nSử dụng Bluetooth và quyền truy cập vị trí để ghi nhận lịch sử tiếp xúc gần.\n\nTruy cập vào Internet từ thiết bị của người dùng.\n\nSử dụng Camera để quét mã QR và chụp ảnh chứng minh nhân dân/căn cước công dân.\n\nTruy cập ảnh, video, âm thanh và tệp để lưu mã QR về điện thoại.\n\nTruy cập Hoạt động thể chất (Android) hoặc Dữ liệu sức khỏe (iOS) để đếm bước chân trong tiện ích Sức khỏe.\n\nTruy cập vị trí để tìm kiếm các cơ sở tiêm chủng gần người dùng trong các tiện ích về tiêm chủng.\n\nĐiều 4. Đăng ký thông tin cá nhân\n\nNgười dùng có quyền lựa chọn đăng ký thông tin cá nhân của mình để nhận được thông tin, hướng dẫn và trợ giúp của cơ quan y tế khi cần thiết. Thông tin cá nhân bao gồm: Họ và tên, Ngày tháng năm sinh, Số điện thoại, Địa chỉ, Chứng minh nhân dân/Căn cước công dân.\n\nBằng việc đăng ký thông tin cá nhân, người dùng đồng ý cho cơ quan y tế sử dụng thông tin do người dùng cung cấp với mục đích phòng chống dịch bệnh Covid-19.\n\nNgười dùng tự chịu trách nhiệm về năng lực hành vi trong việc cung cấp thông tin cá nhân, đăng ký, sử dụng Ứng dụng.\n\nĐiều 5. Bảo vệ sự riêng tư và bản quyền\n\nDữ liệu của người dùng được thu thập, lưu trữ và sử dụng để phục vụ cho các mục đích nêu tại Điều 1 của Điều khoản sử dụng này. Dữ liệu sẽ được lưu trữ và bảo mật bởi đơn vị quản lý Ứng dụng và chỉ sử dụng vào mục đích giúp người dân bảo vệ sức khoẻ và phòng chống dịch bệnh Covid-19. Đơn vị quản lý Ứng dụng cam kết tuyệt đối không sử dụng thông tin thu thập được vào mục đích thương mại, không xâm phạm đời tư, không phát tán thông tin của bất cứ cá nhân, tổ chức nào.\n\nNgoài các mục đích trên, đơn vị quản lý Ứng dụng không được phép thu thập, sử dụng thông tin của người dùng vào bất kỳ mục đích nào khác với mục đích đã nêu tại Điều 1 của Điêu Khoản Sử Dụng này. Đơn vị quản lý Ứng dụng sẽ không tiết lộ bất kỳ thông tin nào có thể gây tổn hại hoặc thực hiện bất kỳ hành vi bất hợp pháp nào về quyền riêng tư của người dùng theo quy định của pháp luật Việt Nam hoặc chính sách của Ứng dụng Healthy Vietnam.\n\nĐiều 6. Nội dung cung cấp, trao đổi thông tin\n\nỨng dụng cho phép người dùng lựa chọn đăng ký thông tin cơ bản về cá nhân mình, bao gồm: Họ và tên, Số điện thoại, Địa chỉ, Chứng minh nhân dân/Căn cước công dân.\n\nNgười dùng nhận được thông tin, cảnh báo về nguy cơ lây nhiễm, được các cơ quan y tế liên hệ, hướng dẫn và hỗ trợ y tế kịp thời nếu đã từng tiếp xúc gần với ca nhiễm, ca nghi nhiễm, được thông tin về việc tiêm vắc xin phòng Covid-19 và quyên góp và quỹ vắc xin phòng Covid-19.\n\nVề phía cơ quan chức năng: Ứng dụng Healthy Vietnam giúp cơ quan chức năng nhanh chóng xác định, khoanh vùng, cách ly, hỗ trợ các ca nhiễm, ca nghi nhiễm và những người có tiếp xúc gần họ.\n\nĐiều 7. Quyền và trách nhiệm của người dùng\n\nTuân thủ các quy định về bảo đảm an toàn và bảo mật thông tin, an ninh thông tin. Người dùng đảm bảo khai báo các thông tin chính xác, có độ xác thực cao. Người dùng sẽ tự chịu trách nhiệm về tính chính xác và đầy đủ của thông tin do mình cung cấp.\n\nNgười dùng được bảo vệ bí mật thông tin cá nhân và thông tin người dùng theo quy định của pháp luật.\n\nTrong quá trình sử dụng Ứng dụng, người dùng được sử dụng các dịch vụ hỗ trợ theo quy định. Khi phát hiện ra lỗi của Ứng dụng, người dùng vui lòng thông báo cho chúng tôi qua đội ngũ phát triển Ứng dụng Healthy Việt Nam.\n\nThực hiện quyền và trách nhiệm khác theo quy định pháp luật.;',
      name: 'policyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Chấp nhận và Tiếp tục`
  String get agree {
    return Intl.message(
      'Chấp nhận và Tiếp tục',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Chọn Quận`
  String get selectDistrict {
    return Intl.message(
      'Chọn Quận',
      name: 'selectDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Chọn Phường`
  String get selectWard {
    return Intl.message(
      'Chọn Phường',
      name: 'selectWard',
      desc: '',
      args: [],
    );
  }

  /// `Chọn Tỉnh/Thành`
  String get selectCity {
    return Intl.message(
      'Chọn Tỉnh/Thành',
      name: 'selectCity',
      desc: '',
      args: [],
    );
  }

  /// `Chọn Nơi cấp`
  String get selectProvidedPlace {
    return Intl.message(
      'Chọn Nơi cấp',
      name: 'selectProvidedPlace',
      desc: '',
      args: [],
    );
  }

  /// `Chọn Quốc gia`
  String get selectNationalities {
    return Intl.message(
      'Chọn Quốc gia',
      name: 'selectNationalities',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get sign_up {
    return Intl.message(
      'Đăng ký',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Tên đăng nhập`
  String get user_name {
    return Intl.message(
      'Tên đăng nhập',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get retype_password {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'retype_password',
      desc: '',
      args: [],
    );
  }

  /// `Đã có tài khoản?`
  String get had_a_account {
    return Intl.message(
      'Đã có tài khoản?',
      name: 'had_a_account',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu tối thiểu 8 ký tự và có chứa ký tự viết hoa`
  String get password_validate_msg {
    return Intl.message(
      'Mật khẩu tối thiểu 8 ký tự và có chứa ký tự viết hoa',
      name: 'password_validate_msg',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu không đúng`
  String get repassword_validate_msg {
    return Intl.message(
      'Mật khẩu không đúng',
      name: 'repassword_validate_msg',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có tài khoản?`
  String get no_account {
    return Intl.message(
      'Chưa có tài khoản?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không hợp lệ`
  String get invalidPhone {
    return Intl.message(
      'Số điện thoại không hợp lệ',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Tạo mật khẩu`
  String get createPassword {
    return Intl.message(
      'Tạo mật khẩu',
      name: 'createPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu bao gồm 8 ký tự trở lên và có ít nhất một ký tự viết hoa`
  String get limitPassword {
    return Intl.message(
      'Mật khẩu bao gồm 8 ký tự trở lên và có ít nhất một ký tự viết hoa',
      name: 'limitPassword',
      desc: '',
      args: [],
    );
  }

  /// `Bổ sung thông tin cá nhân`
  String get editProfileTitle {
    return Intl.message(
      'Bổ sung thông tin cá nhân',
      name: 'editProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật thông tin`
  String get editInfoBtn {
    return Intl.message(
      'Cập nhật thông tin',
      name: 'editInfoBtn',
      desc: '',
      args: [],
    );
  }

  /// `Chọn quốc gia`
  String get chooseCountry {
    return Intl.message(
      'Chọn quốc gia',
      name: 'chooseCountry',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng đăng nhập để sử dụng tính năng này`
  String get plsLoginToUseThisFeature {
    return Intl.message(
      'Vui lòng đăng nhập để sử dụng tính năng này',
      name: 'plsLoginToUseThisFeature',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng đăng nhập bằng số điện thoại.`
  String get plsLoginByMobile {
    return Intl.message(
      'Vui lòng đăng nhập bằng số điện thoại.',
      name: 'plsLoginByMobile',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng đăng ký bằng số điện thoại.`
  String get plsSignUpByMobile {
    return Intl.message(
      'Vui lòng đăng ký bằng số điện thoại.',
      name: 'plsSignUpByMobile',
      desc: '',
      args: [],
    );
  }

  /// `Sức khỏe chính là tài sản`
  String get intro1 {
    return Intl.message(
      'Sức khỏe chính là tài sản',
      name: 'intro1',
      desc: '',
      args: [],
    );
  }

  /// `Hãy lắng nghe để hiểu những điều cơ thể đang nói với bạn!`
  String get intro2 {
    return Intl.message(
      'Hãy lắng nghe để hiểu những điều cơ thể đang nói với bạn!',
      name: 'intro2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
