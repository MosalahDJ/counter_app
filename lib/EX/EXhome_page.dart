import 'package:counter_app/EX/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EXHomePage extends StatelessWidget {
  const EXHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // print("===================page refreshed=====================");
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Professional Counter',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter Display Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Current Count',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${context.watch<CounterBloc>().state.counter}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      context.watch<CounterBloc>().state.counter == 0
                          ? 'Reset'
                          : context.watch<CounterBloc>().state.counter > 0
                          ? 'Positive'
                          : 'Negative',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Decrement Button
                _buildControlButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(DecrementEvent()),
                  icon: Icons.remove,
                  color: Colors.red,
                  heroTag: "decrement",
                ),

                // Reset Button
                _buildControlButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(ResetEvent()),
                  icon: Icons.refresh,
                  color: Colors.grey,
                  heroTag: "reset",
                  isSecondary: true,
                ),

                // Increment Button
                _buildControlButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementEvent()),
                  icon: Icons.add,
                  color: Colors.green,
                  heroTag: "increment",
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Statistics Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    'Absolute',
                    '${context.watch<CounterBloc>().state.counter.abs()}',
                    Icons.straighten,
                  ),
                  Container(height: 40, width: 1, color: Colors.grey[300]),
                  _buildStatItem(
                    'Sign',
                    context.watch<CounterBloc>().state.counter >= 0 ? '+' : '-',
                    Icons.swap_horiz,
                  ),
                  Container(height: 40, width: 1, color: Colors.grey[300]),
                  _buildStatItem(
                    'Even/Odd',
                    context.watch<CounterBloc>().state.counter % 2 == 0
                        ? 'Even'
                        : 'Odd',
                    Icons.calculate,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color color,
    required String heroTag,
    bool isSecondary = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isSecondary
                ? Colors.black.withValues(alpha: 0.1)
                : color.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        heroTag: heroTag,
        backgroundColor: isSecondary ? Colors.white : color,
        foregroundColor: isSecondary ? color : Colors.white,
        elevation: 0,
        child: Icon(icon, size: 28),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
