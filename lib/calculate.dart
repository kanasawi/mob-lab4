import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final _curSOC = TextEditingController();
  final _tarSOC = TextEditingController();
  final _chgrate = TextEditingController();
  final _vol = TextEditingController();
  final _bat = TextEditingController();
  final _eff = TextEditingController();
  String _chgpow = "0";
  String _chgtime = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PEA VOLTA",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_rounded),
              color: Colors.white,
              onPressed: () {
                debugPrint("noticed");
              }),
          IconButton(
              icon: const Icon(Icons.table_rows_rounded),
              color: Colors.white,
              onPressed: () {
                debugPrint("menu");
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              "assets/images/pea.png",
              width: 200,
              height: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
                color: Colors.purple,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Text(
                    "Charging Time: $_chgtime hrs",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            Text(
              "Charging Power : $_chgpow kWh",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(children: [
              TextField(
                controller: _curSOC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Current SOC(%)",
                  hintText: "Enter Current SOC(%)",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _tarSOC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Target SOC(%)",
                  hintText: "Enter Target SOC(%)",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _chgrate,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Charging Rate(A)",
                  hintText: "Enter Charging Rate(A)",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _vol,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Voltage(V)",
                  hintText: "Enter Voltage(V)",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _bat,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Bat Capacity(kWh)",
                  hintText: "Enter Bat Capacity(kWh)",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _eff,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Efficiency(%)",
                  hintText: "Enter Efficiency(%)",
                ),
              ),
            ]),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                // debugPrint('button calculate');
                double? curSOC = double.tryParse(_curSOC.text);
                double? tarSOC = double.tryParse(_tarSOC.text);
                double? chgrate = double.tryParse(_chgrate.text);
                double? vol = double.tryParse(_vol.text);
                double? bat = double.tryParse(_bat.text);
                double? eff = double.tryParse(_eff.text);

                // ! = check null
                // calculate
                double? chgpow = (vol! * chgrate!) / 1000;
                double? chgtime = (((tarSOC!-curSOC!) * bat!) / 100) / (chgpow * eff!);

                setState(() {
                  _chgpow = chgpow.toStringAsFixed(2);
                  _chgtime = chgtime.toStringAsFixed(2);
                });
              },
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}