import 'package:flutter/material.dart';
import 'package:planets/planets.dart';

class AddPlanetPage extends StatefulWidget {
  const AddPlanetPage({Key? key}) : super(key: key);

  @override
  _AddPlanetPageState createState() => _AddPlanetPageState();
}

class _AddPlanetPageState extends State<AddPlanetPage> {
  _AddPlanetPageState({Key? key}) : super();

  double? radius;
  Color? color;
  int? distance;
  int? speed;
  var i = 'Select color';
  List<Color> colours = [
    Colors.black,
    Colors.white,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.lightBlue,
    Colors.deepOrange,
    Colors.cyanAccent,
    Colors.green,
    Colors.red,
    Colors.lime,
    Colors.amber,
  ];
  List<String> colorNames = [
    'black',
    'white',
    'redAccent',
    'orangeAccent',
    'lightBlue',
    'deepOrange',
    'cyanAccent',
    'green',
    'red',
    'lime',
    'amber',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Planet',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 100.0,
            child: DropdownButton(
              items: const [
                DropdownMenuItem(
                  child: Text('4'),
                  value: '4',
                ),
                DropdownMenuItem(
                  child: Text('5'),
                  value: '5',
                ),
                DropdownMenuItem(
                  child: Text('6'),
                  value: '6',
                ),
                DropdownMenuItem(
                  child: Text('7'),
                  value: '7',
                ),
                DropdownMenuItem(
                  child: Text('8'),
                  value: '8',
                ),
                DropdownMenuItem(
                  child: Text('9'),
                  value: '9',
                ),
                DropdownMenuItem(
                  child: Text('10'),
                  value: '10',
                ),
                DropdownMenuItem(
                  child: Text('11'),
                  value: '11',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  radius = double.parse(value!);
                });
              },
              hint: Container(
                height: 50.0,
                width: 100.0,
                child:
                    Text(radius == null ? 'Select radius' : radius.toString()),
                margin: const EdgeInsets.only(right: 10.0),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
            child: DropdownButton<String>(
              //value: i,
              items: getColors(),
              onChanged: (e) {
                setState(() {
                  switch (e) {
                    case 'black':
                      i = colorNames[0];
                      color = colours[0];
                      break;
                    case 'white':
                      i = colorNames[1];
                      color = colours[1];
                      break;
                    case 'redAccent':
                      i = colorNames[2];
                      color = colours[2];
                      break;
                    case 'orangeAccent':
                      i = colorNames[3];
                      color = colours[3];
                      break;
                    case 'lightBlue':
                      i = colorNames[4];
                      color = colours[4];
                      break;
                    case 'deepOrange':
                      i = colorNames[5];
                      color = colours[5];
                      break;
                    case 'cyanAccent':
                      i = colorNames[6];
                      color = colours[6];
                      break;
                    case 'green':
                      i = colorNames[7];
                      color = colours[7];
                      break;
                    case 'red':
                      i = colorNames[8];
                      color = colours[8];
                      break;
                    case 'lime':
                      i = colorNames[9];
                      color = colours[9];
                      break;
                    case 'amber':
                      i = colorNames[10];
                      color = colours[10];
                      break;
                  }
                });
              },
              hint: Row(
                children: [
                  Container(
                    height: 30.0,
                    width: 30.0,
                    color: color ?? Colors.transparent,
                    margin: const EdgeInsets.only(right: 10.0),
                  ),
                  Text(i),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
            child: DropdownButton(
              items: const [
                DropdownMenuItem(
                  child: Text('10'),
                  value: '10',
                ),
                DropdownMenuItem(
                  child: Text('30'),
                  value: '30',
                ),
                DropdownMenuItem(
                  child: Text('50'),
                  value: '50',
                ),
                DropdownMenuItem(
                  child: Text('60'),
                  value: '60',
                ),
                DropdownMenuItem(
                  child: Text('80'),
                  value: '80',
                ),
                DropdownMenuItem(
                  child: Text('100'),
                  value: '100',
                ),
                DropdownMenuItem(
                  child: Text('120'),
                  value: '120',
                ),
                DropdownMenuItem(
                  child: Text('140'),
                  value: '140',
                ),
                DropdownMenuItem(
                  child: Text('160'),
                  value: '160',
                ),
                DropdownMenuItem(
                  child: Text('180'),
                  value: '180',
                ),
                DropdownMenuItem(
                  child: Text('200'),
                  value: '200',
                ),
                DropdownMenuItem(
                  child: Text('220'),
                  value: '220',
                ),
                DropdownMenuItem(
                  child: Text('240'),
                  value: '240',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  distance = int.parse(value!);
                });
              },
              hint: Container(
                height: 50.0,
                width: 100.0,
                child: Text(
                    distance == null ? 'Select distance' : distance.toString()),
                margin: const EdgeInsets.only(right: 10.0),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
            child: DropdownButton(
              items: const [
                DropdownMenuItem(
                  child: Text('1'),
                  value: '1',
                ),
                DropdownMenuItem(
                  child: Text('2'),
                  value: '2',
                ),
                DropdownMenuItem(
                  child: Text('3'),
                  value: '3',
                ),
                DropdownMenuItem(
                  child: Text('4'),
                  value: '4',
                ),
                DropdownMenuItem(
                  child: Text('5'),
                  value: '5',
                ),
                DropdownMenuItem(
                  child: Text('6'),
                  value: '6',
                ),
                DropdownMenuItem(
                  child: Text('7'),
                  value: '7',
                ),
                DropdownMenuItem(
                  child: Text('8'),
                  value: '8',
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  speed = int.parse(value!);
                });
              },
              hint: Container(
                height: 50.0,
                width: 100.0,
                child: Text(speed == null ? 'Select speed' : speed.toString()),
                margin: const EdgeInsets.only(right: 10.0),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (radius != null &&
                  color != null &&
                  distance != null &&
                  speed != null) {
                Planets.radii.add(radius!);
                Planets.colors.add(color!);
                Planets.distances.add(distance!);
                Planets.scores.add(speed!);
                //setState(() {
                  Planets.onPage = true;
                //});
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Planets(),
                      ),
                          (Route<dynamic> route) => false);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('There is an unselected detail'),
                  ),
                );
              }
            },
            child: const Text('Add Planet'),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getColors() {
    List<DropdownMenuItem<String>>? list = [];

    for (int i = 0; i < colours.length; i++) {
      list.add(
        DropdownMenuItem(
          child: Container(
            color: colours[i],
          ),
          value: colorNames[i],
        ),
      );
    }
    return list;
  }
}
