import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clika/constants/app_images.dart';
import 'package:clika/providers/locale_provider.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Arabic', 'Urdu'];

  @override
  Widget build(BuildContext context) {
    // 👇 Get current locale from provider
    final currentLocale = ref.watch(localeProvider);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black,

      // 👇 Remove left padding if Arabic is selected
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Image.asset(AppImages.logo),
      ),
      leadingWidth: 120,
      actionsPadding: const EdgeInsets.only(right: 10),
      actions: [
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedLanguage,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
            dropdownColor: Colors.white,
            items: _languages.map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue == null) return;

              setState(() {
                _selectedLanguage = newValue;
              });

              // 🔁 Update app locale using Riverpod provider
              final locale = switch (newValue) {
                'Arabic' => const Locale('ar'),
                'Urdu' => const Locale('ur'),
                _ => const Locale('en'),
              };

              ref.read(localeProvider.notifier).state = locale;
            },
          ),
        ),
      ],
    );
  }
}
