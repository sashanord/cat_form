import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CatForm(),));
}

class CatForm extends StatefulWidget {
  const CatForm({Key? key}) : super(key: key);

  @override
  State<CatForm> createState() => _CatFormState();
}

class _CatFormState extends State<CatForm> {
  final _formKey = GlobalKey<FormState>();
  var anyFood = [false, false, false];
  var _gender = null;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text('Котег'),),
        body: Container(
          padding: const EdgeInsets.all(10.0),

          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('Кличка питомца'),
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) return 'Имя питомца';
                    return null;
                  },),
                  const SizedBox(height: 20.0),
                  const Text('Ваше имя'),
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) return 'Ваше имя';
                    return null;
                  },),
                  const SizedBox(height: 20.0),
                  const Text('Контактные данные'),
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) return 'Контакты';
                    return null;
                  },),
                  const SizedBox(height: 20.0),
                  const Text('Порода питомца'),
                  TextFormField(validator: (value) {
                    if(value!.isEmpty) return 'Порода';
                    return null;
                  },),
                  const SizedBox(height: 20.0),
                  const Text('Чем питается'),
                  CheckboxListTile(value: anyFood[0],
                    onChanged: (value) => setState(() =>anyFood[0] = !anyFood[0]),
                    title:Text('сухой корм'),
                    ),
                  const SizedBox(height: 20.0),
                  CheckboxListTile(value: anyFood[1],
                    onChanged: (value) => setState(() =>anyFood[1] = !anyFood[1]),
                    title:Text('влажный корм'),
                  ),
                  const SizedBox(height: 20.0),
                  CheckboxListTile(value: anyFood[2],
                    onChanged: (value) => setState(() =>anyFood[2] = !anyFood[2]),
                    title:Text('натуральный  корм'),
                  ),
                  const SizedBox(height: 20.0),
                  RadioListTile(value: 0, groupValue: _gender, onChanged: (value) => {if (value != null) setState(() => _gender = value)} , title: Text('Мужской'),),
                  RadioListTile(value: 1, groupValue: _gender, onChanged: (value) => {if (value != null) setState(() => _gender = value)} , title: Text('Женский'),),

              const SizedBox(height: 20.0),
              ElevatedButton(onPressed: () {
                if(_formKey.currentState!.validate()) {
                  String text;

                  if (anyFood.every((element) => element == false)){
                    text = 'Выберите, что ест питомец';
                  } else if(_gender == null) {
                    text = 'Выберите пол';
                  }else {
                    text = 'Форма успешно заполнена';
                  }

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

                }
              },child: const Text('Проверить'),)


                ],
              ),
            ),

          ),
        ),
    );
  }
}

