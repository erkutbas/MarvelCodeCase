# Marvel Code Case

## What's done on the code case?

- Project divided into several scopes and creates a couple of swift package manager to support seperation of concerns. Here the scopes of the code case. 
  - Network Layer
  - Network Entity Layer
  - Domain Layer
  - Data Layer
  - Presentation Layer (Application)
---
- Some advanced level frameworks are used to create a modern mobile application infrastures. Here is detailed about the used frameworks and reasons.
  - Alamofire
    - Used to implement a higher level of networking layer. Besides network layer created by using alamofire, the network layer is a reusable swift package manager.
  - Swinject
    - It's used to implement dependency injection/inversion to create reusable, maintainable components and modules all over the application.
  - RxSwift
    - Implemented for reactive programming. Domain and data layers are written by using RxSwift.
  - Lotti
    - Injected to make a beautiful and sugar loading animation while reaching out the network.
  ---
- Application presentation layer is written by using MVVM-C Design pattern. 
- All user interface compoents are created by using programmatically programming to enchance reusability and to reduce maintenance effor. 
  - Some user interfaces are also reused inside the application.
- MainView created to list character as written in the code case requirements.
- CharacterDetail view created to show the details of the selected character and it's comics related to the requirements based on the code case.
- FavouritesView is added to show user list of favourite characters which he/she selects from detail view by pressing favourite/heart icon.
- Navigational flows are created for a better user experinces by using reusable views and components. 
- Favourites and refresh buttons are added on the navigationbar.
- PersistencyManager created to support favourite lists.