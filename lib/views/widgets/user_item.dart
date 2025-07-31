import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import 'package:flutter/services.dart';

class UserItem extends StatelessWidget {
  final UserModel user;

  const UserItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          _showUserDetails(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.avatarUrl),
                backgroundColor: Colors.grey[300],
                onBackgroundImageError: (exception, stackTrace) {
                  // Handle image loading error
                },
                child: user.avatarUrl.isEmpty
                    ? Text(
                        user.login.isNotEmpty ? user.login[0].toUpperCase() : '?',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.login,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    if (user.name != null && user.name!.isNotEmpty) ...[
                      Text(
                        user.name!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    Row(
                      children: [
                        Icon(
                          Icons.badge,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'ID: ${user.id}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          user.type == 'User' ? Icons.person : Icons.business,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          user.type,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showUserDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => UserDetailsSheet(user: user),
    );
  }
}

class UserDetailsSheet extends StatelessWidget {
  final UserModel user;

  const UserDetailsSheet({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.avatarUrl),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            user.login,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (user.name != null && user.name!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              user.name!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
          const SizedBox(height: 24),
          _DetailRow(
            icon: Icons.badge,
            label: 'User ID',
            value: user.id.toString(),
          ),
          _DetailRow(
            icon: user.type == 'User' ? Icons.person : Icons.business,
            label: 'Type',
            value: user.type,
          ),
          _DetailRow(
            icon: user.siteAdmin ? Icons.admin_panel_settings : Icons.person,
            label: 'Site Admin',
            value: user.siteAdmin ? 'Yes' : 'No',
          ),
          if (user.bio != null && user.bio!.isNotEmpty)
            _DetailRow(
              icon: Icons.info,
              label: 'Bio',
              value: user.bio!,
            ),
          if (user.publicRepos != null)
            _DetailRow(
              icon: Icons.folder,
              label: 'Public Repos',
              value: user.publicRepos.toString(),
            ),
          if (user.followers != null)
            _DetailRow(
              icon: Icons.people,
              label: 'Followers',
              value: user.followers.toString(),
            ),
          if (user.following != null)
            _DetailRow(
              icon: Icons.person_add,
              label: 'Following',
              value: user.following.toString(),
            ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: user.htmlUrl));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile URL copied to clipboard'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy Profile URL'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 16),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}