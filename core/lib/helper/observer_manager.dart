import 'package:flutter/foundation.dart';

class ObserverManager {
  static final ObserverManager notifyCenter = ObserverManager();

  ValueNotifier<int> dailyEvaluationChanged = ValueNotifier(-1);
  void reloadDailyEvaluation(int entityID) {
    dailyEvaluationChanged.value = entityID;
  }

  void resetDailyEvaluation() {
    dailyEvaluationChanged.value = -1;
  }

  ValueNotifier<int> patientsChanged = ValueNotifier(-1);
  void reloadPatientsEvaluation(int entityID) {
    patientsChanged.value = entityID;
  }

  void resetPatientsEvaluation() {
    patientsChanged.value = -1;
  }
}
