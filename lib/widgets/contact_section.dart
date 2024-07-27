import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../constants/screen_size.dart';
import '../constants/sns_links.dart';
import '../services/email_service.dart';
import '../utils/app_input.dart';
import '../utils/custom_text_field.dart';

import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isLoading = false;
  final GlobalKey<FormState> _formKeyDesktop = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyMobile = GlobalKey<FormState>();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: AppColors.scaffoldBg,
      child: Column(
        children: [
          const Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= minDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              hintText: "Your message",
              controller: messageController,
              maxLines: 16,
              errorText: _validate ? 'Please enter your message' : null,
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _validate = messageController.text.isEmpty;
                  });

                  if (!_formKeyDesktop.currentState!.validate() ||
                      !_formKeyMobile.currentState!.validate() ||
                      _validate) {
                    return;
                  }

                  setState(() {
                    isLoading = true; // Show loading indicator
                  });

                  try {
                    await SendEmailService.sendMail(
                      name: nameController.text,
                      email: emailController.text,
                      subject: subjectController.text,
                      message: messageController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email sent successfully')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to send email')),
                    );
                  } finally {
                    setState(() {
                      isLoading = false; // Hide loading indicator
                    });
                  }
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(AppColors.yellowPrimary)
                ),
                child: isLoading
                    ? const CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.yellowPrimary,
                )
                    : const Text(
                  "Get in touch",
                  style: TextStyle(color: AppColors.whitePrimary),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.phone_outlined, color: Colors.white, size: 30),
              SizedBox(width: 10),
              Text(
                '+254734641871',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.whitePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.tiktok]);
                },
                child: Image.asset(
                  tiktok,
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.instagram]);
                },
                child: Image.asset(
                  instagram,
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.facebook]);
                },
                child: Image.asset(
                  X,
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNameEmailFieldDesktop() {
    return Form(
      key: _formKeyDesktop,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: AppInput(
                  label: "Your name",
                  type: TextInputType.text,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: AppInput(
                  label: "Your email",
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          AppInput(
            label: "Subject",
            type: TextInputType.text,
            controller: subjectController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the subject';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget buildNameEmailFieldMobile() {
    return Form(
      key: _formKeyMobile,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppInput(
            label: "Your name",
            type: TextInputType.text,
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          AppInput(
            label: "Subject",
            type: TextInputType.text,
            controller: subjectController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the subject';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          AppInput(
            label: "Your email",
            type: TextInputType.emailAddress,
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
