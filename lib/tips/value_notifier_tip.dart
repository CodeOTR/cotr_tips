import 'package:flutter/material.dart';

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

ValueNotifier<Map<String, int>> map = ValueNotifier({});

void addDataMapMutable(String key, int val) {
  map.value[key] = val;
}

void addDataMap(String key, int val) {
  map.value = {...map.value, key: val};
}

ValueNotifier<List<int>> data = ValueNotifier([]);

void addDataMutable(int val) {
  data.value.add(val);
}

void addData(int val) {
  data.value = [...data.value, val];
}

ValueNotifier<Person> person = ValueNotifier(Person(
  name: 'Elon Musk',
  age: 52,
));

void setPerson(Person val) {
  person.value = val;
}

void setPersonName(String name) {
  person.value = Person(name: name, age: person.value.age);
}

void setPersonNameMutable(String name) {
  person.value.name = name;
}

class ValueNotifierTip extends StatelessWidget {
  const ValueNotifierTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ValueNotifier Tip'),
        ),
        body:  ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const ListTile(
                title: Text('List'),
              ),
              ValueListenableBuilder(
                valueListenable: data,
                builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(value.toString()),
                      OutlinedButton(
                          onPressed: () {
                            addDataMutable(1);
                          },
                          child: const Text('Update Mutable State')),
                      OutlinedButton(
                          onPressed: () {
                            addData(1);
                          },
                          child: const Text('Update State')),
                    ],
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: person,
                builder: (context, value, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        title: Text('Person'),
                      ),
                      Text(value.name),
                      OutlinedButton(
                          onPressed: () {
                            setPersonNameMutable(value.name == 'Jeff Bezos' ? 'Elon Musk' : 'Jeff Bezos');
                          },
                          child: const Text('Update Mutable State')),
                      OutlinedButton(
                          onPressed: () {
                            setPersonName(value.name == 'Jeff Bezos' ? 'Elon Musk' : 'Jeff Bezos');
                          },
                          child: const Text('Update State')),
                    ],
                  );
                }
              ),
              ValueListenableBuilder(
                  valueListenable: map,
                  builder: (context, value, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ListTile(
                          title: Text('Map'),
                        ),
                        Text(value.toString()),
                        OutlinedButton(
                            onPressed: () {
                              addDataMapMutable(DateTime.now().millisecondsSinceEpoch.toString(), 1);
                            },
                            child: const Text('Update Mutable State')),
                        OutlinedButton(
                            onPressed: () {
                              addDataMap(DateTime.now().millisecondsSinceEpoch.toString(), 1);
                            },
                            child: const Text('Update State')),
                      ],
                    );
                  }
              ),
            ]));
  }
}
