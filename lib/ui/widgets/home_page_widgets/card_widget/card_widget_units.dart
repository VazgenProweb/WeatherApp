enum CardWidgetUnits { km, deg, precent, kmh }

class CardWidgetUnitsTreatment {
  static String unitsTreatment(CardWidgetUnits units, double value) {
    switch (units) {
      case CardWidgetUnits.km:
        return '$value км';
      case CardWidgetUnits.precent:
        return '$value %';
      case CardWidgetUnits.deg:
        return '$value °';
      default:
        return '$value км/ч';
    }
  }
}
