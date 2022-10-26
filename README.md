# Ticketing-System-For-Public-Transport-Network
CSSE Module - University Project
## Group No.:	SE3070_WE_42

- IT20252304 - EDIRISINGHE B. M 
- IT20163204 - MANIMENDRA N. H
- IT20252786 - EKANAYAKA E. M. A. I. B
- IT20241032 - RAVISHAN S. A. A




<h1 align="center"> BUS Ticketing System </h1> <br>
<p align="center">
  <a href="https://doolshe.com/">
    <img alt="BTS" title="BTS" src="http://i.imgur.com/VShxJHs.png" width="450">
  </a>
</p>

<p align="center">
  Ticketing-System-For-Public-Transport-Network
</p>

</p>

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

## Introduction

This is a ticketing system for the public transport network, in this system we mainly focus on having a user-friendly ticketing system for buses. If a bus needs to have the system, the bus needs to be registered through bus depo. So once the bus is registered there will be a QR Code will be provided for each bus, by using the QR Code passengers can pay the travel amount through Scanning the QR Code. Once a passenger gets into the bus, he needs to scan the QR code and provide the IN location and OUT location and once the passenger needs to get out from the bus, the passenger needs to scan the QR Code again to make the payment. All the payment that was made for each bus was sent to the bus depo, and from there the payment was credited to the bus owner.

![UseCase Diagram](https://user-images.githubusercontent.com/101692241/198026633-499a0961-e0bc-4b11-91b6-e26b7259474e.png)

![Class Digram](https://user-images.githubusercontent.com/101692241/198026555-91ce2de0-ddbe-4319-bd01-949189aff12a.png)

**Available for Web and Android.**

<p align="center">
  <img src = "http://i.imgur.com/HowF6aM.png" width=350>
</p>

## Features

* the bus needs to be registered through bus depo

* once the bus is registered there will be a QR Code will be provided for each bus

* using the QR Code passengers can pay the travel amount through Scanning the QR Code

* Once a passenger gets into the bus, he needs to scan the QR code and provide the IN location and OUT location

* once the passenger needs to get out from the bus, the passenger needs to scan the QR Code again to make the payment

* All the payment that was made for each bus was sent to the bus depo, and from there the payment was credited to the bus owner.


## Feedback
Add Your Feedback here!
< https://forms.gle/bovTVrJUQFRVR8TX8 >

## Build Process

- Follow the [React Native Guide](https://facebook.github.io/react-native/docs/getting-started.html) for getting started building a project with native code. **A Mac is required if you wish to develop for iOS.**
- Clone or download the repo
- `yarn` to install dependencies
- `yarn run link` to link react-native dependencies
- `yarn start:ios` to start the packager and run the app in the iOS simulator (`yarn start:ios:logger` will boot the application with [redux-logger](<https://github.com/evgenyrodionov/redux-logger>))
- `yarn start:android` to start the packager and run the app in the the Android device/emulator (`yarn start:android:logger` will boot the application with [redux-logger](https://github.com/evgenyrodionov/redux-logger))

Please take a look at the [contributing guidelines](./CONTRIBUTING.md) for a detailed process on how to build your application as well as troubleshooting information.

**Development Keys**: The `CLIENT_ID` and `CLIENT_SECRET` in `api/index.js` are for development purposes and do not represent the actual application keys. Feel free to use them or use a new set of keys by creating an [OAuth application](https://github.com/settings/applications/new) of your own. Set the "Authorization callback URL" to `gitpoint://welcome`.

## Team Members 

- IT20252304 - EDIRISINGHE B. M 
- IT20163204 - MANIMENDRA N. H
- IT20252786 - EKANAYAKA E. M. A. I. B
- IT20241032 - RAVISHAN S. A. A


## Acknowledgments

Thanks to [JetBrains](https://www.jetbrains.com) for supporting us with a [free Open Source License](https://www.jetbrains.com/buy/opensource).
