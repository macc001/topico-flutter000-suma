import 'package:flutter/material.dart';

class SumaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SumaPageState();
  }
}

class _SumaPageState extends State<SumaPage> {
  String _var1 = "0";
  String _var2 = "0";
  int _result = 0;
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Primera Practica'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(),
              Divider(),
              _inputVar(_var1, "Valor1", "1", _controller1),
              Divider(),
              _inputVar(_var2, "Valor2", "2", _controller2),
              Divider(),
              _label(),
            ],
          ),
        ),
        floatingActionButton: _operacion());
  }

  Widget _inputVar(String hintTexto, String labelText, String tipo,
      TextEditingController control) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: control,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hintTexto,
        labelText: labelText,
      ),
      onChanged: (valor) {
        if (tipo == "1") {
          setState(() {
            _var1 = valor;
          });
        } else if (tipo == "2") {
          setState(() {
            _var2 = valor;
          });
        }
      },
    );
  }

  Widget _label() {
    String _res = _result.toString();
    return Text('Resultado es: $_res');
  }

  Widget _operacion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.clear_all),
          onPressed: _reset,
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: _restar,
        ),
        SizedBox(
          width: 10.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _sumar,
        )
      ],
    );
  }

  void _sumar() {
    setState(() {
      _result = int.parse(_var1) + int.parse(_var2);
    });
  }

  void _restar() {
    setState(() {
      _result = int.parse(_var1) - int.parse(_var2);
    });
  }

  void _reset() {
    setState(() {
      _var1 = "0";
      _var2 = "0";
      _result = 0;
      _controller1.clear();
      _controller2.clear();
    });
  }
}
