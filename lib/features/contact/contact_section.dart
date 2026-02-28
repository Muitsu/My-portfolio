import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/gradient_button.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';

// ============ Contact Section ============
class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Get In Touch',
      onVisibilityChanged: (_) {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s build something amazing together.',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'I\'m currently available for freelance projects and full-time opportunities. '
                  'If you have a project in mind or just want to chat, feel free to reach out.',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 40),
                _buildContactInfo(),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: _buildContactForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return const Column(
      children: [
        _ContactInfoRow(
          icon: Icons.email_outlined,
          label: 'Email',
          value: 'hello@johndoe.dev',
        ),
        SizedBox(height: 20),
        _ContactInfoRow(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: 'San Francisco, CA',
        ),
        SizedBox(height: 20),
        _ContactInfoRow(
          icon: Icons.work_outline,
          label: 'Status',
          value: 'Available for work',
          valueColor: Color(0xFF00FF88),
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildInputField('Name', _nameController),
          const SizedBox(height: 20),
          _buildInputField('Email', _emailController),
          const SizedBox(height: 20),
          _buildInputField('Message', _messageController, maxLines: 4),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: GradientButton(
              text: 'Send Message',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Message sent successfully!'),
                      backgroundColor: Color(0xFF00FF88),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: const Color(0xFF111111),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF333333)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF00D9FF)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _ContactInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF111111),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF222222)),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF00D9FF),
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                color: valueColor ?? Colors.grey[300],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
