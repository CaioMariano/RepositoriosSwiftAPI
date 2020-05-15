# Repositories Swift API

The most popular swift repositories of github

## Getting Started

(check if it's on the master branch)
```
git clone [Project URL]
pod install
```

## Prerequisites
```
iOS 10.0 or later
```
## Technologies:
 
 * Git/GitFlow: ``` Feature Branch -> Develop -> Master ``` 

 * MVVM Architecture: ```Due to its great ease of maintenance and responsibility of the well-defined classes. What is essential to create unit tests.``` 

* CocoaPods:
  * [PromiseKit](https://github.com/mxcl/PromiseKit) - Used in network layer for simplify asynchronous programming
  * [Quick/Nimble](https://github.com/Quick) - Quick is a behavior-driven development framework for Swift, used in unit tests.

* Tests with Quick/Nimble

* Generic Network layer: ``` Repository, Interactor, Model, Network and Endpoint```

* Fastlane:
  * [Slather](https://github.com/SlatherOrg/slather) - Used for generate test coverage reports for Xcode projects & hook it into CI.

* Others: ```Infinite scroll and Pull to refresh```

## Running the Fastlane tests(Slather)

In the Terminal app execute: ```bundle exec fastlane tests```







