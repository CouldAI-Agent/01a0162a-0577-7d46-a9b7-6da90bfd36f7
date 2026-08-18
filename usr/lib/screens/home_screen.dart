import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Breakpoints for responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth > 800;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            floating: false,
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              title: const Text(
                'O\'qishni ko\'chirish shartlari\n(Nodavlat OTMdan Davlat OTMga)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.3,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.account_balance,
                    size: 80,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? (screenWidth - 800) / 2 : 16.0,
              vertical: 24.0,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildIntroCard(context),
                const SizedBox(height: 24),
                const Text(
                  'Asosiy talablar va qoidalar',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildRuleCard(
                  context,
                  icon: Icons.calendar_month,
                  title: 'Arizalar qabul qilish vaqti',
                  description:
                      'O\'qishni ko\'chirish bo\'yicha arizalar har yili odatda 15-iyuldan 5-avgustga qadar onlayn tarzda (my.uzbmb.uz yoki my.gov.uz orqali) qabul qilinadi.',
                ),
                _buildRuleCard(
                  context,
                  icon: Icons.assignment,
                  title: 'Majburiy test sinovlari',
                  description:
                      'Xususiy (nodavlat) yoki xorijiy OTMlardan davlat OTMlariga o\'qishni ko\'chirish uchun talabalar Bilimni baholash agentligi (sobiq DTM) tomonidan o\'tkaziladigan maxsus test sinovlarida ishtirok etishlari shart.',
                ),
                _buildRuleCard(
                  context,
                  icon: Icons.score,
                  title: 'O\'tish bali',
                  description:
                      'Davlat granti yoki bazaviy to\'lov-kontrakt asosida o\'qishni ko\'chirish uchun talaba o\'zi tanlagan ta\'lim yo\'nalishi bo\'yicha belgilangan o\'tish balini to\'plashi kerak. O'tish bali har yili yo'nalishlar kesimida o'zgaradi.',
                ),
                _buildRuleCard(
                  context,
                  icon: Icons.merge_type,
                  title: 'Yo\'nalishlar mosligi',
                  description:
                      'O\'qishni faqatgina mos yoki turdosh ta\'lim yo\'nalishlariga ko\'chirishga ruxsat etiladi. Agar yo\'nalishlar mos bo\'lmasa, o\'qishni ko\'chirish rad etilishi mumkin.',
                ),
                _buildRuleCard(
                  context,
                  icon: Icons.monetization_on,
                  title: 'Tabaqalashtirilgan (Super) kontrakt',
                  description:
                      'Agar talaba test sinovlarida yetarli ball to\'play olmasa (lekin minimal o'tish balidan yuqori bo'lsa), o\'qishni tabaqalashtirilgan to\'lov-kontrakt (super-kontrakt) asosida ko\'chirish imkoniyati mavjud.',
                ),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.primary,
            size: 32,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'O\'zbekiston Respublikasida nodavlat (xususiy) va xorijiy oliy ta\'lim muassasalaridan davlat OTMlariga o\'qishni ko\'chirish maxsus tartib va imtihonlar asosida amalga oshiriladi. Quyida eng muhim shartlar bilan tanishishingiz mumkin.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 28,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
