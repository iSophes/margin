import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email address copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 150,
              maxWidth: 700,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Margin's Privacy Policy",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Effective Date: 16th February 2026',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Introduction',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Welcome to Margin. Margin is an app which allows users to review and share their favourite books with others. Your privacy is of highest importance to us. This privacy policy will contain what data we collect about our users and how we store it securely.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Data We Collect',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Margin collects a range of data to provide it's core functions. We collect the following data about you: \n"
                  "- Email Address: Collected for account creation and communication purposes\n"
                  "- Name: Collected to personalise your experience and identify you to other users in our account."
                  "- Password Hash: For account data storage"
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5,),
                const Text(
                  "We do not host or collect data from users under the age of 13 on this platform. If Margin becomes aware of a user under the age of 13 "
                  "then Margin will delete all data about that user. Email contact@isophes.com for concerns about possible underaged users.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Legal Basis for Processing',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Our processing of your personal data is based on:\n'
                  '• Your Consent: By creating an account or installing the app, you consent to the collection and use of your data as outlined in this policy. You can opt out of analytics tracking at any time in settings.\n'
                  '• Legitimate Interests: We have a legitimate interest in processing your data to operate and maintain the app effectively.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Rights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'You have the right to access, correct, or delete your data at any time. Please contact us at ',
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                  child: const Text(
                    'contact@isophes.com',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  onTap: () {
                    _copyToClipboard(context, 'contact@isophes.com');
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Data Retention',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'We retain your personal data for as long as your account remains active or as necessary to provide our services. If you choose to deactivate your account, we will delete your data in accordance with applicable legal requirements.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Changes to This Policy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'We may revise this Privacy Policy from time to time. Any significant changes will be communicated to you through the app or via the email address associated with your account. Your continued use of the app following these changes indicates your acceptance of the updated policy.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'If you have any questions, concerns, or requests related to this Privacy Policy or your personal data, please contact us at ',
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                  child: const Text(
                    'contact@isophes.com',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  onTap: () {
                    _copyToClipboard(context, 'contact@isophes.com');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}