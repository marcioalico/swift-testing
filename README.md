# Unit testing Swift mobile App ([from Udemy course](https://www.udemy.com/course/unit-testing-ios-mobile-app/))

Some of the topics I saw in this course:
- Basics of testing
- Unit and UI testing
- Test Driven Development
- Mock Dependencies

**Testing pyramid**

1. **Unit tests**: Testing isolated small pieces of code with Mock dependencies.
2. **Integration tests**: Code is tested without mocking database / HTTP connections.
3. **UI tests**: Simulate using behavior to test User Interface and Behavior (e.g.: tap on buttons, select a cell, and validate that a ui alert is shown) 

**F.I.R.S.T principle for Unit Tests**

- **F**ast - UT run fast
- **I**ndependent - UT are independent
- **R**epeatable - UT are repeatable
- **S**elf-validating - UT validates itself
- **T**horough & Timely - Cover edge cases

**Test-Driven Development** (TDD) with Swift

TDD life cycle: Red → Green → Refactor → Repeat

1. Red: Write a unit test that fails
2. Green: Write App code to make Unit Test pass
3. Refactor: Clean up and improve Unit Test and app code (e.g.: delete repeated code)
4. Repeat

**Add test target to project**

<aside>
💡 select project → **+** button in TARGETS → Unit Testing Bundle

</aside>

**Default Unit Test Functions**

**setUp()** → beforeEach ()

**tearDown()** → afterEach (perform clean up of the created objects)

**testExample()** 

**testPerformanceExample()** 

we can **`override`** the **`setUp()`** and **`tearDown()`** funcs with a class func, **in order to execute them just once, for that reason are class level functions.**

```swift
class swift_testing_practiceTests: XCTestCase {

    override class func setUp() {
        // Order of execution: 1
        super.setUp()
    }
    
    override func setUp() {
        // Order of execution: 2
    }
    
    func someTest() {
        // Order of execution: 3
        // example test
    }
    
    override func tearDown() {
        // Order of execution: 4
        // Put teardown code here. This method is called after the invocation of each test method in the class
    }
    
    override class func tearDown() {
        // Order of execution: 5
        // It is called after all methods complete.
        // Perform any overall cleanup here.
        super.tearDown()
    }
}
```

### Default order of the Unit Tests

XCode run the tests in **alphabetical order**

### Unit Testing naming requirements

- **must** start with `test`
- no take arguments values, no return values

**Naming pattern**

```swift
func test<System under test>_<Condition or State change>_<Expected result>() { ... }
```

*example*
```swift
testSignupFormModel_WhenInformationProvided_PasswordShouldMatchRepeatPassword() { ... }
```
### Arrange Act Assert (AAA Pattern)

- Arrange: Prepare all the needed variables
- Act: invoke the method that we are testing
- Assert: validate
    
    <img width="660" alt="assert" src="https://user-images.githubusercontent.com/42684822/163681435-c2d9d5c2-8026-4028-ab26-b5224b52c05c.png">

### Dependency Injections

Inject fake or dummies dependencies in our classes allow us test them in isolation.

***Stub***
 is an object where its functions will always return a set of predefined data

***Mock***
 is an object that keeps track of which method being called and how many times it was called.

```swift
class MockEmailServiceHelper: EmailServiceHelper {
    var sendEmailCalled = false
    var emailCounter = 0
    var emailAddress = ""

    func sendEmail(to address: String) {
        sendEmailCalled = true
        emailCounter += 1
        emailAddress = address
    }
}
```

**Dummy**
are objects that are not being used in a test and only act as a placeholder. It usually does not contain any implementation.

```swift
class DummyDatabaseReader: DatabaseReader {
    func getAllStock() -> Result<[Television], Error> {
        return .success([])
    }
}
```

### UI Testing

UI Testing has no direct access to internal functions. They allow us to intetact with UI elements. (black box)

*Example UI Test: Lunch app, navigate to user sign up screen, tap text field, type text, tap button. Assert that a spinner is showing and sign up button turn into disabled.*
```swift
let app = XCUIApplication()
app.launch()

let username = app.textFields["userNameTextField"] // Acessibility identifier or placeholder
XCTAssertTrue(username.isEnabled)

let loginButton = app.buttons["loginButton"]
XCTAssertTrue(loginButton.isEnabled)

loginButton.tap()

// XCUIElementQuery is used to locate XCUIElement
// When we send events to the elements they allocate 

// Advance ElementQueries
to check direct subviews:
XCUIApplication().scrollViews["thumbnails"].children(matching: .image)

to check subviews and sub-subviews:
XCUIApplication().scrollViews["thumbnails"].descendants(matching: .image)
```
