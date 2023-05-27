import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_caselet/change_downtime_card.dart';
import 'package:flutter_caselet/machine_summary_card.dart';
import 'package:flutter_caselet/models/machine_summary.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  List<MachineSummary> dashboardData = [];
  MachineSummary? selectedMachineData;

  Future<void> getMachineSummaryListFromJson() async {
    final String response =
        await rootBundle.loadString('data/dashboard_data.json');
    final Map<String, dynamic> machineSummaryDataJson =
        await json.decode(response);

    setState(() {
      dashboardData = [
        MachineSummary.fromJson(machineSummaryDataJson["fryer"]),
        MachineSummary.fromJson(machineSummaryDataJson["freezer"]),
        MachineSummary.fromJson(machineSummaryDataJson["oven"]),
      ];
      selectedMachineData = dashboardData[0];
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getMachineSummaryListFromJson();
    });
  }

  void handleSelectedMachine(String? selectedMachineName) {
    var machineData = dashboardData
        .firstWhere((element) => element.name == selectedMachineName);
    setState(() {
      selectedMachineData = machineData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Text(
                  "Select a machine",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DropdownButton(
                value: selectedMachineData?.name,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.green),
                underline: Container(
                  height: 1,
                  color: Colors.green,
                ),
                items: dashboardData.map<DropdownMenuItem<String>>(
                  (machineData) {
                    return DropdownMenuItem(
                      value: machineData.name,
                      child: Text(
                        machineData.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ).toList(),
                onChanged: handleSelectedMachine,
              ),
            ],
          ),
          if (selectedMachineData != null)
            MachineSummaryCard(selectedMachineData!),
          if (selectedMachineData != null)
            ChanceDowntimeCard(selectedMachineData!.downtimeChance),
        ],
      ),
    );
  }
}
