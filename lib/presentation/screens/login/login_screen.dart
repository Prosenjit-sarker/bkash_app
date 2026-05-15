import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/core/app_strings.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _accountController;
  late TextEditingController _pinController;

  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController();
    _pinController = TextEditingController();
    _accountController.addListener(() {
      setState(() {});
    });
    _pinController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _accountController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _addPin(String digit) {
    if (_pinController.text.length < 5) {
      _pinController.text += digit;
    }
  }

  void _deletePin() {
    if (_pinController.text.isNotEmpty) {
      _pinController.text = _pinController.text.substring(0, _pinController.text.length - 1);
    }
  }

  void _login() {
    if (_accountController.text.isEmpty || _pinController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter account and PIN')));
      return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 20, color: AppColors.primary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    OutlinedButton(onPressed: () {}, child: const Text(AppStrings.bangla)),
                  ],
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(image: AssetImage('assets/bkash.png'), height: 40, color: AppColors.primary),
                    const Icon(Icons.qr_code_2, size: 40, color: AppColors.primary),
                  ],
                ),
                const SizedBox(height: 30),
                const Text('LOG IN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                const Text('To your bKash Account', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                const SizedBox(height: 24),
                TextField(
                  controller: _accountController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.textDark),
                  decoration: const InputDecoration(
                    labelText: AppStrings.accountNumber,
                    labelStyle: TextStyle(fontSize: 13, color: AppColors.textGrey),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 8),
                  ),
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _pinController,
                  builder: (context, value, child) {
                    return TextField(
                      controller: _pinController,
                      obscureText: true,
                      obscuringCharacter: '●',
                      keyboardType: TextInputType.none,
                      readOnly: true,
                      style: const TextStyle(fontSize: 17, color: AppColors.textDark, letterSpacing: 4),
                      decoration: InputDecoration(
                        labelText: AppStrings.bkashPin,
                        labelStyle: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textGrey,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: AppStrings.enterPin,
                        hintStyle: const TextStyle(fontSize: 14, color: AppColors.textGrey, letterSpacing: 0),
                        border: const UnderlineInputBorder(),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.divider)),
                        contentPadding: const EdgeInsets.only(bottom: 8),
                        suffixIcon: const Icon(Icons.fingerprint, color: AppColors.primary, size: 28),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('PIN reset feature coming soon')));
                  },
                  child: const Text(AppStrings.forgotPin, style: TextStyle(color: AppColors.primary, fontSize: 12)),
                ),
                const SizedBox(height: 32),
                // PIN Pad
                if (_accountController.text.isNotEmpty)
                  Column(
                    children: [
                      const Text('Enter PIN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          ...List.generate(9, (index) {
                            return _pinButton('${index + 1}', () {
                              _addPin('${index + 1}');
                            });
                          }),
                          _pinButton('*', () {}),
                          _pinButton('0', () {
                            _addPin('0');
                          }),
                          _pinButton('⌫', () {
                            _deletePin();
                          }),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                    onPressed: _login,
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pinButton(String label, VoidCallback onPressed) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.divider),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textDark),
            ),
          ),
        ),
      ),
    );
  }
}
