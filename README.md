# Student Performance Prediction App - iOS

## Overview

This iOS app is designed to predict student performance based on various factors and provides a user-friendly interface for monitoring and analyzing student data. It utilizes Firebase and Firestore for data storage, authentication, and real-time updates. The app also incorporates a CoreML model for predictive analytics and integrates a graph library to showcase a dashboard with insightful visualizations.

## Features

- **Firebase Integration:** Utilizes Firebase for backend services, including Firestore for real-time database and Firebase Authentication for user management.

- **Predictive Analytics:** Incorporates a CoreML model to predict student performance based on input parameters.

- **Graph Library:** Integrates a graph library to visualize and showcase student performance data on a dynamic dashboard.

- **User Authentication:** Implements user authentication through Firebase Authentication to ensure secure access to the app's features.

## Requirements

- Xcode 12 or later
- Swift 5
- Firebase account and project setup
- CoreML model for predictive analytics
- Graph library (e.g., Charts, Core Plot)

## CoreML Model Integration

The CoreML model used in this app was created and trained using Python, leveraging the scikit-learn library for machine learning tasks. The model is designed to predict student performance based on various input parameters.

### Model Training Process

1. **Data Collection:** A dataset containing relevant student information, including marks and other factors, was gathered for training the model.

2. **Feature Engineering:** The dataset underwent preprocessing and feature engineering to extract meaningful insights that contribute to predicting student performance.

3. **Model Training:** The scikit-learn library was employed to train the machine learning model on the prepared dataset, optimizing it for accurate performance predictions.

4. **Validation:** The model's performance was validated using appropriate evaluation metrics to ensure its effectiveness.

## CoreML Conversion

After the model was trained and validated in Python, it was converted to the CoreML format using the tools provided in the Apple documentation. This ensures seamless integration into the iOS app, allowing for real-time predictions on user devices.

## User Roles and Functionality

The app caters to two main user roles: **Student** and **Faculty**.

### Student

- **View Marks:** Students can access their academic performance data through the app.
  
- **Update Effort Metrics:** Students have the ability to update effort-related metrics, such as absences and study time, through an in-app form. This provides a dynamic way for students to contribute to their performance analysis.

### Faculty

- **CRUD Operations on Marks:** Faculty members have full control over student marks, enabling them to Create, Read, Update, and Delete (CRUD) records as needed.

- **Monitoring and Analysis:** Faculty members can use the dashboard to monitor student performance trends and gain insights into academic progress.

This dual functionality caters to both students and faculty, offering a comprehensive educational experience within the app.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/student-performance-app-ios.git
   ```

2. Open the Xcode project file (`StudentPerformanceApp.xcodeproj`).

3. Install dependencies if needed.

   ```bash
   pod install
   ```

4. Set up Firebase in the project by adding the `GoogleService-Info.plist` file obtained from the Firebase console.

5. Add your CoreML model to the project.

6. Configure the graph library as per its documentation.

7. Build and run the project.

## Configuration

### Firebase Configuration

1. Set up a Firebase project: [Firebase Console](https://console.firebase.google.com/).
2. Add an iOS app to your Firebase project and follow the setup instructions.
3. Download the `GoogleService-Info.plist` file and add it to the Xcode project.

### CoreML Model Integration

1. Train or obtain a CoreML model for student performance prediction.
2. Add the CoreML model file to the Xcode project.

### Graph Library Configuration

1. Follow the documentation of the chosen graph library to integrate and configure it in the project.

## Usage

1. Launch the app on an iOS simulator or physical device.
2. Sign in or create a new account using Firebase Authentication.
3. Explore the dashboard to view student performance visualizations.
4. Use the input features to predict student performance using the integrated CoreML model.


## Project Overview

This repository is dedicated to the development of the Student Performance Prediction App for both iOS and Android platforms. The iOS section currently integrates Firebase, Firestore, CoreML for predictive analytics, and a graph library for visualization, catering to student and faculty roles. Simultaneously, active development for the Android version is in progress, aiming to replicate the comprehensive functionality of the iOS counterpart.

The ongoing development is set to enhance the project's complexity with the introduction of new features, optimizations, and the synchronization of functionality between iOS and Android platforms. This evolution may include additional machine learning models, improved visualizations, and extended capabilities for both students and faculty.

The project encourages contributions, and the roadmap outlines plans for feature additions, bug fixes, and eventual releases on both platforms. Stay informed about project updates, announcements, and new releases by following our GitHub repository. Your feedback and contributions are valuable as we strive to create a robust student performance management system.

**Note:** This repository focuses on the iOS side of the app, and development for the Android counterpart is actively underway.

## Contributing

Contributions to the project, whether for iOS or Android development, are welcome. If you're interested in contributing, please refer to the [Contribution Guidelines](CONTRIBUTING.md) for more information.

## Roadmap

The project roadmap includes plans for feature additions, bug fixes, and the eventual release of both iOS and Android versions. Regular updates will be made to accommodate changes in technology and user requirements.

## Stay Informed

Stay informed about project updates, announcements, and new releases by following our GitHub repository. Feel free to open issues, provide feedback, or contribute to the ongoing development of this comprehensive student performance management system.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thank you to the open-source community for providing essential tools and libraries.
- Special thanks to Firebase, CoreML, and the graph library developers for their excellent documentation and resources.
