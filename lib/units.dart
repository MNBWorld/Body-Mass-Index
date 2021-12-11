import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

enum UnitType {
  meter,
  centimeter,
  feet,
  kilogram,
  gram,
  bmi,
}

class Units extends StatefulWidget {
  const Units({Key? key}) : super(key: key);
  @override
  State<Units> createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
  final TextEditingController _feetController = TextEditingController();

  final TextEditingController _centimeterController = TextEditingController();

  final TextEditingController _meterController = TextEditingController();

  final TextEditingController _kilogramController = TextEditingController();

  final TextEditingController _gramController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();

  void _convertUnit(UnitType type) {
    double? ft = double.tryParse(_feetController.value.text) ?? 0;
    double? cm = double.tryParse(_centimeterController.value.text) ?? 0;
    double? m = double.tryParse(_meterController.value.text) ?? 0;
    double? kg = double.tryParse(_kilogramController.value.text) ?? 0;
    double? g = double.tryParse(_gramController.value.text) ?? 0;
    double? bmi = kg / (m * m);

    switch (type) {
      case UnitType.feet:
        _meterController.text = (ft / 3.281).toStringAsFixed(2);
        _centimeterController.text = (ft * 30.48).toStringAsFixed(2);
        break;
      case UnitType.meter:
        _centimeterController.text = (m * 100).toStringAsFixed(2);
        _feetController.text = (m * 3.281).toStringAsFixed(2);
        break;
      case UnitType.centimeter:
        _meterController.text = (cm / 100).toStringAsFixed(2);
        _feetController.text = (cm / 30.48).toStringAsFixed(2);
        break;
      case UnitType.kilogram:
        _gramController.text = (kg * 1000).toStringAsFixed(2);
        break;
      case UnitType.gram:
        _kilogramController.text = (g / 1000).toStringAsFixed(2);
        break;
      case UnitType.bmi:
        _bmiController.text = bmi.toStringAsFixed(1);
        break;
    }
  }

  void calculate() {
    try {
      double? kg = double.tryParse(_kilogramController.value.text) ?? 0;
      double? m = double.tryParse(_meterController.value.text) ?? 0;
      double? bmi = kg / (m * m);

      _bmiController.text = bmi.toStringAsFixed(1);
    } catch (e) {
      // This is an example, you need to handle possible null exception anyway
      _bmiController.text = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeumorphicText(
            "Feet",
            style: NeumorphicStyle(
              color: HexColor("fcba03"),
              intensity: 0.9,
              depth: 0.5,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: MediaQuery.of(context).size.height / 31,
              fontFamily: GoogleFonts.trykker().fontFamily,
            ),
          ),
          Neumorphic(
            style: NeumorphicStyle(
              color: HexColor("E19D4D"),
              depth: -3,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: GoogleFonts.tauri(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
                controller: _feetController,
                keyboardType: TextInputType.number,
                onChanged: (_) => _convertUnit(UnitType.feet),
                decoration: const InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                ],
              ),
            ),
          ),
          NeumorphicText(
            "Meter",
            style: NeumorphicStyle(
              color: HexColor("fcba03"),
              intensity: 0.9,
              depth: 0.5,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: MediaQuery.of(context).size.height / 31,
              fontFamily: GoogleFonts.trykker().fontFamily,
            ),
          ),
          Neumorphic(
            style: NeumorphicStyle(
              color: HexColor("E19D4D"),
              depth: -3,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: GoogleFonts.tauri(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
                controller: _meterController,
                keyboardType: TextInputType.number,
                onChanged: (_) => _convertUnit(UnitType.meter),
                decoration: const InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                ],
              ),
            ),
          ),
          NeumorphicText(
            "Centimeter",
            style: NeumorphicStyle(
              color: HexColor("fcba03"),
              intensity: 0.9,
              depth: 0.5,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: MediaQuery.of(context).size.height / 31,
              fontFamily: GoogleFonts.trykker().fontFamily,
            ),
          ),
          Neumorphic(
            style: NeumorphicStyle(
              color: HexColor("E19D4D"),
              depth: -3,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: GoogleFonts.tauri(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
                controller: _centimeterController,
                keyboardType: TextInputType.number,
                onChanged: (_) => _convertUnit(UnitType.centimeter),
                decoration: const InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
              ),
            ),
          ),
          NeumorphicText(
            "Kilogram",
            style: NeumorphicStyle(
              color: HexColor("fcba03"),
              intensity: 0.9,
              depth: 0.5,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: MediaQuery.of(context).size.height / 31,
              fontFamily: GoogleFonts.trykker().fontFamily,
            ),
          ),
          Neumorphic(
            style: NeumorphicStyle(
              color: HexColor("E19D4D"),
              depth: -3,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: GoogleFonts.tauri(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
                controller: _kilogramController,
                keyboardType: TextInputType.number,
                onChanged: (_) => _convertUnit(UnitType.kilogram),
                decoration: const InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                ],
              ),
            ),
          ),
          NeumorphicText(
            "Gram",
            style: NeumorphicStyle(
              color: HexColor("fcba03"),
              intensity: 0.9,
              depth: 0.5,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: MediaQuery.of(context).size.height / 31,
              fontFamily: GoogleFonts.trykker().fontFamily,
            ),
          ),
          Neumorphic(
            style: NeumorphicStyle(
              color: HexColor("E19D4D"),
              depth: -3,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: GoogleFonts.tauri(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
                controller: _gramController,
                keyboardType: TextInputType.number,
                onChanged: (_) => _convertUnit(UnitType.gram),
                decoration: const InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width / 12,
                ),
                child: NeumorphicButton(
                  onPressed: () {
                    calculate();
                  },
                  minDistance: -2,
                  style: NeumorphicStyle(
                    intensity: 0.8,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    color: HexColor("E19D4D"),
                    depth: 2,
                  ),
                  child: NeumorphicText(
                    "BMI",
                    style: NeumorphicStyle(
                      color: HexColor("fcba03"),
                      intensity: 0.9,
                      depth: 0.5,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontFamily: GoogleFonts.trykker().fontFamily,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width / 12,
                    ),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        color: HexColor("E19D4D"),
                        depth: -3,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: TextFormField(
                          enabled: false,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.tauri(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 35,
                            color: Colors.white,
                          ),
                          controller: _bmiController,
                          onChanged: (_) => _convertUnit(UnitType.bmi),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 60,
                  ),
                  NeumorphicText(
                    "kg/m\u00b2",
                    style: NeumorphicStyle(
                      color: HexColor("fcba03"),
                      intensity: 0.9,
                      depth: 0.5,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontFamily: GoogleFonts.trykker().fontFamily,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
