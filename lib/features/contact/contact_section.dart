import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/gradient_button.dart';
import 'package:my_portfolio/core/widgets/section_wrapper.dart';
import 'package:my_portfolio/providers/portfolio_provider.dart';
import 'package:provider/provider.dart';

part 'widget/contact_info_row.dart';

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
    final provider = context.read<PortfolioProvider>();
    return Column(
      children: [
        _ContactInfoRow(
          icon: Icons.email_outlined,
          label: 'Email',
          value: provider.email,
        ),
        const SizedBox(height: 20),
        _ContactInfoRow(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: provider.location,
        ),
        const SizedBox(height: 20),
        _ContactInfoRow(
          icon: Icons.work_outline,
          label: 'Status',
          value: provider.status,
          valueColor: const Color(0xFF00FF88),
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
