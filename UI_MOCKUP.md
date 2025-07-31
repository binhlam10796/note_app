## To-Do App UI Mockup

Based on the implementation, here's what the user interface would look like:

### Bottom Navigation (Updated)
```
┌─────────────────────────────────────────────────────────┐
│  [📝 Notes]  [✓ To-Do]  [🎓 Learning]  [👥 Users]       │
└─────────────────────────────────────────────────────────┘
```

### To-Do List Screen (Empty State)
```
┌─────────────────────────────────────────────────────────┐
│  To-Do List                                      [🔍]   │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                     [✓] (64px)                         │
│                                                         │
│                   No tasks yet!                        │
│                                                         │
│              Add your first task to get started        │
│                                                         │
│                                                         │
│                                                         │
│                                                [+]      │
└─────────────────────────────────────────────────────────┘
```

### To-Do List Screen (With Tasks)
```
┌─────────────────────────────────────────────────────────┐
│  To-Do List                                      [🔍]   │
├─────────────────────────────────────────────────────────┤
│                                                         │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ ☐  Learn Flutter                    [Red Background] │ │
│ │    Complete the tutorial                            │ │
│ │    12/15/2024 10:30 AM                             │ │
│ └─────────────────────────────────────────────────────┘ │
│                                                         │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ ✓  Buy groceries              [Green Background]    │ │
│ │    ~~Milk, eggs, bread~~                           │ │
│ │    12/14/2024 2:15 PM                              │ │
│ └─────────────────────────────────────────────────────┘ │
│                                                         │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ ☐  Exercise                   [Blue Background]     │ │
│ │    Go for a 30-minute run                          │ │
│ │    12/13/2024 6:00 AM                              │ │
│ └─────────────────────────────────────────────────────┘ │
│                                                         │
│                                                [+]      │
└─────────────────────────────────────────────────────────┘
```

### Add Todo Bottom Sheet
```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ Task title                                          │ │
│ └─────────────────────────────────────────────────────┘ │
│                                                         │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ Description (optional)                              │ │
│ │                                                     │ │
│ │                                                     │ │
│ └─────────────────────────────────────────────────────┘ │
│                                                         │
│ Color Selection:                                        │
│ ●  ●  ●  ●  ●  ●  ●  ●  ●  ●                         │
│ (Red selected with white border)                       │
│                                                         │
│ ┌─────────────────────────────────────────────────────┐ │
│ │                      Add                            │ │
│ └─────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
```

### Swipe to Delete Gesture
```
┌─────────────────────────────────────────────────────────┐
│ ┌─────────────────────────────────────────┐ [🗑️ Delete] │
│ │ ☐  Learn Flutter        ←────────────── │   [Red]     │
│ │    Complete the tutorial               │             │ │
│ │    12/15/2024 10:30 AM                 │             │ │
│ └─────────────────────────────────────────┘             │
└─────────────────────────────────────────────────────────┘
```

### Key UI Features:

1. **Consistent Design**: Matches the existing notes app theme
2. **Color Coding**: Tasks have customizable background colors
3. **Completion Visual**: Checkboxes and strikethrough for completed tasks
4. **Empty State**: Helpful messaging when no tasks exist
5. **Swipe Actions**: Intuitive swipe-to-delete functionality
6. **Form Validation**: Required fields with visual feedback
7. **Loading States**: Progress indicators during operations
8. **Responsive Layout**: Works on various screen sizes

The implementation follows Material Design principles and maintains consistency with the existing notes app while providing a distinct todo management experience.