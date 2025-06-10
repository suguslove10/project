# Travel Dashboard Flutter App

A comprehensive travel management dashboard built with Flutter, designed for managers to oversee employee travel requests, analytics, and history.

## Features

### 🏠 Dashboard
- Overview of travel requests and employee data
- Key metrics with visual indicators
- Monthly trends and status distribution charts
- Department analysis with interactive charts

### ⏰ Pending Requests
- Review and approve/reject travel requests
- Detailed request information with priority indicators
- Approval workflow with notes capability
- Real-time status updates

### 👥 Employee Information
- Monitor current and upcoming employee travel
- Employee profiles with travel statistics
- Trip details and scheduling information
- Interactive employee cards

### 📊 Analytics
- Comprehensive travel analytics and insights
- Multiple chart types (line, bar, pie)
- Cost analysis and trends
- Department spending breakdown
- Top destinations analysis

### 📚 Travel History
- Complete travel history with details
- Hotel and flight information
- Cost breakdowns and summaries
- Status tracking and completion rates

### 👤 Profile Management
- User profile with personal information
- Account details and emergency contacts
- Professional information and hierarchy
- Settings and preferences

## Technical Stack

### Framework & Language
- **Flutter 3.10+** - Cross-platform mobile framework
- **Dart 3.0+** - Programming language

### State Management
- **Riverpod 2.4+** - Modern state management solution

### Navigation
- **GoRouter 12.1+** - Declarative routing solution

### UI Components
- **Material Design 3** - Modern design system
- **Custom theme** with TSL branding
- **Responsive design** for tablets and phones

### Charts & Visualization
- **FL Chart 0.65+** - Beautiful and customizable charts
- **Syncfusion Charts 23.2+** - Professional chart library

### Data & Networking
- **Dio 5.4+** - HTTP client for API calls
- **JSON Serialization** - Type-safe data models

### Icons & Assets
- **Lucide Icons** - Beautiful icon set
- **Custom fonts** - Inter font family

## Project Structure

```
lib/
├── core/
│   ├── constants/          # App-wide constants
│   ├── router/            # Navigation configuration
│   └── theme/             # App theme and styling
├── features/
│   ├── dashboard/         # Dashboard feature
│   ├── pending_requests/  # Request management
│   ├── employee_info/     # Employee information
│   ├── analytics/         # Analytics and charts
│   ├── travel_history/    # Travel history
│   └── profile/           # User profile
└── shared/
    ├── presentation/      # Shared UI components
    └── domain/           # Shared models and logic
```

## Getting Started

### Prerequisites
- Flutter SDK 3.10 or higher
- Dart SDK 3.0 or higher
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd travel_dashboard
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (if needed)**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Development

- **Hot reload**: Press `r` in the terminal or use IDE hot reload
- **Hot restart**: Press `R` in the terminal or use IDE hot restart
- **Debug**: Use Flutter DevTools for debugging and performance analysis

## Design System

### Colors
- **Primary**: `#8c6d73` (TSL brand color)
- **Secondary**: `#e5e5e5` (Light gray)
- **Background**: `#ffffff` (White)
- **Text Primary**: `#0f0f0f` (Near black)
- **Text Secondary**: `#737373` (Medium gray)

### Typography
- **Font Family**: Inter
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)
- **Responsive sizing** based on screen size

### Spacing
- **Base unit**: 4px
- **Common spacings**: 8px, 12px, 16px, 20px, 24px, 32px
- **Consistent grid system**

### Components
- **Cards**: Rounded corners with subtle shadows
- **Buttons**: Primary, secondary, and outline variants
- **Badges**: Status indicators with color coding
- **Charts**: Interactive and responsive visualizations

## Features in Detail

### Responsive Design
- **Mobile-first approach** with tablet optimizations
- **Adaptive layouts** that work on all screen sizes
- **Touch-friendly interactions** with proper hit targets
- **Optimized navigation** for different form factors

### Accessibility
- **Semantic widgets** for screen readers
- **High contrast ratios** for text readability
- **Proper focus management** for keyboard navigation
- **Descriptive labels** for interactive elements

### Performance
- **Efficient state management** with Riverpod
- **Lazy loading** for large lists
- **Optimized chart rendering** with caching
- **Memory-efficient image handling**

### Data Management
- **Type-safe models** with JSON serialization
- **Repository pattern** for data access
- **Error handling** with user-friendly messages
- **Offline capability** (future enhancement)

## Customization

### Theme Customization
The app uses a centralized theme system. Modify `lib/core/theme/app_theme.dart` to customize:
- Colors and color schemes
- Typography and font sizes
- Component styles and shapes
- Animation durations

### Adding New Features
1. Create feature directory in `lib/features/`
2. Implement domain models and logic
3. Create presentation layer (pages, widgets)
4. Add navigation routes
5. Update main layout if needed

### Chart Customization
Charts can be customized in their respective feature files:
- Colors and styling
- Data formatting
- Interaction behaviors
- Animation effects

## Testing

### Unit Tests
```bash
flutter test
```

### Widget Tests
```bash
flutter test test/widget_test.dart
```

### Integration Tests
```bash
flutter test integration_test/
```

## Building for Production

### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the Flutter documentation

---

Built with ❤️ using Flutter