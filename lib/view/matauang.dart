import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedInputCurrency = 'USD';
  String _selectedOutputCurrency = 'EUR';
  double _result = 0.0;

  static const Map<String, double> _conversionRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'IDR': 14735.0,
    'MYR': 4.17,
  };

  void _convertCurrency() {
    setState(() {
      double amount = double.tryParse(_amountController.text) ?? 0.0;

      if (_conversionRates.containsKey(_selectedInputCurrency) &&
          _conversionRates.containsKey(_selectedOutputCurrency)) {
        double inputRate = _conversionRates[_selectedInputCurrency]!;
        double outputRate = _conversionRates[_selectedOutputCurrency]!;

        _result = (amount / inputRate) * outputRate;
      } else {
        _result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
            ),
            DropdownButton<String>(
              value: _selectedInputCurrency,
              items: _conversionRates.keys
                  .map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedInputCurrency = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedOutputCurrency,
              items: _conversionRates.keys
                  .map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOutputCurrency = newValue!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text('Result: $_result $_selectedOutputCurrency',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
