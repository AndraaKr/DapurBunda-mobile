import 'package:flutter/material.dart';
import 'register_screen.dart'; // Import halaman register
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  bool _isLoading = false; // Variable untuk mengatur status loading
  String _email = '';
  String _password = '';

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FCD9),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 30.0,
                  fontFamily: 'Nunito', // Menggunakan font dengan family Nunito
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                'Akses akun Anda dengan mengisi formulir di bawah ini.',
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 20.0,
                  fontFamily: 'Nunito', // Menggunakan font dengan family Nunito
                  fontWeight: FontWeight.w200,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: const Icon(
                  Icons.email,
                  color: Color(0xFF00881B),
                ),
                title: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Masukkan Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: const Icon(
                  Icons.lock,
                  color: Color(0xFF00881B),
                ),
                title: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    hintText: 'Masukkan Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFF00881B),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading =
                        true; // Set loading menjadi true saat tombol ditekan
                  });
                  // Tambahkan logika pengecekan email dan password di sini
                  Future.delayed(const Duration(seconds: 2), () {
                    if (_email == 'email' && _password == 'password') {
                      // Jika email dan password benar
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DashboardScreen(), // Navigasi ke halaman dashboard
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            title: const Text('Pemberitahuan!'),
                            content: const Text('Email atau Password Salah.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    setState(() {
                      _isLoading = false; // Set loading menjadi false
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  minimumSize: const Size(260, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  backgroundColor: const Color(0xFF367E18),
                  shadowColor: Colors.black.withOpacity(0.7),
                  elevation: 3,
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  const Text(
                    'Belum Memiliki Akun?',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const RegisterScreen(), // Navigasi ke halaman register
                        ),
                      );
                    },
                    child: const Text(
                      'Daftar Disini',
                      style: TextStyle(
                        color: Color(0xFF00881B),
                        fontSize: 17.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
