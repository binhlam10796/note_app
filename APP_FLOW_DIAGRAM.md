## App Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         NotesHub App                            │
├─────────────────────────────────────────────────────────────────┤
│                    Bottom Navigation                            │
│  ┌─────────────────┐              ┌─────────────────┐           │
│  │    📝 Notes     │              │   👥 Users      │ ← NEW!   │
│  └─────────────────┘              └─────────────────┘           │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                      Users View (NEW)                          │
├─────────────────────────────────────────────────────────────────┤
│  ┌─ GitHub Users ──────────────────────────────────────────────┐ │
│  │  ┌─────────────────────────────────┐  ┌──────────────────┐  │ │
│  │  │     🔍 Search users...          │  │      ⋮ Sort     │  │ │
│  │  └─────────────────────────────────┘  └──────────────────┘  │ │
│  │                                                             │ │
│  │  ┌─────────────────────────────────────────────────────────┐ │ │
│  │  │  👤 octocat                              ID: 583231  👤 │ │ │
│  │  │     The Octocat                                     >   │ │ │
│  │  └─────────────────────────────────────────────────────────┘ │ │
│  │                                                             │ │
│  │  ┌─────────────────────────────────────────────────────────┐ │ │
│  │  │  👤 defunkt                              ID: 2       👤 │ │ │
│  │  │     Chris Wanstrath                                 >   │ │ │
│  │  └─────────────────────────────────────────────────────────┘ │ │
│  │                                                             │ │
│  │  ┌─────────────────────────────────────────────────────────┐ │ │
│  │  │  👤 pjhyett                             ID: 3       👤 │ │ │
│  │  │     PJ Hyett                                        >   │ │ │
│  │  └─────────────────────────────────────────────────────────┘ │ │
│  │                                                             │ │
│  │  ⟲ Pull to refresh • ∞ Infinite scroll • 10 per page      │ │
│  └─────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                  User Details Modal (NEW)                      │
├─────────────────────────────────────────────────────────────────┤
│  ─────                                                          │
│                           👤                                   │
│                         Large                                  │
│                        Avatar                                  │
│                                                                │
│                       octocat                                  │
│                    The Octocat                                 │
│                                                                │
│  🏷️  User ID            583231                                │
│  👤  Type                User                                  │
│  🔒  Site Admin          No                                    │
│  📁  Public Repos        8                                     │
│  👥  Followers           3943                                  │
│  ➕  Following           9                                      │
│                                                                │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              📋 Copy Profile URL                       │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                    Error/Loading States                        │
├─────────────────────────────────────────────────────────────────┤
│  Loading:        ⟳ CircularProgressIndicator                   │
│  Error:          ❌ Error message + "Retry" button             │
│  Empty:          👥 "No users found" message                   │
│  Load More:      ⟳ Bottom loading indicator                    │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                     Search & Sort Features                     │
├─────────────────────────────────────────────────────────────────┤
│  Search:                                                       │
│  • Real-time filtering by username or display name            │
│  • Clear button when text is entered                          │
│  • Instant results as you type                                │
│                                                                │
│  Sort Options:                                                 │
│  • Default (API order)                                        │
│  • Name A-Z / Name Z-A                                        │
│  • ID Low-High / ID High-Low                                  │
│  • Visual indicators for active sort                          │
└─────────────────────────────────────────────────────────────────┘
```

## Technical Architecture Flow

```
GitHub API ─→ ApiService ─→ UsersCubit ─→ UsersView ─→ User Interaction
     ↑              ↑            ↑           ↑               ↓
  HTTP/JSON    Dio Client   BLoC State   UI Widgets    User Actions
     ↑              ↑            ↑           ↑               ↓
Error Handling  Timeouts    State Mgmt   Visual Feed    Search/Sort
     ↑              ↑            ↑           ↑               ↓
Retry Logic    Network     Loading/Error   Animations   Pagination
```

## State Flow

```
Initial → Loading → Loaded → [User Actions] → Updated State
    ↓         ↓        ↓            ↓              ↓
 Empty     Spinner   UserList   Search/Sort   Filtered List
    ↓         ↓        ↓            ↓              ↓
 Message   Progress  Cards     Loading More   More Cards
    ↓         ↓        ↓            ↓              ↓
 Retry     Cancel    Details   Error Handling  Success
```