# Unit testing Swift mobile App ([from Udemy course](https://www.udemy.com/course/unit-testing-ios-mobile-app/))

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

![default functions](https://user-images.githubusercontent.com/42684822/163681421-9c7b367c-c026-4d04-8d7a-ac7ec76db661.png)

### Default order of the Unit Tests

XCode run the tests in **alphabetical order**

### Unit Testing naming requirements

- **must** start with `test`
- no take arguments values, no return values

**naming pattern**

`func test<System under test>_<Condition or State change>_<Expected result>() {`

}

*example*

`testSignupFormModel_WhenInformationProvided_PasswordShouldMatchRepeatPassword() {`

`}`

### Arrange Act Assert (AAA Pattern)

- Arrange
    - Prepare all the needed variables
- Act
    - invoke the method that we are testing
- Assert
    
    <img width="660" alt="assert" src="https://user-images.githubusercontent.com/42684822/163681435-c2d9d5c2-8026-4028-ab26-b5224b52c05c.png">


### Parallel Distributed Testing

(running in different simulators at the same time)
