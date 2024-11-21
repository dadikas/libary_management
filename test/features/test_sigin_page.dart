
void main() {
  // group('SigninPage Tests', () {
  //   testWidgets('displays welcome section and Next button initially', (WidgetTester tester) async {
  //     // Arrange
  //     await tester.pumpWidget(const MaterialApp(home: SigninPage()));

  //     // Assert initial state
  //     expect(find.text('Welcome'), findsOneWidget);
  //     expect(find.text('continue'), findsOneWidget);
      
  //     expect(find.byType(CustomTextfield), findsWidgets);
  //   });

  //   testWidgets('shows login form and hides Next button on tap', (WidgetTester tester) async {
  //     // Arrange
  //     await tester.pumpWidget(const MaterialApp(home: SigninPage()));

  //     // Act - tap on the 'Next' button
  //     await tester.tap(find.text('continue'));
  //     await tester.pumpAndSettle();

  //     expect(find.text('continue'), findsNothing);
  //     expect(find.text('Sign'), findsOneWidget);
  //     expect(find.text(' In'), findsOneWidget);
  //     expect(find.byType(CustomTextfield), findsNWidgets(2)); // Email and Password fields
  //   });

  //   testWidgets('displays custom text fields in login form', (WidgetTester tester) async {
  //     // Arrange
  //     await tester.pumpWidget(const MaterialApp(home: SigninPage()));
  //     await tester.tap(find.text('continue'));
  //     await tester.pumpAndSettle();

  //     // Assert email and password fields exist
  //     expect(find.byType(CustomTextfield), findsNWidgets(2));
  //     expect(find.widgetWithText(CustomTextfield, 'Email'), findsOneWidget);
  //     expect(find.widgetWithText(CustomTextfield, 'Password'), findsOneWidget);
  //   });

  //   testWidgets('Login button alignment and text are correct', (WidgetTester tester) async {
  //     // Arrange
  //     await tester.pumpWidget(const MaterialApp(home: SigninPage()));
  //     await tester.tap(find.text('continue'));
  //     await tester.pumpAndSettle();

  //     // Assert the login button is aligned right and has text "Login"
  //     final loginButton = find.widgetWithText(ElevatedButton, 'Login');
  //     expect(loginButton, findsOneWidget);

  //     final alignment = tester.widget<Align>(
  //       find.ancestor(of: loginButton, matching: find.byType(Align)),
  //     ).alignment;
  //     expect(alignment, Alignment.centerRight);
  //   });
  // });
}