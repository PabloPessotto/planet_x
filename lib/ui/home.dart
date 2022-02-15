import 'package:flutter/material.dart';

enum Planets { pluto, mars, venus }

class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerWeight = TextEditingController();
  Planets? _planets = Planets.mars;
  String _namePlanet = "";
  double _result = 0.0;

  void accountValorRadio(Planets? planets) {
    setState(() {
      _planets = planets;
      switch (_planets) {
        case Planets.pluto:
          _result = calculateWeightOnPlanet(_controllerWeight.text, 0.06);
          _namePlanet = "Peso em Plutão é ${_result.toStringAsFixed(2)}";

          break;
        case Planets.mars:
          _result = calculateWeightOnPlanet(_controllerWeight.text, 0.38);
          _namePlanet = "Peso em Marte é ${_result.toStringAsFixed(2)}";

          break;

        case Planets.venus:
          _result = calculateWeightOnPlanet(_controllerWeight.text, 0.91);
          _namePlanet = "Peso em Vênus é ${_result.toStringAsFixed(2)}";

          break;
        default:
          debugPrint("Nada foi selecionado");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PLANET X"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controllerWeight,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'O seu peso na Terra',
                        hintText: 'Kg',
                        icon: Icon(Icons.person_outline)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<Planets>(
                        activeColor: Colors.brown,
                        value: Planets.pluto,
                        groupValue: _planets,
                        onChanged: accountValorRadio,
                      ),
                      const Text(
                        "Plutão",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<Planets>(
                        activeColor: Colors.red,
                        value: Planets.mars,
                        groupValue: _planets,
                        onChanged: accountValorRadio,
                      ),
                      const Text(
                        "Marte",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<Planets>(
                        activeColor: Colors.orangeAccent,
                        value: Planets.venus,
                        groupValue: _planets,
                        onChanged: accountValorRadio,
                      ),
                      const Text(
                        "Vênus",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  Text(
                    _controllerWeight.text.isEmpty
                        ? "Insira o seu peso"
                        : _namePlanet + "Kg",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeightOnPlanet(String weight, double surfaceGravity) {
    if (weight.isNotEmpty && int.parse(weight) > 0) {
      return (int.parse(weight) * surfaceGravity);
    } else {
      debugPrint("Wrong number...");
      return int.parse("180") * 0.38;
    }
  }
}
