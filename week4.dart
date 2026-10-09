import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterLabApp());
}

class FlutterLabApp extends StatelessWidget {
  const FlutterLabApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4: Flutter Mobile Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _tasks = const [
    Task1SelectionControls(),
    Task2InputFields(),
    Task3ButtonsCounter(),
    Task4IndicatorsFeedback(),
    Task5DialogsModals(),
    Task6SlidersPickers(),
    Task7ScrollableCollections(),
    Task8GridDisplays(),
    Task9NavigationControls(),
    Task10StructuralContainers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task ${_currentIndex + 1} of 10'),
        centerTitle: true,
      ),
      body: _tasks[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'T1'),
          BottomNavigationBarItem(icon: Icon(Icons.input), label: 'T2'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'T3'),
          BottomNavigationBarItem(icon: Icon(Icons.hourglass_top), label: 'T4'),
          BottomNavigationBarItem(icon: Icon(Icons.picture_in_picture), label: 'T5'),
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'T6'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'T7'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'T8'),
          BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'T9'),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: 'T10'),
        ],
      ),
    );
  }
}

// ==========================================
// TASK 1: Selection Controls (Checkbox & Switch)
// ==========================================
class Task1SelectionControls extends StatefulWidget {
  const Task1SelectionControls({Key? key}) : super(key: key);

  @override
  State<Task1SelectionControls> createState() => _Task1SelectionControlsState();
}

class _Task1SelectionControlsState extends State<Task1SelectionControls> {
  bool isDarkMode = false;
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Exercise 1.1: SwitchListTile & CheckboxListTile
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (value) => setState(() => isDarkMode = value),
          ),
          CheckboxListTile(
            title: const Text('Agree to Terms'),
            value: agreedToTerms,
            onChanged: (value) => setState(() => agreedToTerms = value ?? false),
          ),
          const SizedBox(height: 20),
          // Exercise 1.2: ElevatedButton enabled/disabled conditionally
          ElevatedButton(
            onPressed: agreedToTerms ? () {} : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TASK 2: Input Fields (TextField & TextFormField)
// ==========================================
class Task2InputFields extends StatefulWidget {
  const Task2InputFields({Key? key}) : super(key: key);

  @override
  State<Task2InputFields> createState() => _Task2InputFieldsState();
}

class _Task2InputFieldsState extends State<Task2InputFields> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Exercise 2.2: Email validation with @ symbol check
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Please enter a valid email containing @';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Exercise 2.1: Password obscure toggle
            TextFormField(
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form Submitted Successfully!')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TASK 3: Buttons & Action Items
// ==========================================
class Task3ButtonsCounter extends StatefulWidget {
  const Task3ButtonsCounter({Key? key}) : super(key: key);

  @override
  State<Task3ButtonsCounter> createState() => _Task3ButtonsCounterState();
}

class _Task3ButtonsCounterState extends State<Task3ButtonsCounter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value: $_counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            // Exercise 3.2: Reset counter with OutlinedButton
            OutlinedButton(
              onPressed: () => setState(() => _counter = 0),
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
      // Exercise 3.1: FloatingActionButton to increment counter
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ==========================================
// TASK 4: Indicators & Feedback
// ==========================================
class Task4IndicatorsFeedback extends StatefulWidget {
  const Task4IndicatorsFeedback({Key? key}) : super(key: key);

  @override
  State<Task4IndicatorsFeedback> createState() => _Task4IndicatorsFeedbackState();
}

class _Task4IndicatorsFeedbackState extends State<Task4IndicatorsFeedback> {
  bool _isLoading = false;

  void _startAsyncOperation() async {
    setState(() => _isLoading = true);

    // Exercise 4.1: Wait 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    setState(() => _isLoading = false);

    // Exercise 4.2: SnackBar notification with "Undo" action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Operation Completed!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: _startAsyncOperation,
              child: const Text('Start Operation (3s)'),
            ),
    );
  }
}

// ==========================================
// TASK 5: Dialogs & Modals
// ==========================================
class Task5DialogsModals extends StatelessWidget {
  const Task5DialogsModals({Key? key}) : super(key: key);

  // Exercise 5.1: AlertDialog for confirmation
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // Exercise 5.2: showModalBottomSheet with share options
  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share Link'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Send via Email'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => _showDeleteDialog(context),
            child: const Text('Show Delete Dialog'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showShareBottomSheet(context),
            child: const Text('Show Share Bottom Sheet'),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TASK 6: Sliders & Pickers
// ==========================================
class Task6SlidersPickers extends StatefulWidget {
  const Task6SlidersPickers({Key? key}) : super(key: key);

  @override
  State<Task6SlidersPickers> createState() => _Task6SlidersPickersState();
}

class _Task6SlidersPickersState extends State<Task6SlidersPickers> {
  double _volume = 50;
  DateTime? _selectedDate;

  // Exercise 6.2: Open native date picker
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Exercise 6.1: Slider for volume control
          Text('Volume: ${_volume.round()}%', style: const TextStyle(fontSize: 20)),
          Slider(
            value: _volume,
            min: 0,
            max: 100,
            onChanged: (val) => setState(() => _volume = val),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _pickDate,
            child: const Text('Pick Date'),
          ),
          const SizedBox(height: 10),
          Text(
            _selectedDate == null
                ? 'No date selected'
                : 'Selected Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TASK 7: Scrollable Collections
// ==========================================
class Task7ScrollableCollections extends StatefulWidget {
  const Task7ScrollableCollections({Key? key}) : super(key: key);

  @override
  State<Task7ScrollableCollections> createState() => _Task7ScrollableCollectionsState();
}

class _Task7ScrollableCollectionsState extends State<Task7ScrollableCollections> {
  // Exercise 7.1: Dynamic list of 20 items
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        // Exercise 7.2: Swipe-to-dismiss functionality
        return Dismissible(
          key: Key(item),
          background: Container(color: Colors.red, child: const Icon(Icons.delete, color: Colors.white)),
          onDismissed: (direction) {
            setState(() => items.removeAt(index));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$item dismissed')),
            );
          },
          child: ListTile(
            leading: const Icon(Icons.label),
            title: Text(item),
            subtitle: Text('Subtitle for $item'),
          ),
        );
      },
    );
  }
}

// ==========================================
// TASK 8: Grid Displays
// ==========================================
class Task8GridDisplays extends StatelessWidget {
  const Task8GridDisplays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Exercise 8.1: 2-column image gallery grid with spacing
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: List.generate(6, (index) {
        final imageUrl = 'https://picsum.photos/300/300?random=$index';
        // Exercise 8.2: InkWell / GestureDetector full-screen preview
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Scaffold(
                  appBar: AppBar(title: Text('Image ${index + 1}')),
                  body: Center(child: Image.network(imageUrl)),
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}

// ==========================================
// TASK 9: Navigation Controls
// ==========================================
class Task9NavigationControls extends StatelessWidget {
  const Task9NavigationControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exercise 9.2: Top TabBar & TabBarView inside DefaultTabController
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Controls'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Tab View', style: TextStyle(fontSize: 20))),
            Center(child: Text('Favorites Tab View', style: TextStyle(fontSize: 20))),
            Center(child: Text('Profile Tab View', style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TASK 10: Structural Containers
// ==========================================
class Task10StructuralContainers extends StatelessWidget {
  const Task10StructuralContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Exercise 10.1: Card with header, subtitle, leading icon, and trailing action
        Card(
          elevation: 4,
          child: ListTile(
            leading: const Icon(Icons.info, color: Colors.indigo),
            title: const Text('Information Card Header'),
            subtitle: const Text('This is a detailed subtitle inside a Card container.'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Frequently Asked Questions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Exercise 10.2: FAQ screen using multiple ExpansionTile widgets
        const ExpansionTile(
          title: Text('What is Flutter?'),
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
              ),
            ),
          ],
        ),
        const ExpansionTile(
          title: Text('How do I run this lab exercise?'),
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Copy this entire file into your lib/main.dart file and run `flutter run` in your terminal or via your IDE.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}