[](https://github.com/ihernandezvelarde/NewsApp_iOS/blob/main/Images/title.png)

Neei News is an application that contains the latest and most popular news.

At the top of the main screen you will find the title of the application followed by the time in real time, the count of both news and users that are in the application and a registration option.

You can access this screen by pressing on the “+”. This will take you to a detail view in which you will see an image, fields to fill in with your data, and a registration button.

Again on the main screen there is also an interactive news carousel which, by clicking on it, will open a detail view that contains the date of the news, an image, the title, a brief description and a button to go to the full story.

In the middle part of the main screen you will find three buttons on the most viewed news, highlights and news. Below this are three other buttons with links to Facebook Instagram and Youtube. Finally a TabBar to be able to go to other screens.

If you press the second Item of the TabBar you will go to a new view with a TimeLine that contains the information from the news, it will be painted for hours.

In the third Item you will find a view with a Map and a default location (Apple Union Square in San Francisco). With the option of pressing the button to geolocate where you are.

Finally, there would be the view of the application's language change, which consists of 4 buttons with the different language options and 2 buttons in the lower area, one with information about the app and the other for its permissions.

- [Features](#features)
- [Detailed Documentation](#detailedDocu)
    - [Arquitecture](#arquitecture)
    - [Components](#components)
    - [Project Structure](#structure)
    - [Frameworks](#frameworks)
    - [API Call](#apiCall)
    - [Using the app](#usingApp)
       - [User Interface](#userInterface)
- [Get Started](#getStarted)
   - [Requirements](#requirements)
   - [Fork the repo](#fork)
   - [Clone the repo](#clone)
      - [Command line Git](#command)
   - [Configure Fork](#configFork)
- [To do's](#toDo)
- [Contributing](#contributing)
----
# Features<a name="features"></a>
- The data was retrieved using the news [API](#API).
- News carousel.
- Detail view of the news.
- The news feed can be accessed with a button in the detail view.
- Links to Facebook, Instagram and Youtube.
- Registration screen on the  :heavy_plus_sign:  in the main screen.
- Geolocation and default location in Apple Union Square in San Francisco.
- Timeline of news in real time.
- Change language screen.

# Detailed Documentation<a name="detailedDocu"></a>

In this section you will find a detailed explanation of the application, including its architecture, components, structure, frameworks, API call, and how you can start using the application immediately.

## Arquitecture<a name="arquitecture"></a>

To make this application I have decided to apply the MVC software design pattern since it is used to separate the data, the methodology and the graphical interface of an application into three components.

The great advantage of this programming technique is that it allows you to modify each one of them without having to modify the others.

[](https://github.com/ihernandezvelarde/NewsApp_iOS/blob/main/Images/MVC.png)


## Components <a name="components"></a>

The components that I used in the application:

| Components    | Description   |
| ------------- |:-------------|
| UIViewController        | An object that manages a view hierarchy for your UIKit app.|
| UITabBarController      | A container view controller that manages a multiselection interface, where the selection determines which child view controller to display.|
| UICollectionView        | An object that manages an ordered collection of data items and presents them using customizable layouts.|
| UICollectionViewCell    | A single data item when that item is within the collection view’s visible bounds.|
| UIPageControl           | A control that displays a horizontal series of dots, each of which corresponds to a page in the app’s document or other data-model entity.          |
| UILabel                 | A view that displays one or more lines of informational text.|
| UITextField             | An object that displays an editable text area in your interface.|
| UIImage                 | An object that manages image data in your app.|
| UIImageView             | A view that displays a single image or a sequence of animated images in your interface.|
| UIButton                | A control that executes your custom code in response to user interactions.|
| UIView                  | An object that manages the content for a rectangular area on the screen.|

## Project Structure<a name="structure"></a>
In the following images you can see the structure that I created for the project.

[](https://github.com/ihernandezvelarde/NewsApp_iOS/blob/main/Images/Untitled_2022-12-18_19-17-08.png)

[](https://github.com/ihernandezvelarde/NewsApp_iOS/blob/main/Images/Untitled_2022-12-18_19-17-36.png)

## Frameworks<a name="frameworks"></a>
The frameworks that I used in the application have been:
| Frameworks    | Description   |
| ------------- |:-------------|
| UIKit         | Construct and manage a graphical, event-driven user interface for your iOS, iPadOS, or tvOS app.|
| Foundation    | Access essential data types, collections, and operating-system services to define the base layer of functionality for your app.|
| CocoaTouch    | Is an API for creating programs for the iPad, iPhone and iPod Touch from Apple Inc.|
| GooglePlaces  | It is a Google Maps API with the Places library.|
| GoogleMaps    | Is a programming interface to the Google Maps APIs.|
| DropDown      | In a Graphical User Interface, a dropdown list is a widget that allows the user to select one or more options.|

## API CALL<a name="apiCall"></a>
API Call with Country<a name="API"></a>
```
https://newsapi.org/v2/top-headlines?country={Country Name}&apiKey={API key}
```
API Call with sortBy keyword
```
https://newsapi.org/v2/everything?q=apple&sortBy={keyword}&apiKey={API key}
```
## Using the app<a name="usingApp"></a>
### User Interface<a name="userInterface"></a>

| Main Screen   | DetailsView   |
| ------------- |:------------- |
| Register      | TimeLine      |
| Maps          | Language      |

# Get Started<a name="getStarted"></a>
## Requirements<a name="requirements"></a>
- Cocoa Pods - DropDown, GoogleMaps y GooglePlaces:
    - Add pod 'DropDown’, ‘GoogleMaps’ and ‘GooglePlaces’ to your Podfile.
    - Install the pod(s) by running pod install.
    - Add import DropDown in the .swift files where you want to use it.
- Xcode 13.4.1
- Device or Simulator iPhone 13 running iOS 15.5 or later.

## Fork the repository<a name="fork"></a>
Fork the [News App](https://github.com/ihernandezvelarde/NewsApp_iOS/fork) repository.

## Clone the repository<a name="clone"></a>
Once you have forked the repository, you can make a clone and open NewsApp_iOS.xcodeproj in Xcode.

### Command line Git<a name="command"></a>
1. [Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) the NewsApp_iOS project.
2. cd into the NewsApp_iOS folder.
3. Make your changes and create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

## Configuring a Remote for a Fork<a name="configFork"></a>
If you make changes in the fork and would like to [sync](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork) those changes with the upstream repository, you must first [configure the remote](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/configuring-a-remote-repository-for-a-fork). This will be required when you have created local branches and would like to make a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) to your upstream branch.
- [Instructions for Mac](https://docs.github.com/en/get-started/quickstart/fork-a-repo?tool=webui).
- [Instructions for Windows](https://docs.github.com/en/get-started/quickstart/fork-a-repo?tool=webui&platform=windows).

## To do’s<a name="toDo"></a>
- [ ] Implement the functions of the Trending, Features and Novelty buttons on the main screen.
- [ ] Change the registry to save the data in the cloud.
- [ ] Implement the functionalities of the language change buttons, on the app and permissions.
- [ ] On the main screen, change the number of news and users depending on the news that is displayed in the app and the people who enter it.

## Contributing<a name="contributing"></a>
Anyone and everyone is welcome to contribute. We do accept pull requests.
1. Get involved.
2. Report issues.
3. Contribute code.
4. Improve documentation.
