import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (ctx) => Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(ctx);
                                },
                                child: const Icon(
                                    Icons.keyboard_arrow_left_rounded,
                                    color: Colors.white,
                                    size: 30),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Edit Profile',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          Text('Save'.toUpperCase()),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('Saptarshi Bhattacharjee'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Height'),
                  Text(
                    '5ft 7in',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Weight'),
                  Text(
                    '72kg',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Age'),
                  Text(
                    '33yrs',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Sex'),
                  Text(
                    'Male',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Membership Type'),
                  Text(
                    'Monthly',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
