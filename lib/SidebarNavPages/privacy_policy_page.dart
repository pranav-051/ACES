import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class SideNavPage6 extends StatelessWidget {
  const SideNavPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Privacy Policy',
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Effective Date: 01/02/2025', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Text('Introduction', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'At ACES (Association of Computer Engineering Students) App, we are committed to protecting and respecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our app. By accessing or using the ACES App, you agree to the terms of this Privacy Policy.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('1. Information We Collect', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'We may collect the following types of information when you use the ACES App:\n\n'
                  '- Personal Information: When registering, logging in, or using certain features (e.g., profile page, registration form), we may collect your name, email address, phone number, and other details you provide.\n\n'
                  '- OTP Data: For account verification purposes, we generate and verify one-time passwords (OTP).\n\n'
                  '- Usage Data: We collect information about how you use the app, including actions taken, preferences, and navigation patterns.\n\n'
                  '- Device Information: We may collect details about the device you use to access the app, such as device type, operating system, and IP address.\n\n'
                  '- Event Data: We collect data related to event registrations, event type, and attendance, including data related to leaderboards and event participation.\n\n'
                  '- Chatbot Interactions: If you interact with the chatbot, the data from your conversation may be stored to improve functionality and user experience.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('2. How We Use Your Information', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'We use the collected information for the following purposes:\n\n'
                  '- To provide and maintain the app’s features, including login, registration, profile management, event registration, notifications, and chat functionalities.\n\n'
                  '- To send notifications about app updates, events, or other relevant information (via push notifications or in-app messages).\n\n'
                  '- To personalize your experience on the app (e.g., home page, event recommendations, profile).\n\n'
                  '- To improve the functionality, performance, and user experience of the app.\n\n'
                  '- To process your event registration and provide necessary details about upcoming events.\n\n'
                  '- To respond to inquiries and support requests through the help center or chatbot.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('3. How We Share Your Information', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'We do not sell, trade, or rent your personal information to third parties. However, we may share information in the following cases:\n\n'
                  '- Service Providers: We may share your information with third-party service providers who assist with the operation of the app (e.g., push notification services, OTP services).\n\n'
                  '- Legal Requirements: If required by law or to protect the rights and safety of ACES App and its users, we may disclose your information to law enforcement or other authorities.\n\n'
                  '- Event Data: Information related to event registrations, including your participation and attendance, may be shared with event organizers or other users as necessary.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('4. Data Security', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'We implement appropriate technical and organizational measures to protect your personal data from unauthorized access, disclosure, alteration, or destruction. However, please be aware that no security measure is completely foolproof, and we cannot guarantee the absolute security of your data.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('5. Your Rights and Choices', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'You have the right to:\n\n'
                  '- Access and Update: You can access and update your personal information through the profile page.\n\n'
                  '- Delete: You can delete your account and associated data by contacting us or through the app settings.\n\n'
                  '- Opt-Out: You can opt-out of push notifications by adjusting your notification settings within the app.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('6. Third-Party Links', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'The ACES App may contain links to third-party websites or services that are not controlled by us. We are not responsible for the privacy practices of these third parties and encourage you to review their privacy policies before interacting with them.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('7. Children’s Privacy', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'The ACES App is not intended for users under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have inadvertently collected such information, we will take steps to delete it.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('8. Changes to This Privacy Policy', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'We may update this Privacy Policy from time to time. Any changes will be reflected in the updated Privacy Policy, which will be posted in the app and on this page. We encourage you to review this Privacy Policy periodically to stay informed about how we are protecting your information.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('9. Contact Us', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'If you have any questions or concerns about this Privacy Policy or the data we collect, please contact us through the help center or at acescomppvg@gmail.com.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'By using the ACES App, you acknowledge that you have read, understood, and agree to this Privacy Policy.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
