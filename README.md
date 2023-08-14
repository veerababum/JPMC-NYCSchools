
---

# NYC High Schools Information App

![App Screenshots](screenshots.png)

This native iOS app allows users to access information about NYC High Schools, including a list of schools and their SAT scores.

## Features

- Display a list of NYC High Schools.
- Show additional information about a selected school, including SAT scores (Math, Reading, and Writing).
- Retrieve school data from [DOE High School Directory 2017](https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2).
- Retrieve SAT scores data from [SAT Results](https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4).

## Requirements

- Swift as the primary language.
- Compatible with iPhone X and later.
- Safe area insets are used to ensure proper layout.
- No third-party dependencies used, all frameworks are committed to the repository.

## Installation

1. Clone this repository.
2. Open the Xcode project.
3. Build and run the app on the desired iOS simulator or device.

## Screenshots

![Screenshot 1](screenshots/screenshot1.png)
*List of NYC High Schools*

![Screenshot 2](screenshots/screenshot2.png)
*School Details with SAT scores*

## Code Structure

- `ViewController.swift`: Displays the list of NYC High Schools.
- `SchoolDetailsViewController.swift`: Displays additional information about a selected school, including SAT scores.
- `SchoolModel.swift`: Defines the data model for NYC High Schools and SAT scores.
- `SchoolService.swift`: Handles network requests to retrieve school and SAT data.

## Known Issues

- No known issues at the moment. Please report any bugs or problems in the Issues section.

## Contributing

Contributions are welcome! If you find any bugs or want to add new features, feel free to fork this repository and create a pull request.

## Contact

If you have any questions or need further assistance, please contact 720-515-1779 at veeru071819@gmail.com.

---
