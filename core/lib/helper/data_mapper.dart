class DataMapper {
  /// gender : patient field
  Map<String, dynamic> genders() {
    return {
      'Male': 'Nam',
      'Female': 'Nữ',
      'Other': 'Khác',
    };
  }

  /// f0Level : patient field
  Map<String, dynamic> f0Levels() {
    return {
      'F0Level1': 'Phân độ 1',
      'F0Level2': 'Phân độ 2',
      'F0Level3': 'Phân độ 3',
      'F0Level4': 'Phân độ 4',
    };
  }

  /// f0Level : patient field
  Map<String, dynamic> treatmentLevel() {
    return {
      'TreatmentLevel1': 'BV Tầng 1',
      'TreatmentLevel2': 'BV Tầng 2 ',
      'TreatmentLevel3': 'BV Tầng 3',
    };
  }

  var dailyEvalutionTitles = {
    'dQ2': 'A. Tình trạng ăn uống',
    'dQ1': 'B. Tình trạng sức khỏe',
    'group1': 'C. Các triệu chứng',
    'dQ4': '1. Ho?',
    'dQ5': '2. Sốt (trên 37 độ C',
    'dQ6': '3. Đau đầu',
    'dQ7': '4. Đau họng, rát họn',
    'dQ8': '5. Sổ mũi, chảy mũi, ngạt mũi',
    'dQ9': '6. Khó thở',
    'dQ10': '7. Đau ngực, tức ngực',
    'dQ11': '8. Đau mỏi, đau cơ',
    'dQ12': '9. Mất vị giác',
    'dQ13': '10. Mất khứu giác',
    'dQ14': '11. Đau bụng, buồn nuôn',
    'dQ15': '12. Tiêu chảy',
    'otherSymtom': 'Dấu hiệu khác',
    'group2': 'D. Các chỉ số cần đo',
    'mesureTime': 'Thời gian đo các chỉ số',
    'spo2': 'SpO2 (%)',
    'breathing': 'Nhịp thở (Lần/phút)',
    'circuit': 'Mạch (Lần/phút)',
    'bloodPressureMin': 'Huyết áp (Tối thiểu)',
    'bloodPressureMax': 'Huyết áp (Tối đa)',
    'temperature': 'Nhiệt độ',
    'otherFeedback': 'Ý kiến khác',
  };

  var dQ1Options = {
    'Dq1O1': '1. Vẫn như cũ',
    'Dq1O2': '2. Tốt hơn hôm qua',
    'Dq1O3': '3. Cảm giác xấu (nặng) hơn',
  };
  var dQ2Options = {
    'Dq2O1': '1. Bình thường',
    'Dq2O2': '2. Ăn kém',
    'Dq2O3': '3. Chán ăn',
    'Dq2O4': '4. Không ăn được',
  };
  var dQ3Options = {
    'Dq3O1': '1. Bình thường',
    'Dq3O2': '2. Ăn kém',
    'Dq3O3': '3. Chán ăn',
    'Dq3O4': '4. Không ăn được',
  };
  var groupOptions = {
    'DqO1': 'Không',
    'DqO2': 'Có',
    'DqO3': 'Nặng hơn',
  };

  var instructionTitles = {
    'testM': 'A. Xét nghiệm',
    'testPackage': 'A.1. Gói xét nghiệm',
    'doctorInstruction': 'A.2. Nhận xét & chỉ định khác',
    'prescriptions': 'A.3. Đơn thuốc của Bác sĩ',
    'specialFeedbackM': 'B. Chỉ định đặc biệt',
    'doctorEvaluation': 'C. Đánh giá tiên lượng',
  };

  var testMOptions = {
    'TestPCR': '1. Test PCR',
    'FastTest': '2. Test Nhanh',
  };
  var testPackageOptions = {
    'Covid1': 'Khuyến cáo vào ngày thứ 1',
    'Covid7': 'Khuyến cáo vào ngày thứ 7',
    'Covid10': 'Khuyến cáo vào ngày thứ 10',
    'Covid7b': 'Bộ XN covid7B_Diễn biến nặng',
  };
  var specialFeedbackMOptions = {
    'Sp1': '1. Thở khí trời',
    'Sp2': '2. Thở oxy gọng kính',
    'Sp3': '3. Thở oxy mặt nạ (Mask)',
    'Sp4': '4. Thở oxy lưu lượng cao qua mũi (HFNC)',
    'Sp5': '5. Thở máy không xâm nhập (BiPAP)',
    'Sp6': '6. Thở máy xâm nhập',
    'Sp7': '7. Sử dụng ECMO',
    'Sp8': '8. Lọc máu',
  };
  var doctorEvaluationOpts = {
    'DE0': '0. Theo dõi, cách ly tại nhà',
    'DE1': '1. Duy trì điều trị tại bệnh viện',
    'DE2': '2. Dự kiến ra viện ngày mai',
    'DE3': '3. Ra viện',
    'DE4': '4. Cần chuyển viện',
    'DE5': '5. Đã chuyển viện',
    'DE6': '6. Tử vong',
    'DE7': '7. Trốn viện',
    'DE8': '8. Đóng hồ sơ ảo/ko phải covid',
  };

  var testPackageResultsOpts = {
    'PackageItem1': '1. Chụp Xquang ngực thẳng (code1)',
    'PackageItem2': '2. Định lượng D-dimer (code2)',
    'PackageItem3': '3. Tổng phân tích tế bào máu ngoại vi',
    'PackageItem4': '4. Định lượng Urê máu',
    'PackageItem5': '5. Định lượng Creatinin',
    'PackageItem6': '6. Định lượng Glucose',
    'PackageItem7': '7. Đo hoạt độ AST (GOT',
    'PackageItem8': '8. Đo hoạt độ ALT (GPT)',
    'PackageItem9': '9. Điện giải đồ (Na, K, Cl)',
    'PackageItem10': '10. Định lượng CRP',
    'PackageItem11': '11. Thời gian prothrombin',
    'PackageItem12': '12. Định lượng Fibrinogen bằng phương pháp trực tiếp',
    'PackageItem13': '13. Thời gian thromboplastin một phần hoạt hoá',
    'PackageItem14': '14. Đo hoạt độ CK',
    'PackageItem15': '15. Đo hoạt độ CK-MB',
    'PackageItem16': '16. Định lượng Troponin I',
    'PackageItem17': '17. Định lượng BNP',
    'PackageItem18': '18. Ghi điện tim cấp cứu tại giường',
  };
}
