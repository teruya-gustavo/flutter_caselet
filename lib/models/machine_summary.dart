class MachineSummary {
  final String name;
  final double currentHealthIndex;
  final double heatingSystemIndex;
  final double beltIndex;
  final double fanIndex;
  final double downtimeChance;

  MachineSummary.fromJson(Map<String, dynamic> json)
      : name = json["machine_name"],
        currentHealthIndex = json["current_health_index"].toDouble(),
        heatingSystemIndex = json["heating_system_index"].toDouble(),
        beltIndex = json["belt_index"].toDouble(),
        fanIndex = json["fan_index"].toDouble(),
        downtimeChance = json["downtime_chance"].toDouble();
}
