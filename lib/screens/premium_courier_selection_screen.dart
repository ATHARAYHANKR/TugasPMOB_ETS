import 'package:flutter/material.dart';
import '../widgets/courier_card.dart';

/// Premium Modern Courier Selection Screen
/// Demonstrates the reusable CourierCard widget with neumorphic design
class PremiumCourierSelectionScreen extends StatefulWidget {
  const PremiumCourierSelectionScreen({Key? key}) : super(key: key);

  @override
  State<PremiumCourierSelectionScreen> createState() =>
      _PremiumCourierSelectionScreenState();
}

class _PremiumCourierSelectionScreenState
    extends State<PremiumCourierSelectionScreen> {
  String selectedCourier = '';

  // All couriers with their icons and badges
  final List<Map<String, dynamic>> couriers = [
    {
      'name': 'J&T',
      'code': 'jnt',
      'icon': Icons.local_shipping_outlined,
      'badge': 0,
    },
    {
      'name': 'JNE',
      'code': 'jne',
      'icon': Icons.delivery_dining_outlined,
      'badge': 0,
    },
    {
      'name': 'SiCepat',
      'code': 'sicepat',
      'icon': Icons.speed,
      'badge': 3,
    },
    {
      'name': 'Pos ID',
      'code': 'pos',
      'icon': Icons.mail_outline,
      'badge': 0,
    },
    {
      'name': 'TIKI',
      'code': 'tiki',
      'icon': Icons.local_shipping_outlined,
      'badge': 2,
    },
    {
      'name': 'Ninja',
      'code': 'ninja',
      'icon': Icons.rocket_launch_outlined,
      'badge': 5,
    },
    {
      'name': 'Lion',
      'code': 'lion',
      'icon': Icons.local_shipping_outlined,
      'badge': 0,
    },
    {
      'name': 'Anteraja',
      'code': 'anteraja',
      'icon': Icons.directions_car_outlined,
      'badge': 1,
    },
  ];

  void _handleCourierSelection(String code) {
    setState(() {
      selectedCourier = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Pilih Kurir',
          style: TextStyle(
            color: Color(0xFF5C3317),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF5C3317)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Layanan Kurir Terpercaya',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF5C3317),
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pilih kurir pengiriman yang sesuai dengan kebutuhan Anda',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF888888),
                      letterSpacing: 0.2,
                    ),
              ),
              const SizedBox(height: 24),

              // Premium GridView - 4 columns, 2 rows
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemCount: couriers.length,
                itemBuilder: (context, index) {
                  final courier = couriers[index];
                  final isSelected = selectedCourier == courier['code'];

                  return CourierCard(
                    name: courier['name'],
                    icon: courier['icon'],
                    badge: courier['badge'],
                    isSelected: isSelected,
                    onTap: () => _handleCourierSelection(courier['code']),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Selected Info Card
              if (selectedCourier.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5E6D8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE8D5C4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_circle,
                          color: Color(0xFF5C3317),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kurir Dipilih',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF888888),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              couriers
                                  .firstWhere((c) => c['code'] == selectedCourier)['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF5C3317),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: selectedCourier.isNotEmpty
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Melanjutkan dengan kurir: $selectedCourier',
                                ),
                                backgroundColor: const Color(0xFF5C3317),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        : null,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: selectedCourier.isNotEmpty
                            ? LinearGradient(
                                colors: [
                                  const Color(0xFF5C3317),
                                  const Color(0xFFA0673A),
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  const Color(0xFF5C3317).withOpacity(0.5),
                                  const Color(0xFFA0673A).withOpacity(0.5),
                                ],
                              ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: selectedCourier.isNotEmpty
                            ? [
                                BoxShadow(
                                  color:
                                      const Color(0xFF5C3317).withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),
                      child: const Center(
                        child: Text(
                          'Lanjutkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
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
