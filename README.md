# CI&T MOobile Test - PokemonApp

An iOS app built with **Swift** and **MVVM architecture**, that consumes the [PokeAPI](https://pokeapi.co/) to display Pokémon data, such as pictures, names, abilities, and types.  

---

## Features

- Pokémon list with all pokémons available  
- Pokémon detail view (picture, abilities, height, weight, types)  
-  **LoadingView** and **ErrorView**  
- Networking powered by **Alamofire**  
- Image loading and caching with **Kingfisher**  
- Modularized project using **Swift Package Manager (SPM)**  

---

## Architecture

The project follows **MVVM (Model–View–ViewModel)**:  

- **Model** → Codable data models (`PokemonDetailData`, `Ability`, `TypeInfo`, etc.)  
- **View** → UIKit views (`DetailView`, `ErrorView`, `LoadingView`)  
- **ViewModel** → Business logic to handle state and bind data to views  

---

## Project Modules

The app is organized in **three Swift Package Manager modules**:

### 1. `UIModule`
Responsible for UI-related resources.  
- Color tokens for consistent theming  

---

### 2. `Utils`
Shared utilities and reusable components.  
- `ErrorView` → A reusable error state view  
- `LoadingView` → A reusable loader overlay  
- `Codable` Models → Data representation for PokeAPI responses  
- `Router` → Centralized navigation logic  
- `ViewConfiguration` → Protocol for cleaner view setup  

**Dependency:** `Networking`  

---

### 3. `Networking`
Handles all network requests and image downloading.  
- `NetworkingManager` → Request handler using **Alamofire**  
- `UIImageView` Extension → Downloads and caches images with **Kingfisher**  

**Dependencies:**  
- [Alamofire](https://github.com/Alamofire/Alamofire)  
- [Kingfisher](https://github.com/onevcat/Kingfisher)  

---

## Installation

1. Clone the repository:  

```bash
git clone https://github.com/dfortuna/CIAndT-Test.git
```


# What I would improve with more time

- Implement a **Coordinator module** to decouple navigation responsibilities from view controllers, improving scalability and maintainability  
- Enhance the **Error screen** by adding a Retry option, providing users with a smoother recovery path in case of failures  
- Extend the **Pokémon list** with **infinite scrolling and pagination**, leveraging the PokeAPI’s support for next and previous result sets to improve data handling and user experience  
- Adopt **SwiftLint** to enforce a consistent coding style and improve overall code quality  
- Adopt **SwiftGen** to automate the management of localized strings, image assets, and icons, ensuring better reliability and reducing manual errors  
