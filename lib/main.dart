import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'dart:math';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(const ByitApp());

}

class ByitApp extends StatelessWidget {

  const ByitApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'byit',

      theme: ThemeData(

        fontFamily: 'Arial',

        scaffoldBackgroundColor: const Color(0xFFF7F1E8),

        colorScheme: ColorScheme.fromSeed(

          seedColor: const Color(0xFF214C45),

        ),

      ),

      home: const WelcomeScreen(),

    );

  }

}
// ============================================================// Welcome Screen// ============================================================
class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({super.key});

  @override

  Widget build(BuildContext context) {

    return Directionality(

      textDirection: TextDirection.rtl,

      child: Scaffold(

        backgroundColor: const Color(0xFFF7F1E8),

        body: SafeArea(

          child: Center(

            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 30),

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(

                    width: 110,

                    height: 110,

                    decoration: BoxDecoration(

                      color: const Color(0xFF214C45),

                      borderRadius: BorderRadius.circular(35),

                    ),

                    child: const Icon(

                      Icons.home_rounded,

                      color: Colors.white,

                      size: 65,

                    ),

                  ),

                  const SizedBox(height: 30),

                  const Text(

                    'byit',

                    style: TextStyle(

                      fontSize: 52,

                      fontWeight: FontWeight.bold,

                      color: Color(0xFF214C45),

                    ),

                  ),

                  const SizedBox(height: 8),

                  const Text(

                    'تنظيم اليوم .. لراحة الغد',

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      fontSize: 20,

                      color: Color(0xFF64716C),

                    ),

                  ),

                  const SizedBox(height: 55),
// ابدأ الآن
                  SizedBox(

                    width: double.infinity,

                    height: 60,

                    child: ElevatedButton(

                      onPressed: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) => const StartScreen(),

                          ),

                        );

                      },

                      style: ElevatedButton.styleFrom(

                        backgroundColor: const Color(0xFF214C45),

                        foregroundColor: Colors.white,

                        elevation: 2,

                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(22),

                        ),

                      ),

                      child: const Text(

                        'ابدأ الآن',

                        style: TextStyle(

                          fontSize: 21,

                          fontWeight: FontWeight.bold,

                        ),

                      ),

                    ),

                  ),

                ],

              ),

            ),

          ),

        ),

      ),

    );

  }

}
// ============================================================// Start Screen// ============================================================
class StartScreen extends StatelessWidget {

  const StartScreen({super.key});

  @override

  Widget build(BuildContext context) {

    return Directionality(

      textDirection: TextDirection.rtl,

      child: Scaffold(

        backgroundColor: const Color(0xFFF7F1E8),

        appBar: AppBar(

          backgroundColor: const Color(0xFFE8ECE4),

          elevation: 0,

          leading: IconButton(

            icon: const Icon(

              Icons.arrow_back,

              color: Color(0xFF214C45),

            ),

            onPressed: () {

              Navigator.pop(context);

            },

          ),

        ),

        body: Padding(

          padding: const EdgeInsets.all(28),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(

                Icons.home_work_rounded,

                size: 90,

                color: Color(0xFF214C45),

              ),

              const SizedBox(height: 25),

              const Text(

                'مرحبًا بك في byit',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 30,

                  fontWeight: FontWeight.bold,

                  color: Color(0xFF214C45),

                ),

              ),

              const SizedBox(height: 12),

              const Text(

                'نظّم بيتك وشارك تفاصيله بسهولة',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 18,

                  color: Color(0xFF64716C),

                ),

              ),

              const SizedBox(height: 50),
// تسجيل الدخول
              SizedBox(

                width: double.infinity,

                height: 58,

                child: ElevatedButton(

                  onPressed: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) => const LoginScreen(),

                      ),

                    );

                  },

                  style: ElevatedButton.styleFrom(

                    backgroundColor: const Color(0xFF214C45),

                    foregroundColor: Colors.white,

                    elevation: 2,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(20),

                    ),

                  ),

                  child: const Text(

                    'تسجيل الدخول',

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ),

              const SizedBox(height: 18),
// إنشاء حساب
              SizedBox(

                width: double.infinity,

                height: 58,

                child: OutlinedButton(

                  onPressed: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) => const RegisterScreen(),

                      ),

                    );

                  },

                  style: OutlinedButton.styleFrom(

                    foregroundColor: const Color(0xFF214C45),

                    side: const BorderSide(

                      color: Color(0xFF214C45),

                      width: 2,

                    ),

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(20),

                    ),

                  ),

                  child: const Text(

                    'إنشاء حساب',

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}
// ============================================================// Register Screen// ============================================================
class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override

  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  String accountType = 'زوج';

  bool loading = false;

  bool obscurePassword = true;

  bool obscureConfirmPassword = true;

  String normalizePhone(String input) {

    String phone = input.trim().replaceAll(' ', '');

    if (phone.startsWith('+970')) {

      phone = phone.substring(1);

    } else if (phone.startsWith('00970')) {

      phone = phone.substring(2);

    } else if (phone.startsWith('059') ||

        phone.startsWith('056')) {

      phone = '970' + phone.substring(1);

    } else if (phone.startsWith('59') ||

        phone.startsWith('56')) {

      phone = '970$phone';

    }

    return phone;

  }

  String internalEmail(String phone) {

    return '$phone@byit.app';

  }

  Future<void> register() async {

    final name = nameController.text.trim();

    final phone = normalizePhone(phoneController.text);

    final password = passwordController.text;

    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty) {

      showMessage(

        'تنبيه',

        'يرجى إدخال الاسم',

      );

      return;

    }

    if (phone.isEmpty) {

      showMessage(

        'تنبيه',

        'يرجى إدخال رقم الجوال',

      );

      return;

    }

    final phoneRegex = RegExp(r'^970(59|56)\d{7}$');

    if (!phoneRegex.hasMatch(phone)) {

      showMessage(

        'رقم الجوال غير صحيح',

        'أدخل رقم جوال فلسطيني صحيح مثل:\n0591234567',

      );

      return;

    }

    if (password.isEmpty) {

      showMessage(

        'تنبيه',

        'يرجى إدخال كلمة المرور',

      );

      return;

    }

    if (password.length < 6) {

      showMessage(

        'كلمة المرور',

        'يجب أن تكون كلمة المرور 6 أحرف أو أرقام على الأقل.',

      );

      return;

    }

    if (password != confirmPassword) {

      showMessage(

        'كلمة المرور',

        'كلمتا المرور غير متطابقتين.',

      );

      return;

    }

    setState(() {

      loading = true;

    });

    try {

      final credential = await FirebaseAuth.instance

          .createUserWithEmailAndPassword(

        email: internalEmail(phone),

        password: password,

      );

      final user = credential.user;

      if (user == null) {

        throw Exception(

          'لم يتم إنشاء مستخدم في Firebase.',

        );

      }

      await user.updateDisplayName(name);

      await FirebaseFirestore.instance

          .collection('users')

          .doc(phone)

          .set({

        'uid': user.uid,

        'name': name,

        'phone': phone,

        'accountType': accountType,

        'homeId': null,

        'createdAt': FieldValue.serverTimestamp(),

      });

      if (!mounted) return;

      setState(() {

        loading = false;

      });

      await showDialog(

        context: context,

        barrierDismissible: false,

        builder: (_) {

          return AlertDialog(

            title: const Text(

              'تم بنجاح 🎉',

              textAlign: TextAlign.right,

            ),

            content: const Text(

              'تم إنشاء الحساب وحفظ بياناتك بنجاح.',

              textAlign: TextAlign.right,

            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text('متابعة'),

              ),

            ],

          );

        },

      );

      if (!mounted) return;

      Navigator.popUntil(

        context,

        (route) => route.isFirst,

      );

    } on FirebaseAuthException catch (e) {

      if (!mounted) return;

      setState(() {

        loading = false;

      });

      String message =

          'حدث خطأ أثناء إنشاء الحساب.';

      if (e.code == 'email-already-in-use') {

        message = 'رقم الجوال مستخدم من قبل.';

      } else if (e.code == 'weak-password') {

        message = 'كلمة المرور ضعيفة.';

      } else if (e.code == 'invalid-email') {

        message = 'بيانات الحساب غير صحيحة.';

      } else if (e.code == 'network-request-failed') {

        message = 'تأكد من اتصال الإنترنت.';

      }

      await showDialog(

        context: context,

        builder: (_) {

          return AlertDialog(

            title: const Text(

              'خطأ',

              textAlign: TextAlign.right,

            ),

            content: Text(

              '$message\n\nرمز الخطأ: ${e.code}',

              textAlign: TextAlign.right,

            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text('حسنًا'),

              ),

            ],

          );

        },

      );

    } catch (e) {

      if (!mounted) return;

      setState(() {

        loading = false;

      });

      await showDialog(

        context: context,

        builder: (_) {

          return AlertDialog(

            title: const Text(

              'خطأ',

              textAlign: TextAlign.right,

            ),

            content: Text(

              'حدث خطأ أثناء حفظ بيانات الحساب.\n\n$e',

              textAlign: TextAlign.right,

            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text('حسنًا'),

              ),

            ],

          );

        },

      );

    }

  }

  void showMessage(

    String title,

    String message,

  ) {

    showDialog(

      context: context,

      builder: (_) {

        return AlertDialog(

          title: Text(

            title,

            textAlign: TextAlign.right,

          ),

          content: Text(

            message,

            textAlign: TextAlign.right,

          ),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(context);

              },

              child: const Text('حسنًا'),

            ),

          ],

        );

      },

    );

  }

  @override

  void dispose() {

    nameController.dispose();

    phoneController.dispose();

    passwordController.dispose();

    confirmPasswordController.dispose();

    super.dispose();

  }

  @override

  Widget build(BuildContext context) {

    return Directionality(

      textDirection: TextDirection.rtl,

      child: Scaffold(

        backgroundColor: const Color(0xFFF7F1E8),

        appBar: AppBar(

          backgroundColor: const Color(0xFFE8ECE4),

          elevation: 0,

          leading: IconButton(

            icon: const Icon(

              Icons.arrow_back,

              color: Color(0xFF214C45),

            ),

            onPressed: () {

              Navigator.pop(context);

            },

          ),

        ),

        body: SingleChildScrollView(

          padding: const EdgeInsets.fromLTRB(

            20,

            20,

            20,

            30,

          ),

          child: Column(

            crossAxisAlignment:

                CrossAxisAlignment.stretch,

            children: [

              const Text(

                'إنشاء حساب',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 32,

                  fontWeight: FontWeight.bold,

                  color: Color(0xFF214C45),

                ),

              ),

              const SizedBox(height: 10),

              const Text(

                'أنشئ حسابك وابدأ بتنظيم بيتك',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 18,

                  color: Color(0xFF64716C),

                ),

              ),

              const SizedBox(height: 45),
// الاسم
              TextField(

                controller: nameController,

                textInputAction:

                    TextInputAction.next,

                decoration: InputDecoration(

                  labelText: 'الاسم',

                  prefixIcon: const Icon(

                    Icons.person_outline,

                    color: Color(0xFF214C45),

                  ),

                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius:

                        BorderRadius.circular(22),

                    borderSide: BorderSide.none,

                  ),

                ),

              ),

              const SizedBox(height: 20),
// رقم الجوال
              TextField(

                controller: phoneController,

                keyboardType:

                    TextInputType.phone,

                textDirection:

                    TextDirection.ltr,

                textInputAction:

                    TextInputAction.next,

                decoration: InputDecoration(

                  labelText: 'رقم الجوال',

                  prefixIcon: const Icon(

                    Icons.phone_outlined,

                    color: Color(0xFF214C45),

                  ),

                  hintText: '0591234567',

                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius:

                        BorderRadius.circular(22),

                    borderSide: BorderSide.none,

                  ),

                ),

              ),

              const SizedBox(height: 20),
// كلمة المرور
              TextField(

                controller:

                    passwordController,

                obscureText:

                    obscurePassword,

                textInputAction:

                    TextInputAction.next,

                decoration: InputDecoration(

                  labelText: 'كلمة المرور',

                  prefixIcon: const Icon(

                    Icons.lock_outline,

                    color: Color(0xFF214C45),

                  ),

                  suffixIcon: IconButton(

                    icon: Icon(

                      obscurePassword

                          ? Icons.visibility_outlined

                          : Icons.visibility_off_outlined,

                    ),

                    onPressed: () {

                      setState(() {

                        obscurePassword =

                            !obscurePassword;

                      });

                    },

                  ),

                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius:

                        BorderRadius.circular(22),

                    borderSide: BorderSide.none,

                  ),

                ),

              ),

              const SizedBox(height: 20),
// تأكيد كلمة المرور
              TextField(

                controller:

                    confirmPasswordController,

                obscureText:

                    obscureConfirmPassword,

                textInputAction:

                    TextInputAction.done,

                decoration: InputDecoration(

                  labelText: 'تأكيد كلمة المرور',

                  prefixIcon: const Icon(

                    Icons.lock_reset_outlined,

                    color: Color(0xFF214C45),

                  ),

                  suffixIcon: IconButton(

                    icon: Icon(

                      obscureConfirmPassword

                          ? Icons.visibility_outlined

                          : Icons.visibility_off_outlined,

                    ),

                    onPressed: () {

                      setState(() {

                        obscureConfirmPassword =

                            !obscureConfirmPassword;

                      });

                    },

                  ),

                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius:

                        BorderRadius.circular(22),

                    borderSide: BorderSide.none,

                  ),

                ),

              ),

              const SizedBox(height: 35),

              const Text(

                'نوع الحساب',

                textAlign: TextAlign.right,

                style: TextStyle(

                  fontSize: 20,

                  fontWeight: FontWeight.bold,

                  color: Color(0xFF214C45),

                ),

              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'زوج',
                      groupValue: accountType,
                      activeColor: const Color(0xFF214C45),
                      contentPadding: EdgeInsets.zero,
                      title: const Text('زوج'),
                      onChanged: (value) {
                        setState(() {
                          accountType = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'زوجة',
                      groupValue: accountType,
                      activeColor: const Color(0xFF214C45),
                      contentPadding: EdgeInsets.zero,
                      title: const Text('زوجة'),
                      onChanged: (value) {
                        setState(() {
                          accountType = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: 'ابن',
                      groupValue: accountType,
                      activeColor: const Color(0xFF214C45),
                      contentPadding: EdgeInsets.zero,
                      title: const Text('ابن'),
                      onChanged: (value) {
                        setState(() {
                          accountType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),
// إنشاء الحساب
              SizedBox(

                height: 62,

                child: ElevatedButton(

                  onPressed:

                      loading ? null : register,

                  style: ElevatedButton.styleFrom(

                    backgroundColor:

                        const Color(0xFF214C45),

                    foregroundColor:

                        Colors.white,

                    disabledBackgroundColor:

                        const Color(0xFF214C45),

                    disabledForegroundColor:

                        Colors.white,

                    elevation: 2,

                    shape:

                        RoundedRectangleBorder(

                      borderRadius:

                          BorderRadius.circular(22),

                    ),

                  ),

                  child: loading

                      ? const SizedBox(

                          width: 30,

                          height: 30,

                          child:

                              CircularProgressIndicator(

                            color: Colors.white,

                            strokeWidth: 3,

                          ),

                        )

                      : const Text(

                          'إنشاء الحساب',

                          style: TextStyle(

                            fontSize: 20,

                            fontWeight:

                                FontWeight.bold,

                          ),

                        ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}
// ============================================================// Login Screen// ============================================================
// ============================================================
class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override

  State<LoginScreen> createState() =>

      _LoginScreenState();

}

class _LoginScreenState

    extends State<LoginScreen> {

  final phoneController =

      TextEditingController();

  final passwordController =

      TextEditingController();

  bool loading = false;

  bool obscurePassword = true;

  String normalizePhone(String input) {

    String phone =

        input.trim().replaceAll(' ', '');

    if (phone.startsWith('+970')) {

      phone = phone.substring(1);

    } else if (phone.startsWith('00970')) {

      phone = phone.substring(2);

    } else if (phone.startsWith('059') ||

        phone.startsWith('056')) {

      phone =

          '970' + phone.substring(1);

    } else if (phone.startsWith('59') ||

        phone.startsWith('56')) {

      phone = '970$phone';

    }

    return phone;

  }

  String internalEmail(String phone) {

    return '$phone@byit.app';

  }

  Future<void> login() async {

    final phone =

        normalizePhone(phoneController.text);

    final password =

        passwordController.text;

    if (phone.isEmpty) {

      showMessage(

        'تنبيه',

        'أدخل رقم الجوال',

      );

      return;

    }

    if (password.isEmpty) {

      showMessage(

        'تنبيه',

        'أدخل كلمة المرور',

      );

      return;

    }

    final phoneRegex =

        RegExp(r'^970(59|56)\d{7}$');

    if (!phoneRegex.hasMatch(phone)) {

      showMessage(

        'رقم الجوال غير صحيح',

        'أدخل رقم جوال فلسطيني صحيح.',

      );

      return;

    }

    setState(() {

      loading = true;

    });

    try {

      await FirebaseAuth.instance

          .signInWithEmailAndPassword(

        email: internalEmail(phone),

        password: password,

      );

      if (!mounted) return;

      setState(() {

        loading = false;

      });

      await showDialog(

        context: context,

        barrierDismissible: false,

        builder: (_) {

          return AlertDialog(

            title: const Text(

              'تم بنجاح 🎉',

              textAlign: TextAlign.right,

            ),

            content: const Text(

              'تم تسجيل الدخول بنجاح.',

              textAlign: TextAlign.right,

            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text('متابعة'),

              ),

            ],

          );

        },

      );

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );

    } on FirebaseAuthException catch (e) {

      if (!mounted) return;

      setState(() {

        loading = false;

      });

      String message =

          'حدث خطأ أثناء تسجيل الدخول.';

      if (e.code ==

          'user-not-found') {

        message =

            'لا يوجد حساب بهذا الرقم.';

      } else if (e.code ==

          'wrong-password') {

        message =

            'كلمة المرور غير صحيحة.';

      } else if (e.code ==

          'invalid-credential') {

        message =

            'رقم الجوال أو كلمة المرور غير صحيحة.';

      } else if (e.code ==

          'invalid-email') {

        message =

            'رقم الجوال غير صحيح.';

      } else if (e.code ==

          'network-request-failed') {

        message =

            'تأكد من اتصال الإنترنت.';

      }

      await showDialog(

        context: context,

        builder: (_) {

          return AlertDialog(

            title: const Text(

              'خطأ',

              textAlign: TextAlign.right,

            ),

            content: Text(

              '$message\n\n'

              'رمز الخطأ: ${e.code}',

              textAlign: TextAlign.right,

            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text('حسنًا'),

              ),

            ],

          );

        },

      );

    } catch (e) {

      if (!mounted) return;

      setState(() {

        loading = false;

      });

      await showDialog(

        context: context,

        builder: (_) {

          return AlertDialog(

            title: const Text(

              'خطأ',

              textAlign: TextAlign.right,

            ),

            content: Text(

              'حدث خطأ:\n\n$e',

              textAlign: TextAlign.right,

            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text('حسنًا'),

              ),

            ],

          );

        },

      );

    }

  }

  void showMessage(

    String title,

    String message,

  ) {

    showDialog(

      context: context,

      builder: (_) {

        return AlertDialog(

          title: Text(

            title,

            textAlign: TextAlign.right,

          ),

          content: Text(

            message,

            textAlign: TextAlign.right,

          ),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(context);

              },

              child: const Text('حسنًا'),

            ),

          ],

        );

      },

    );

  }

  @override

  void dispose() {

    phoneController.dispose();

    passwordController.dispose();

    super.dispose();

  }

  @override

  Widget build(BuildContext context) {

    return Directionality(

      textDirection: TextDirection.rtl,

      child: Scaffold(

        backgroundColor:

            const Color(0xFFF7F1E8),

        appBar: AppBar(

          backgroundColor:

              const Color(0xFFE8ECE4),

          elevation: 0,

          leading: IconButton(

            icon: const Icon(

              Icons.arrow_back,

              color: Color(0xFF214C45),

            ),

            onPressed: () {

              Navigator.pop(context);

            },

          ),

        ),

        body: SingleChildScrollView(

          padding:

              const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:

                CrossAxisAlignment.stretch,

            children: [

              const SizedBox(height: 30),

              const Text(

                'تسجيل الدخول',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 32,

                  fontWeight:

                      FontWeight.bold,

                  color:

                      Color(0xFF214C45),

                ),

              ),

              const SizedBox(height: 10),

              const Text(

                'أهلاً بك من جديد في byit',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 18,

                  color:

                      Color(0xFF64716C),

                ),

              ),

              const SizedBox(height: 45),
// رقم الجوال
              TextField(

                controller:

                    phoneController,

                keyboardType:

                    TextInputType.phone,

                textDirection:

                    TextDirection.ltr,

                textInputAction:

                    TextInputAction.next,

                decoration:

                    InputDecoration(

                  labelText:

                      'رقم الجوال',

                  hintText:

                      '0591234567',

                  prefixIcon:

                      const Icon(

                    Icons.phone_outlined,

                    color:

                        Color(0xFF214C45),

                  ),

                  filled: true,

                  fillColor:

                      Colors.white,

                  border:

                      OutlineInputBorder(

                    borderRadius:

                        BorderRadius

                            .circular(22),

                    borderSide:

                        BorderSide.none,

                  ),

                ),

              ),

              const SizedBox(height: 20),
// كلمة المرور
              TextField(

                controller:

                    passwordController,

                obscureText:

                    obscurePassword,

                textInputAction:

                    TextInputAction.done,

                decoration:

                    InputDecoration(

                  labelText:

                      'كلمة المرور',

                  prefixIcon:

                      const Icon(

                    Icons.lock_outline,

                    color:

                        Color(0xFF214C45),

                  ),

                  suffixIcon:

                      IconButton(

                    icon: Icon(

                      obscurePassword

                          ? Icons

                              .visibility_outlined

                          : Icons

                              .visibility_off_outlined,

                    ),

                    onPressed: () {

                      setState(() {

                        obscurePassword =

                            !obscurePassword;

                      });

                    },

                  ),

                  filled: true,

                  fillColor:

                      Colors.white,

                  border:

                      OutlineInputBorder(

                    borderRadius:

                        BorderRadius

                            .circular(22),

                    borderSide:

                        BorderSide.none,

                  ),

                ),

              ),

              const SizedBox(height: 35),
// ==================================================// زر تسجيل الدخول// نفس لون "ابدأ الآن" بالضبط// ==================================================
              SizedBox(

                height: 62,

                child: Material(

                  color:

                      const Color(0xFF214C45),

                  borderRadius:

                      BorderRadius.circular(22),

                  elevation: 2,

                  child: InkWell(

                    borderRadius:

                        BorderRadius.circular(22),

                    onTap:

                        loading ? null : login,

                    child: Center(

                      child: loading

                          ? const SizedBox(

                              width: 30,

                              height: 30,

                              child:

                                  CircularProgressIndicator(

                                color:

                                    Colors.white,

                                strokeWidth:

                                    3,

                              ),

                            )

                          : const Text(

                              'تسجيل الدخول',

                              style:

                                  TextStyle(

                                fontSize: 20,

                                fontWeight:

                                    FontWeight.bold,

                                color:

                                    Colors.white,

                              ),

                            ),

                    ),

                  ),

                ),

              ),

              const SizedBox(height: 20),

              TextButton(

                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text(

                  'ليس لديك حساب؟ إنشاء حساب',

                  style: TextStyle(

                    color:

                        Color(0xFF214C45),

                    fontSize: 16,

                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}

// ============================================================
// Home Screen
// ============================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  String? userName;
  String? homeId;
  String? inviteCode;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  String getCurrentPhone() {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';
    if (email.endsWith('@byit.app')) {
      return email.substring(0, email.length - '@byit.app'.length);
    }
    return '';
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserDoc() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('لا يوجد مستخدم مسجل الدخول.');
    }

    // بيانات الحساب التي أنشأناها في التسجيل محفوظة تحت رقم الجوال.
    final phone = getCurrentPhone();

    if (phone.isNotEmpty) {
      final phoneRef = FirebaseFirestore.instance
          .collection('users')
          .doc(phone);

      final phoneDoc = await phoneRef.get();

      if (phoneDoc.exists) {
        return phoneDoc;
      }

      // إذا كان حساب Firebase موجوداً لكن بيانات Firestore لم تُحفظ
      // (مثلاً بسبب خطأ سابق في الصلاحيات)، ننشئ بيانات المستخدم تلقائياً.
      await phoneRef.set({
        'uid': user.uid,
        'name': user.displayName ?? '',
        'phone': phone,
        'accountType': 'غير محدد',
        'homeId': null,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return await phoneRef.get();
    }

    // احتياطياً إذا لم نستطع استخراج رقم الجوال من البريد الداخلي.
    final query = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user.uid)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      return query.docs.first;
    }

    throw Exception('لم يتم العثور على بيانات الحساب في قاعدة البيانات.');
  }

  Future<void> loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      // بيانات المستخدم محفوظة أساساً برقم الجوال كـ document ID.
      // لذلك نقرأها مباشرة بدلاً من عمل query على uid.
      final userSnap = await getCurrentUserDoc();

      if (!mounted) return;
      if (!userSnap.exists) {
        showMessage(
          'خطأ',
          'لم يتم العثور على بيانات الحساب في قاعدة البيانات.\n\n'
              'رقم الحساب: ${getCurrentPhone()}',
        );
        return;
      }

      final data = userSnap.data()!;
      final savedHomeId = data['homeId']?.toString();

      setState(() {
        userName = data['name']?.toString() ?? user.displayName ?? '';
        homeId = (savedHomeId == null || savedHomeId == 'null')
            ? null
            : savedHomeId;
      });

      if (homeId != null && homeId!.isNotEmpty) {
        final homeSnap = await FirebaseFirestore.instance
            .collection('homes')
            .doc(homeId)
            .get();
        if (!mounted) return;
        if (homeSnap.exists) {
          setState(() {
            inviteCode = homeSnap.data()?['inviteCode']?.toString();
          });
        }
      }
    } catch (e) {
      if (!mounted) return;
      showMessage('خطأ', 'تعذر تحميل بيانات البيت.\n\n$e');
    }
  }

  Future<String> generateUniqueInviteCode() async {
    final random = Random();

    for (int attempt = 0; attempt < 20; attempt++) {
      final code = (100000 + random.nextInt(900000)).toString();
      final check = await FirebaseFirestore.instance
          .collection('homes')
          .where('inviteCode', isEqualTo: code)
          .limit(1)
          .get();

      if (check.docs.isEmpty) return code;
    }

    throw Exception('تعذر إنشاء كود دعوة فريد. حاول مرة أخرى.');
  }

  Future<void> createHome() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      showMessage('تنبيه', 'يجب تسجيل الدخول أولاً.');
      return;
    }

    if (homeId != null && homeId!.isNotEmpty) {
      showMessage('البيت موجود', 'هذا الحساب مرتبط ببيت بالفعل.');
      return;
    }

    setState(() => loading = true);

    try {
      // المستخدم محفوظ في users تحت رقم الجوال، وليس تحت uid.
      final userDoc = await getCurrentUserDoc();

      if (!userDoc.exists) {
        throw Exception('لم يتم العثور على بيانات الحساب.');
      }

      final userData = userDoc.data()!;
      final name = userData['name']?.toString() ?? user.displayName ?? '';
      final code = await generateUniqueInviteCode();
      final homeRef = FirebaseFirestore.instance.collection('homes').doc();

      await homeRef.set({
        'createdBy': user.uid,
        'createdByName': name,
        'inviteCode': code,
        'createdAt': FieldValue.serverTimestamp(),
        'members': [user.uid],
      });

      await userDoc.reference.update({
        'homeId': homeRef.id,
      });

      if (!mounted) return;
      setState(() {
        loading = false;
        userName = name;
        homeId = homeRef.id;
        inviteCode = code;
      });

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('تم إنشاء البيت 🎉', textAlign: TextAlign.right),
          content: Text(
            'تم إنشاء البيت بنجاح.\n\nكود الدعوة الخاص بكم:\n\n$code',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ممتاز'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      showMessage('خطأ', 'تعذر إنشاء البيت.\n\n$e');
    }
  }

  Future<void> joinHome() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      showMessage('تنبيه', 'يجب تسجيل الدخول أولاً.');
      return;
    }

    if (homeId != null && homeId!.isNotEmpty) {
      showMessage('البيت موجود', 'هذا الحساب مرتبط ببيت بالفعل.');
      return;
    }

    final codeController = TextEditingController();

    final code = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('الانضمام إلى بيت'),
            content: TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: 'كود الدعوة',
                hintText: '123456',
                counterText: '',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  final value = codeController.text.trim();
                  if (RegExp(r'^\d{6}$').hasMatch(value)) {
                    Navigator.pop(dialogContext, value);
                  }
                },
                child: const Text('انضمام'),
              ),
            ],
          ),
        );
      },
    );

    codeController.dispose();

    if (code == null) return;

    setState(() => loading = true);

    try {
      final userDoc = await getCurrentUserDoc();
      final userData = userDoc.data()!;
      final name = userData['name']?.toString() ?? user.displayName ?? '';

      final result = await FirebaseFirestore.instance
          .collection('homes')
          .where('inviteCode', isEqualTo: code)
          .limit(1)
          .get();

      if (result.docs.isEmpty) {
        throw Exception('كود الدعوة غير صحيح أو البيت غير موجود.');
      }

      final homeDoc = result.docs.first;
      final homeData = homeDoc.data();
      final members = List<String>.from(homeData['members'] ?? const []);

      if (members.contains(user.uid)) {
        throw Exception('هذا الحساب مرتبط بهذا البيت بالفعل.');
      }

      // الحد الأقصى للبيت: 12 حسابًا
      // زوج + زوجة + حتى 10 أبناء.
      if (members.length >= 12) {
        throw Exception(
          'هذا البيت مكتمل. الحد الأقصى هو 12 حسابًا: زوج وزوجة و10 أبناء.',
        );
      }

      final accountType = userData['accountType']?.toString() ?? 'ابن';

      int husbandCount = 0;
      int wifeCount = 0;
      int childrenCount = 0;

      for (final memberUid in members) {
        final memberQuery = await FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: memberUid)
            .limit(1)
            .get();

        if (memberQuery.docs.isEmpty) continue;

        final memberType =
            memberQuery.docs.first.data()['accountType']?.toString();

        if (memberType == 'زوج') {
          husbandCount++;
        } else if (memberType == 'زوجة') {
          wifeCount++;
        } else if (memberType == 'ابن') {
          childrenCount++;
        }
      }

      if (accountType == 'زوج' && husbandCount >= 1) {
        throw Exception('يوجد زوج مرتبط بهذا البيت بالفعل.');
      }

      if (accountType == 'زوجة' && wifeCount >= 1) {
        throw Exception('توجد زوجة مرتبطة بهذا البيت بالفعل.');
      }

      if (accountType == 'ابن' && childrenCount >= 10) {
        throw Exception('تم الوصول إلى الحد الأقصى للأبناء (10 أبناء).');
      }

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.update(
          userDoc.reference,
          {'homeId': homeDoc.id},
        );

        transaction.update(
          homeDoc.reference,
          {
            'members': FieldValue.arrayUnion([user.uid]),
            'joinedByName': name,
            'joinedByAccountType': accountType,
            'joinedAt': FieldValue.serverTimestamp(),
          },
        );
      });

      if (!mounted) return;
      setState(() {
        loading = false;
        userName = name;
        homeId = homeDoc.id;
        inviteCode = code;
      });

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('تم الانضمام 🎉', textAlign: TextAlign.right),
          content: const Text(
            'تم ربط حسابك بالبيت بنجاح.\n\nالآن أصبح البيت مشتركًا بينكما.',
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ممتاز'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      showMessage('خطأ', 'تعذر الانضمام إلى البيت.\n\n$e');
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      (route) => false,
    );
  }

  void showMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title, textAlign: TextAlign.right),
        content: Text(message, textAlign: TextAlign.right),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }

  Widget greenButton({
    required String text,
    required IconData icon,
    required VoidCallback? onTap,
  }) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Material(
        color: const Color(0xFF214C45),
        borderRadius: BorderRadius.circular(20),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasHome = homeId != null && homeId!.isNotEmpty;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F1E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8ECE4),
          elevation: 0,
          title: const Text(
            'byit',
            style: TextStyle(
              color: Color(0xFF214C45),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              tooltip: 'تسجيل الخروج',
              onPressed: logout,
              icon: const Icon(Icons.logout, color: Color(0xFF214C45)),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                'أهلاً ${userName?.isNotEmpty == true ? userName : 'بك'} 👋',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF214C45),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'تنظيم اليوم .. لراحة الغد',
                style: TextStyle(fontSize: 17, color: Color(0xFF64716C)),
              ),
              const SizedBox(height: 35),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 12,
                      offset: Offset(0, 5),
                      color: Color(0x22000000),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      hasHome ? Icons.home_rounded : Icons.home_work_rounded,
                      size: 75,
                      color: const Color(0xFF214C45),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      hasHome ? 'بيتكم جاهز 🎉' : 'لم يتم إنشاء بيت بعد',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF214C45),
                      ),
                    ),
                    if (hasHome && inviteCode != null) ...[
                      const SizedBox(height: 15),
                      const Text(
                        'كود دعوة الزوج/الزوجة',
                        style: TextStyle(color: Color(0xFF64716C)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        inviteCode!,
                        style: const TextStyle(
                          fontSize: 32,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF214C45),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 25),
              if (!hasHome) ...[
                greenButton(
                  text: loading ? 'جاري إنشاء البيت...' : 'إنشاء بيت',
                  icon: Icons.add_home_rounded,
                  onTap: loading ? null : createHome,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 58,
                  child: OutlinedButton.icon(
                    onPressed: loading ? null : joinHome,
                    icon: const Icon(Icons.group_add_rounded),
                    label: const Text('الانضمام إلى بيت'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF214C45),
                      side: const BorderSide(
                        color: Color(0xFF214C45),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ] else ...[
                greenButton(
                  text: 'دخول إلى البيت',
                  icon: Icons.home_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ShoppingListScreen(
                          homeId: homeId!,
                          currentUserName: userName ?? '',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(
                          userName: userName ?? '',
                          onSaved: loadUserData,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.person_rounded),
                  label: const Text('الملف الشخصي'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF214C45),
                    side: const BorderSide(
                      color: Color(0xFF214C45),
                      width: 1.5,
                    ),
                    minimumSize: const Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeSettingsScreen(
                          homeId: homeId!,
                          inviteCode: inviteCode ?? '',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings_rounded),
                  label: const Text('إعدادات البيت'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF214C45),
                    side: const BorderSide(
                      color: Color(0xFFD0D7D1),
                      width: 1.5,
                    ),
                    minimumSize: const Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 58,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FamilyMembersScreen(
                            homeId: homeId!,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.groups_rounded),
                    label: const Text('أفراد البيت'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF214C45),
                      side: const BorderSide(
                        color: Color(0xFF214C45),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}




class ProfileScreen extends StatefulWidget {
  final String userName;
  final Future<void> Function() onSaved;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.onSaved,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController nameController;
  bool saving = false;
  String phone = '';
  String accountType = 'غير محدد';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userName);
    loadProfile();
  }

  Future<void> loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final email = user.email ?? '';
    if (email.endsWith('@byit.app')) {
      phone = email.substring(0, email.length - '@byit.app'.length);
    }

    final snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(phone)
        .get();

    if (!mounted) return;
    if (snap.exists) {
      setState(() {
        accountType =
            snap.data()?['accountType']?.toString() ?? 'غير محدد';
        if (nameController.text.trim().isEmpty) {
          nameController.text =
              snap.data()?['name']?.toString() ?? '';
        }
      });
    }
  }

  Future<void> saveProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    final name = nameController.text.trim();

    if (user == null) return;
    if (name.isEmpty) {
      showMessage('تنبيه', 'اكتب الاسم أولاً.');
      return;
    }

    setState(() => saving = true);

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(phone)
          .update({
        'name': name,
        'accountType': accountType,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      await user.updateDisplayName(name);
      await widget.onSaved();

      if (!mounted) return;
      setState(() => saving = false);
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      setState(() => saving = false);
      showMessage('خطأ', 'تعذر حفظ الاسم.\n\n$e');
    }
  }

  void showMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F1E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8ECE4),
          elevation: 0,
          title: const Text(
            'الملف الشخصي',
            style: TextStyle(
              color: Color(0xFF214C45),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF214C45),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(22),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.account_circle_rounded,
                size: 90,
                color: Color(0xFF214C45),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'الاسم',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'رقم الجوال',
                prefixIcon: Icon(Icons.phone_rounded),
              ),
              child: Text(
                phone.isEmpty ? 'غير متوفر' : '+$phone',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              value: ['زوج', 'زوجة', 'ابن'].contains(accountType)
                  ? accountType
                  : null,
              decoration: const InputDecoration(
                labelText: 'نوع الحساب',
                prefixIcon: Icon(Icons.family_restroom_rounded),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'زوج',
                  child: Text('زوج'),
                ),
                DropdownMenuItem(
                  value: 'زوجة',
                  child: Text('زوجة'),
                ),
                DropdownMenuItem(
                  value: 'ابن',
                  child: Text('ابن'),
                ),
              ],
              onChanged: saving
                  ? null
                  : (value) {
                      if (value != null) {
                        setState(() {
                          accountType = value;
                        });
                      }
                    },
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 58,
              child: ElevatedButton.icon(
                onPressed: saving ? null : saveProfile,
                icon: saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.save_rounded),
                label: Text(saving ? 'جاري الحفظ...' : 'حفظ التعديلات'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF214C45),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSettingsScreen extends StatefulWidget {
  final String homeId;
  final String inviteCode;

  const HomeSettingsScreen({
    super.key,
    required this.homeId,
    required this.inviteCode,
  });

  @override
  State<HomeSettingsScreen> createState() => _HomeSettingsScreenState();
}

class _HomeSettingsScreenState extends State<HomeSettingsScreen> {
  late final TextEditingController homeNameController;
  bool loading = true;
  bool saving = false;
  int memberCount = 0;
  String currentHomeName = '';

  @override
  void initState() {
    super.initState();
    homeNameController = TextEditingController();
    loadHome();
  }

  Future<void> loadHome() async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection('homes')
          .doc(widget.homeId)
          .get();

      if (!mounted) return;

      final data = snap.data() ?? {};
      setState(() {
        currentHomeName = data['name']?.toString() ?? '';
        homeNameController.text = currentHomeName;
        memberCount =
            List<String>.from(data['members'] ?? const []).length;
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      showMessage('خطأ', 'تعذر تحميل إعدادات البيت.\n\n$e');
    }
  }

  Future<void> saveHomeName() async {
    final name = homeNameController.text.trim();

    setState(() => saving = true);

    try {
      await FirebaseFirestore.instance
          .collection('homes')
          .doc(widget.homeId)
          .update({
        'name': name.isEmpty ? null : name,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;
      setState(() {
        currentHomeName = name;
        saving = false;
      });

      showMessage('تم الحفظ', 'تم تحديث اسم البيت.');
    } catch (e) {
      if (!mounted) return;
      setState(() => saving = false);
      showMessage('خطأ', 'تعذر حفظ اسم البيت.\n\n$e');
    }
  }

  Future<void> leaveCurrentHome() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      showMessage('تنبيه', 'يجب تسجيل الدخول أولاً.');
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('مغادرة البيت'),
          content: const Text(
            'هل أنت متأكد أنك تريد مغادرة هذا البيت؟\n\n'
            'سيتم فصل حسابك عن البيت، ويمكنك الانضمام إلى بيت آخر لاحقاً.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('مغادرة البيت'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;

    setState(() => saving = true);

    try {
      final email = user.email ?? '';
      String phone = '';
      if (email.endsWith('@byit.app')) {
        phone = email.substring(0, email.length - '@byit.app'.length);
      }

      if (phone.isEmpty) {
        throw Exception('تعذر تحديد حساب المستخدم.');
      }

      final userRef = FirebaseFirestore.instance
          .collection('users')
          .doc(phone);
      final userSnap = await userRef.get();

      if (!userSnap.exists) {
        throw Exception('لم يتم العثور على بيانات الحساب.');
      }

      final data = userSnap.data() ?? {};
      final savedHomeId = data['homeId']?.toString() ?? '';

      if (savedHomeId.isEmpty || savedHomeId == 'null') {
        throw Exception('أنت غير مرتبط ببيت حالياً.');
      }

      final homeRef = FirebaseFirestore.instance
          .collection('homes')
          .doc(savedHomeId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.update(homeRef, {
          'members': FieldValue.arrayRemove([user.uid]),
        });

        transaction.update(userRef, {
          'homeId': null,
          'leftHomeAt': FieldValue.serverTimestamp(),
        });
      });

      if (!mounted) return;
      setState(() => saving = false);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => saving = false);
      showMessage('خطأ', 'تعذر مغادرة البيت.\n\n$e');
    }
  }

  void showMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    homeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F1E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8ECE4),
          elevation: 0,
          title: const Text(
            'إعدادات البيت',
            style: TextStyle(
              color: Color(0xFF214C45),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF214C45),
          ),
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF214C45),
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(22),
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.home_rounded,
                          size: 70,
                          color: Color(0xFF214C45),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$memberCount أفراد مرتبطون بالبيت',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF214C45),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: homeNameController,
                    decoration: const InputDecoration(
                      labelText: 'اسم البيت (اختياري)',
                      hintText: 'مثلاً: بيت عائلة محمود',
                      prefixIcon: Icon(Icons.home_work_rounded),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8ECE4),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'كود دعوة البيت',
                          style: TextStyle(
                            color: Color(0xFF64716C),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.inviteCode.isEmpty
                              ? 'غير متوفر'
                              : widget.inviteCode,
                          style: const TextStyle(
                            fontSize: 30,
                            letterSpacing: 5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF214C45),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'استخدم الكود لإضافة فرد جديد للبيت.',
                          style: TextStyle(
                            color: Color(0xFF64716C),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: saving ? null : saveHomeName,
                      icon: const Icon(Icons.save_rounded),
                      label: Text(
                        saving ? 'جاري الحفظ...' : 'حفظ إعدادات البيت',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF214C45),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 56,
                    child: OutlinedButton.icon(
                      onPressed: leaveCurrentHome,
                      icon: const Icon(Icons.exit_to_app_rounded),
                      label: const Text('مغادرة البيت'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(
                          color: Colors.red,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  final String homeId;

  const NotificationsScreen({
    super.key,
    required this.homeId,
  });

  CollectionReference<Map<String, dynamic>> get notificationsRef =>
      FirebaseFirestore.instance
          .collection('homes')
          .doc(homeId)
          .collection('notifications');

  Future<void> markAllAsRead(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
  ) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final unread = docs.where((doc) {
      final readBy =
          List<String>.from(doc.data()['readBy'] ?? const []);
      return !readBy.contains(uid);
    }).toList();

    if (unread.isEmpty) return;

    final batch = FirebaseFirestore.instance.batch();
    for (final doc in unread) {
      batch.update(
        doc.reference,
        {'readBy': FieldValue.arrayUnion([uid])},
      );
    }
    await batch.commit();
  }

  String timeText(Timestamp? timestamp) {
    if (timestamp == null) return 'الآن';

    final difference = DateTime.now().difference(timestamp.toDate());

    if (difference.inMinutes < 1) return 'الآن';
    if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    }
    if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    }
    return 'منذ ${difference.inDays} يوم';
  }

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F1E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8ECE4),
          elevation: 0,
          title: const Text(
            'الإشعارات',
            style: TextStyle(
              color: Color(0xFF214C45),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF214C45),
          ),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: notificationsRef
              .where('recipientUids', arrayContains: uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'تعذر تحميل الإشعارات.\\n\\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF214C45),
                ),
              );
            }

            final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                [...(snapshot.data?.docs ?? <QueryDocumentSnapshot<Map<String, dynamic>>>[])];
            docs.sort((a, b) {
              final aTime = a.data()['createdAt'];
              final bTime = b.data()['createdAt'];

              if (aTime is! Timestamp && bTime is! Timestamp) return 0;
              if (aTime is! Timestamp) return 1;
              if (bTime is! Timestamp) return -1;
              return bTime.compareTo(aTime);
            });

            final unreadCount = docs.where((doc) {
              final readBy =
                  List<String>.from(doc.data()['readBy'] ?? const []);
              return !readBy.contains(uid);
            }).length;

            return Column(
              children: [
                if (unreadCount > 0)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 2),
                      child: TextButton.icon(
                        onPressed: () => markAllAsRead(docs),
                        icon: const Icon(Icons.done_all_rounded),
                        label: const Text('تحديد الكل كمقروء'),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF214C45),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: docs.isEmpty
                      ? const Center(
                          child: Text(
                            'لا توجد إشعارات',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF214C45),
                            ),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(14),
                          itemCount: docs.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final data = docs[index].data();
                            final readBy = List<String>.from(
                              data['readBy'] ?? const [],
                            );
                            final unread = !readBy.contains(uid);

                            return InkWell(
                              borderRadius: BorderRadius.circular(18),
                              onTap: () async {
                                if (unread) {
                                  await docs[index].reference.update({
                                    'readBy': FieldValue.arrayUnion([uid]),
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: unread
                                      ? Colors.white
                                      : const Color(0xFFF1F2ED),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: unread
                                        ? const Color(0xFFB9CBC5)
                                        : const Color(0xFFE0E3DC),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      unread
                                          ? Icons.notifications_active_rounded
                                          : Icons.notifications_none_rounded,
                                      color: const Color(0xFF214C45),
                                      size: 28,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['title']?.toString() ??
                                                'إشعار',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: unread
                                                  ? FontWeight.bold
                                                  : FontWeight.w600,
                                              color:
                                                  const Color(0xFF214C45),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            data['body']?.toString() ?? '',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF4D5A55),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            timeText(
                                              data['createdAt'] is Timestamp
                                                  ? data['createdAt']
                                                      as Timestamp
                                                  : null,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Color(0xFF64716C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FamilyMembersScreen extends StatefulWidget {
  final String homeId;

  const FamilyMembersScreen({
    super.key,
    required this.homeId,
  });

  @override
  State<FamilyMembersScreen> createState() => _FamilyMembersScreenState();
}

class _FamilyMembersScreenState extends State<FamilyMembersScreen> {
  bool loading = true;
  bool isHusband = false;
  String currentUid = '';
  List<Map<String, dynamic>> members = [];

  @override
  void initState() {
    super.initState();
    loadMembers();
  }

  Future<void> loadMembers() async {
    if (mounted) {
      setState(() => loading = true);
    }

    try {
      final firestore = FirebaseFirestore.instance;
      final authUser = FirebaseAuth.instance.currentUser;

      if (authUser == null) {
        throw Exception('لم يتم العثور على الحساب الحالي.');
      }

      currentUid = authUser.uid;

      // معرفة نوع الحساب الحالي.
      final currentUserQuery = await firestore
          .collection('users')
          .where('uid', isEqualTo: currentUid)
          .limit(1)
          .get();

      if (currentUserQuery.docs.isNotEmpty) {
        final currentData = currentUserQuery.docs.first.data();
        isHusband = currentData['accountType']?.toString() == 'زوج';
      } else {
        isHusband = false;
      }

      final homeSnap = await firestore
          .collection('homes')
          .doc(widget.homeId)
          .get();

      if (!homeSnap.exists) {
        throw Exception('لم يتم العثور على البيت.');
      }

      final homeData = homeSnap.data() ?? {};
      final memberUids = List<String>.from(homeData['members'] ?? const []);

      final result = <Map<String, dynamic>>[];

      for (final uid in memberUids) {
        final query = await firestore
            .collection('users')
            .where('uid', isEqualTo: uid)
            .limit(1)
            .get();

        if (query.docs.isEmpty) continue;

        final user = query.docs.first.data();

        result.add({
          'docId': query.docs.first.id,
          'uid': uid,
          'name': user['name']?.toString() ?? 'بدون اسم',
          'accountType': user['accountType']?.toString() ?? 'غير محدد',
          'phone': user['phone']?.toString() ?? '',
        });
      }

      if (!mounted) return;
      setState(() {
        members = result;
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      _showMessage('خطأ', 'تعذر تحميل أفراد البيت.\n\n$e');
    }
  }

  IconData roleIcon(String type) {
    if (type == 'زوج') return Icons.man_rounded;
    if (type == 'زوجة') return Icons.woman_rounded;
    return Icons.child_care_rounded;
  }

  Future<void> editMember(Map<String, dynamic> member) async {
    if (!isHusband) {
      _showMessage('غير مسموح', 'فقط الزوج يستطيع تعديل بيانات أفراد البيت.');
      return;
    }

    if (member['uid'] == currentUid) {
      _showMessage('تنبيه', 'لتعديل بياناتك استخدم صفحة الملف الشخصي.');
      return;
    }

    final nameController = TextEditingController(
      text: member['name']?.toString() ?? '',
    );
    String selectedType = member['accountType']?.toString() ?? 'ابن';
    bool saving = false;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: const Text('تعديل بيانات الفرد'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'الاسم',
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: ['زوج', 'زوجة', 'ابن'].contains(selectedType)
                            ? selectedType
                            : 'ابن',
                        decoration: const InputDecoration(
                          labelText: 'نوع الحساب',
                          prefixIcon: Icon(Icons.family_restroom_rounded),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'زوج',
                            child: Text('زوج'),
                          ),
                          DropdownMenuItem(
                            value: 'زوجة',
                            child: Text('زوجة'),
                          ),
                          DropdownMenuItem(
                            value: 'ابن',
                            child: Text('ابن'),
                          ),
                        ],
                        onChanged: saving
                            ? null
                            : (value) {
                                if (value != null) {
                                  setDialogState(() {
                                    selectedType = value;
                                  });
                                }
                              },
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: saving
                        ? null
                        : () => Navigator.pop(dialogContext),
                    child: const Text('إلغاء'),
                  ),
                  ElevatedButton(
                    onPressed: saving
                        ? null
                        : () async {
                            final name = nameController.text.trim();

                            if (name.isEmpty) {
                              ScaffoldMessenger.of(dialogContext).showSnackBar(
                                const SnackBar(
                                  content: Text('اكتب الاسم أولاً.'),
                                ),
                              );
                              return;
                            }

                            setDialogState(() => saving = true);

                            try {
                              final firestore = FirebaseFirestore.instance;

                              // فحص عدد الأدوار قبل التعديل.
                              int husbandCount = 0;
                              int wifeCount = 0;
                              int childrenCount = 0;

                              for (final item in members) {
                                if (item['uid'] == member['uid']) continue;

                                final type =
                                    item['accountType']?.toString() ?? '';

                                if (type == 'زوج') {
                                  husbandCount++;
                                } else if (type == 'زوجة') {
                                  wifeCount++;
                                } else if (type == 'ابن') {
                                  childrenCount++;
                                }
                              }

                              if (selectedType == 'زوج' && husbandCount >= 1) {
                                throw Exception('لا يمكن أن يكون في البيت أكثر من زوج واحد.');
                              }

                              if (selectedType == 'زوجة' && wifeCount >= 1) {
                                throw Exception('لا يمكن أن يكون في البيت أكثر من زوجة واحدة.');
                              }

                              if (selectedType == 'ابن' && childrenCount >= 10) {
                                throw Exception('الحد الأقصى للأبناء هو 10.');
                              }

                              final docId = member['docId']?.toString() ?? '';
                              if (docId.isEmpty) {
                                throw Exception('تعذر تحديد حساب الفرد.');
                              }

                              await firestore
                                  .collection('users')
                                  .doc(docId)
                                  .update({
                                'name': name,
                                'accountType': selectedType,
                                'updatedAt': FieldValue.serverTimestamp(),
                                'updatedByUid': currentUid,
                                'updatedByName': members.firstWhere(
                                  (item) => item['uid'] == currentUid,
                                  orElse: () => {'name': 'الزوج'},
                                )['name'],
                              });

                              if (!mounted) return;
                              Navigator.pop(dialogContext);
                              await loadMembers();
                              _showMessage('تم الحفظ', 'تم تعديل بيانات الفرد بنجاح.');
                            } catch (e) {
                              setDialogState(() => saving = false);
                              ScaffoldMessenger.of(dialogContext).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.toString().replaceFirst('Exception: ', ''),
                                  ),
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF214C45),
                      foregroundColor: Colors.white,
                    ),
                    child: saving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('حفظ'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    nameController.dispose();
  }

  Future<void> deleteMember(Map<String, dynamic> member) async {
    if (!isHusband) {
      _showMessage('غير مسموح', 'فقط الزوج يستطيع حذف أفراد البيت.');
      return;
    }

    if (member['uid'] == currentUid) {
      _showMessage('تنبيه', 'لا يمكنك حذف حسابك من البيت.');
      return;
    }

    final name = member['name']?.toString() ?? 'هذا الفرد';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('حذف الفرد'),
          content: Text('هل أنت متأكد من حذف $name من البيت؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('حذف'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;

    try {
      final firestore = FirebaseFirestore.instance;
      final uid = member['uid']?.toString() ?? '';

      if (uid.isEmpty) {
        throw Exception('تعذر تحديد الفرد.');
      }

      await firestore.collection('homes').doc(widget.homeId).update({
        'members': FieldValue.arrayRemove([uid]),
      });

      final userDocId = member['docId']?.toString() ?? '';
      if (userDocId.isNotEmpty) {
        await firestore.collection('users').doc(userDocId).update({
          'homeId': null,
        });
      }

      await loadMembers();
      if (!mounted) return;
      _showMessage('تم الحذف', 'تم حذف الفرد من البيت بنجاح.');
    } catch (e) {
      if (!mounted) return;
      _showMessage('خطأ', 'تعذر حذف الفرد.\n\n$e');
    }
  }

  void _showMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('حسنًا'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F1E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8ECE4),
          elevation: 0,
          title: const Text(
            'أفراد البيت',
            style: TextStyle(
              color: Color(0xFF214C45),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF214C45),
          ),
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF214C45),
                ),
              )
            : RefreshIndicator(
                color: const Color(0xFF214C45),
                onRefresh: loadMembers,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            color: Color(0x18000000),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.groups_rounded,
                            size: 58,
                            color: Color(0xFF214C45),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'أفراد البيت (${members.length})',
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF214C45),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            isHusband
                                ? 'يمكنك تعديل أو حذف أفراد البيت'
                                : 'يمكنك عرض أفراد البيت فقط',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF64716C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (members.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Text('لا يوجد أفراد مرتبطون بهذا البيت.'),
                        ),
                      )
                    else
                      ...members.map(
                        (member) {
                          final isMe = member['uid'] == currentUid;
                          final canManage = isHusband && !isMe;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFFE2E6E0),
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: const Color(0xFFE8ECE4),
                                  child: Icon(
                                    roleIcon(
                                      member['accountType']?.toString() ?? '',
                                    ),
                                    color: const Color(0xFF214C45),
                                    size: 27,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              member['name']?.toString() ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF214C45),
                                              ),
                                            ),
                                          ),
                                          if (isMe) ...[
                                            const SizedBox(width: 6),
                                            const Text(
                                              '(أنت)',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF64716C),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        member['accountType']?.toString() ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF64716C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (canManage)
                                  PopupMenuButton<String>(
                                    icon: const Icon(
                                      Icons.more_vert_rounded,
                                      color: Color(0xFF214C45),
                                    ),
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                        editMember(member);
                                      } else if (value == 'delete') {
                                        deleteMember(member);
                                      }
                                    },
                                    itemBuilder: (context) => const [
                                      PopupMenuItem<String>(
                                        value: 'edit',
                                        child: Row(
                                          children: [
                                            Icon(Icons.edit_rounded),
                                            SizedBox(width: 10),
                                            Text('تعديل البيانات'),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete_outline_rounded),
                                            SizedBox(width: 10),
                                            Text('إخراج من البيت'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _CompactValue extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _CompactValue({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF64716C),
          ),
        ),
        const SizedBox(height: 1),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: bold ? FontWeight.bold : FontWeight.w500,
            color: bold
                ? const Color(0xFF214C45)
                : const Color(0xFF394640),
          ),
        ),
      ],
    );
  }
}

class ShoppingListScreen extends StatefulWidget {
  final String homeId;
  final String currentUserName;

  const ShoppingListScreen({
    super.key,
    required this.homeId,
    required this.currentUserName,
  });

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final itemController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final totalController = TextEditingController();
  final notesController = TextEditingController();
  bool adding = false;
  String selectedList = 'مشتريات البيت';
  late final Stream<QuerySnapshot<Map<String, dynamic>>> itemsStream;

  @override
  void initState() {
    super.initState();
    itemsStream = itemsRef.orderBy('createdAt', descending: true).snapshots();
  }

  void updateTotal() {
    final quantity = double.tryParse(
      quantityController.text.trim().replaceAll(',', '.'),
    );
    final price = double.tryParse(
      priceController.text.trim().replaceAll(',', '.'),
    );

    if (quantity != null && quantity > 0 && price != null && price >= 0) {
      final total = quantity * price;
      totalController.text = total.toStringAsFixed(2).replaceFirst(RegExp(r'\.00$'), '');
    } else {
      totalController.clear();
    }
  }

  CollectionReference<Map<String, dynamic>> get itemsRef =>
      FirebaseFirestore.instance
          .collection('homes')
          .doc(widget.homeId)
          .collection('shoppingItems');

  Future<void> createHomeNotification({
    required String title,
    required String body,
  }) async {
    final currentUid = FirebaseAuth.instance.currentUser?.uid;
    if (currentUid == null) return;

    final homeSnap = await FirebaseFirestore.instance
        .collection('homes')
        .doc(widget.homeId)
        .get();

    if (!homeSnap.exists) return;

    final members =
        List<String>.from(homeSnap.data()?['members'] ?? const []);
    final recipients =
        members.where((uid) => uid != currentUid).toList();

    if (recipients.isEmpty) return;

    await FirebaseFirestore.instance
        .collection('homes')
        .doc(widget.homeId)
        .collection('notifications')
        .add({
      'title': title,
      'body': body,
      'createdByUid': currentUid,
      'createdByName': widget.currentUserName,
      'recipientUids': recipients,
      'readBy': <String>[],
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> openNotifications() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NotificationsScreen(homeId: widget.homeId),
      ),
    );
  }

  Future<void> addItem() async {
    final name = itemController.text.trim();
    final quantityText = quantityController.text.trim();
    final priceText = priceController.text.trim();
    final notes = notesController.text.trim();

    if (name.isEmpty || adding) return;

    final quantity = double.tryParse(quantityText.replaceAll(',', '.'));
    if (quantity == null || quantity <= 0) {
      showMessage('تنبيه', 'يرجى إدخال كمية صحيحة.');
      return;
    }

    double? price;
    if (priceText.isNotEmpty) {
      price = double.tryParse(priceText.replaceAll(',', '.'));
      if (price == null || price < 0) {
        showMessage('تنبيه', 'يرجى إدخال سعر صحيح.');
        return;
      }
    }

    final double? total = price == null ? null : quantity * price;

    setState(() => adding = true);
    try {
      await itemsRef.add({
        'name': name,
        'quantity': quantity,
        'price': price,
        'total': total,
        'notes': notes.isEmpty ? null : notes,
        'listName': selectedList,
        'status': 'needed',
        'addedByName': widget.currentUserName,
        'addedByUid': FirebaseAuth.instance.currentUser?.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });

      await createHomeNotification(
        title: 'غرض جديد',
        body: '${widget.currentUserName} أضاف «$name» إلى $selectedList',
      );

      itemController.clear();
      quantityController.clear();
      priceController.clear();
      totalController.clear();
      notesController.clear();
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      setState(() => adding = false);
      showMessage('خطأ', 'تعذر إضافة الغرض.\n\n$e');
    }
  }

  InputDecoration fieldDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
    );
  }

  Future<void> showAddItemDialog() async {
    itemController.clear();
    quantityController.clear();
    priceController.clear();
    totalController.clear();
    notesController.clear();
    quantityController.removeListener(updateTotal);
    priceController.removeListener(updateTotal);
    quantityController.addListener(updateTotal);
    priceController.addListener(updateTotal);
    setState(() => adding = false);

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('إضافة غرض'),
            content: SizedBox(
              width: 420,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: itemController,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: fieldDecoration('اسم الغرض', 'مثال: حليب'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: quantityController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textInputAction: TextInputAction.next,
                      decoration: fieldDecoration('الكمية *', 'مثال: 2'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: priceController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textInputAction: TextInputAction.next,
                      decoration: fieldDecoration(
                        'السعر',
                        'اختياري - مثال: 5.50',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: totalController,
                      readOnly: true,
                      decoration: fieldDecoration(
                        'المجموع',
                        'يُحسب تلقائياً من الكمية × السعر',
                      ).copyWith(
                        filled: true,
                        fillColor: const Color(0xFFE8ECE4),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: notesController,
                      maxLines: 3,
                      textInputAction: TextInputAction.done,
                      decoration: fieldDecoration(
                        'الملاحظات',
                        'اختياري',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: adding ? null : addItem,
                child: Text(adding ? 'جاري الإضافة...' : 'إضافة'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> editItem(BuildContext context, String docId, Map<String, dynamic> data) async {
    final nameController = TextEditingController(text: data['name']?.toString() ?? '');
    final quantityController = TextEditingController(text: formatNumber(data['quantity']));
    final priceController = TextEditingController(text: data['price'] == null ? '' : formatNumber(data['price']));
    final notesController = TextEditingController(text: data['notes']?.toString() ?? '');
    String? error;

    await showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          final qty = double.tryParse(quantityController.text.trim().replaceAll(',', '.'));
          final pText = priceController.text.trim();
          final price = pText.isEmpty ? null : double.tryParse(pText.replaceAll(',', '.'));
          final total = qty != null && qty > 0 && price != null && price >= 0 ? qty * price : null;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('تعديل الغرض', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF214C45))),
              content: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextField(controller: nameController, decoration: const InputDecoration(labelText: 'الغرض', prefixIcon: Icon(Icons.shopping_cart_outlined))),
                  const SizedBox(height: 12),
                  TextField(controller: quantityController, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => setDialogState(() {}), decoration: const InputDecoration(labelText: 'الكمية', prefixIcon: Icon(Icons.numbers_rounded))),
                  const SizedBox(height: 12),
                  TextField(controller: priceController, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => setDialogState(() {}), decoration: const InputDecoration(labelText: 'السعر (اختياري)', prefixIcon: Icon(Icons.payments_outlined))),
                  const SizedBox(height: 12),
                  InputDecorator(
                    decoration: const InputDecoration(labelText: 'المجموع', prefixIcon: Icon(Icons.calculate_outlined)),
                    child: Text(total == null ? 'غير محدد' : formatNumber(total), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF214C45))),
                  ),
                  const SizedBox(height: 12),
                  TextField(controller: notesController, maxLines: 3, decoration: const InputDecoration(labelText: 'ملاحظات (اختياري)', prefixIcon: Icon(Icons.notes_rounded))),
                  if (error != null) ...[
                    const SizedBox(height: 10),
                    Text(error!, style: const TextStyle(color: Colors.red)),
                  ],
                ]),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('إلغاء')),
                ElevatedButton.icon(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final q = double.tryParse(quantityController.text.trim().replaceAll(',', '.'));
                    final pt = priceController.text.trim();
                    final pr = pt.isEmpty ? null : double.tryParse(pt.replaceAll(',', '.'));
                    if (name.isEmpty) { setDialogState(() => error = 'اكتب اسم الغرض'); return; }
                    if (q == null || q <= 0) { setDialogState(() => error = 'الكمية يجب أن تكون أكبر من صفر'); return; }
                    if (pt.isNotEmpty && (pr == null || pr < 0)) { setDialogState(() => error = 'السعر غير صحيح'); return; }
                    try {
                      await itemsRef.doc(docId).update({
                        'name': name,
                        'quantity': q,
                        'price': pr,
                        'total': pr == null ? null : q * pr,
                        'notes': notesController.text.trim().isEmpty ? null : notesController.text.trim(),
                        'updatedAt': FieldValue.serverTimestamp(),
                        'updatedByName': widget.currentUserName,
                        'updatedByUid': FirebaseAuth.instance.currentUser?.uid,
                      });
                      await createHomeNotification(
                        title: 'تعديل غرض',
                        body:
                            '${widget.currentUserName} عدّل «$name» في القائمة',
                      );
                      if (dialogContext.mounted) Navigator.pop(dialogContext);
                      if (mounted) showMessage('تم التعديل', 'تم تعديل الغرض بنجاح');
                    } catch (e) {
                      setDialogState(() => error = 'تعذر حفظ التعديل: $e');
                    }
                  },
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('حفظ التعديل'),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF214C45), foregroundColor: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
    nameController.dispose(); quantityController.dispose(); priceController.dispose(); notesController.dispose();
  }

  void showItemDetails(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    final name = data['name']?.toString() ?? '';
    final notes = data['notes']?.toString() ?? '';
    final addedBy = data['addedByName']?.toString() ?? 'غير معروف';
    final status = data['status']?.toString() ?? 'needed';

    String statusText;
    if (status == 'purchased') {
      statusText = 'تم شراؤه';
    } else if (status == 'canceled') {
      statusText = 'ملغي';
    } else {
      statusText = 'مطلوب';
    }

    showDialog(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF214C45),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailRow('الحالة', statusText),
              _detailRow(
                'الكمية',
                formatNumber(data['quantity']),
              ),
              _detailRow(
                'السعر',
                data['price'] == null
                    ? 'غير محدد'
                    : formatNumber(data['price']),
              ),
              _detailRow(
                'المجموع',
                data['total'] == null
                    ? 'غير محدد'
                    : formatNumber(data['total']),
              ),
              _detailRow('أضافه', addedBy),
              const SizedBox(height: 12),
              const Text(
                'الملاحظات',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF214C45),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                notes.isEmpty ? 'لا توجد ملاحظات' : notes,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إغلاق'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF64716C),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF214C45),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> changeStatus(String itemId, String status) async {
    try {
      final itemSnap = await itemsRef.doc(itemId).get();
      final itemName = itemSnap.data()?['name']?.toString() ?? 'الغرض';

      await itemsRef.doc(itemId).update({'status': status});

      final statusText = status == 'purchased'
          ? 'تم شراؤه'
          : status == 'canceled'
              ? 'ملغي'
              : 'مطلوب';

      await createHomeNotification(
        title: 'تحديث حالة غرض',
        body:
            '${widget.currentUserName} غيّر حالة «$itemName» إلى $statusText',
      );
    } catch (e) {
      if (!mounted) return;
      showMessage('خطأ', 'تعذر تغيير حالة الغرض.\n\n$e');
    }
  }

  Future<void> deleteItem(String itemId) async {
    try {
      await itemsRef.doc(itemId).delete();
    } catch (e) {
      if (!mounted) return;
      showMessage('خطأ', 'تعذر حذف الغرض.\n\n$e');
    }
  }

  void showMessage(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('حسنًا'),
            ),
          ],
        ),
      ),
    );
  }

  String formatNumber(dynamic value) {
    if (value == null) return '';
    final number = value is num
        ? value.toDouble()
        : double.tryParse(value.toString());
    if (number == null) return value.toString();
    if (number == number.roundToDouble()) return number.toInt().toString();
    return number.toStringAsFixed(2).replaceFirst(RegExp(r'0+$'), '');
  }

  @override
  void dispose() {
    quantityController.removeListener(updateTotal);
    priceController.removeListener(updateTotal);
    itemController.dispose();
    quantityController.dispose();
    priceController.dispose();
    totalController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F1E8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE8ECE4),
          elevation: 0,
          title: const Text(
            'قائمة المشتريات',
            style: TextStyle(
              color: Color(0xFF214C45),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('homes')
                  .doc(widget.homeId)
                  .collection('notifications')
                  .where(
                    'recipientUids',
                    arrayContains:
                        FirebaseAuth.instance.currentUser?.uid ?? '',
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                final uid = FirebaseAuth.instance.currentUser?.uid;
                final docs = snapshot.data?.docs ?? [];
                final unread = docs.where((doc) {
                  final readBy =
                      List<String>.from(doc.data()['readBy'] ?? const []);
                  return uid != null && !readBy.contains(uid);
                }).length;

                return Stack(
                  children: [
                    IconButton(
                      tooltip: 'الإشعارات',
                      onPressed: openNotifications,
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: Color(0xFF214C45),
                        size: 28,
                      ),
                    ),
                    if (unread > 0)
                      Positioned(
                        right: 7,
                        top: 7,
                        child: Container(
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.shade600,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFE8ECE4),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            unread > 99 ? '99+' : '$unread',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(width: 6),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF214C45),
          foregroundColor: Colors.white,
          onPressed: showAddItemDialog,
          icon: const Icon(Icons.add_shopping_cart_rounded),
          label: const Text(
            'إضافة غرض',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _listChip('مشتريات البيت', Icons.shopping_cart_rounded),
                  const SizedBox(width: 8),
                  _listChip('صيانة', Icons.build_rounded),
                  const SizedBox(width: 8),
                  _listChip('أشياء للأطفال', Icons.child_care_rounded),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: itemsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'حدث خطأ في تحميل القائمة.\n\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final allDocs = snapshot.data?.docs ?? [];
            final docs = allDocs.where((doc) {
              final listName = doc.data()['listName']?.toString();
              return listName == null || listName.isEmpty
                  ? selectedList == 'مشتريات البيت'
                  : listName == selectedList;
            }).toList();

            if (docs.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 85,
                        color: Color(0xFF64716C),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'قائمة المشتريات فارغة',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF214C45),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'أضف أول غرض للبيت من الزر بالأسفل.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF64716C),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            double grandTotal = 0;
            int pricedItems = 0;

            for (final document in docs) {
              final item = document.data();
              final itemStatus = item['status']?.toString() ?? 'needed';
              final itemTotal = item['total'];

              if (itemStatus == 'purchased' && itemTotal is num) {
                grandTotal += itemTotal.toDouble();
                pricedItems++;
              }
            }

            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 100),
              itemCount: docs.length + 1,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF214C45),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          color: Color(0x18000000),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.14),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.payments_rounded,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'إجمالي المشتريات',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${formatNumber(grandTotal)} شيكل',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '$pricedItems مسعّر',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final doc = docs[index - 1];
                final data = doc.data();
                final name = data['name']?.toString() ?? '';
                final status = data['status']?.toString() ?? 'needed';
                final quantity = data['quantity'];
                final price = data['price'];
                final total = data['total'];
                final purchased = status == 'purchased';
                final canceled = status == 'canceled';

                return Dismissible(
                  key: ValueKey(doc.id),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) async {
                    await deleteItem(doc.id);
                    return true;
                  },
                  background: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 18),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () => showItemDetails(context, data),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 78),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFE2E6E0),
                        ),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              tooltip: purchased
                                  ? 'إرجاع إلى مطلوب'
                                  : canceled
                                      ? 'تم الإلغاء'
                                      : 'تم شراؤه',
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 38,
                                minHeight: 40,
                              ),
                              onPressed: () => changeStatus(
                                doc.id,
                                purchased ? 'needed' : 'purchased',
                              ),
                              icon: Icon(
                                purchased
                                    ? Icons.check_circle_rounded
                                    : canceled
                                        ? Icons.cancel_rounded
                                        : Icons.radio_button_unchecked_rounded,
                                color: purchased
                                    ? Colors.green
                                    : canceled
                                        ? Colors.red
                                        : const Color(0xFF214C45),
                                size: 27,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                purchased || canceled
                                                    ? TextDecoration.lineThrough
                                                    : null,
                                            color: canceled
                                                ? Colors.grey
                                                : const Color(0xFF214C45),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: purchased
                                              ? Colors.green.shade50
                                              : canceled
                                                  ? Colors.red.shade50
                                                  : const Color(0xFFE8ECE4),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          purchased
                                              ? 'تم الشراء'
                                              : canceled
                                                  ? 'ملغي'
                                                  : 'مطلوب',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: purchased
                                                ? Colors.green.shade700
                                                : canceled
                                                    ? Colors.red.shade700
                                                    : const Color(0xFF214C45),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      if ((data['addedByName']
                                                  ?.toString()
                                                  .trim()
                                                  .isNotEmpty ??
                                              false)) ...[
                                        const Icon(
                                          Icons.person_outline_rounded,
                                          size: 14,
                                          color: Color(0xFF64716C),
                                        ),
                                        const SizedBox(width: 3),
                                        Flexible(
                                          child: Text(
                                            data['addedByName']
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF64716C),
                                            ),
                                          ),
                                        ),
                                      ],
                                      if ((data['notes']
                                                  ?.toString()
                                                  .trim()
                                                  .isNotEmpty ??
                                              false)) ...[
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.notes_rounded,
                                          size: 14,
                                          color: Color(0xFF64716C),
                                        ),
                                        const SizedBox(width: 3),
                                        Flexible(
                                          child: Text(
                                            data['notes'].toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF64716C),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            _CompactValue(
                              label: 'الكمية',
                              value: formatNumber(quantity),
                            ),
                            const SizedBox(width: 7),
                            _CompactValue(
                              label: 'السعر',
                              value: price == null ? '—' : formatNumber(price),
                            ),
                            const SizedBox(width: 7),
                            _CompactValue(
                              label: 'المجموع',
                              value: total == null ? '—' : formatNumber(total),
                              bold: true,
                            ),
                            PopupMenuButton<String>(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 38,
                                minHeight: 40,
                              ),
                              onSelected: (value) {
                                if (value == 'edit') {
                                  editItem(context, doc.id, data);
                                } else {
                                  changeStatus(doc.id, value);
                                }
                              },
                              itemBuilder: (_) => const [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit_rounded, size: 20),
                                      SizedBox(width: 8),
                                      Text('تعديل الغرض'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'needed',
                                  child: Text('مطلوب'),
                                ),
                                PopupMenuItem(
                                  value: 'purchased',
                                  child: Text('تم شراؤه'),
                                ),
                                PopupMenuItem(
                                  value: 'canceled',
                                  child: Text('ملغي'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                );
              },
            );
          },
        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listChip(String name, IconData icon) {
    final selected = selectedList == name;

    return ChoiceChip(
      selected: selected,
      onSelected: (_) {
        setState(() {
          selectedList = name;
        });
      },
      avatar: Icon(
        icon,
        size: 19,
        color: selected
            ? Colors.white
            : const Color(0xFF214C45),
      ),
      label: Text(name),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: selected
            ? Colors.white
            : const Color(0xFF214C45),
      ),
      selectedColor: const Color(0xFF214C45),
      backgroundColor: Colors.white,
      side: const BorderSide(
        color: Color(0xFFD8DED7),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }
}

