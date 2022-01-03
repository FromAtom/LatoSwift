# LatoSwift
Use Lato font in your UIKit/SwiftUI projects

## Usage
### for UIKit

```swift
import LatoSwift

let latoRegularFont = Lato.uiFont(ofSize: 16)
let latoBoldFont = Lato.uiFont(ofSize: 16, weight: .bold)
let latoLightItalicFont = Lato.uiFont(ofSize: 16, weight: .light, style: .italic)
```

### for SwiftUI

```swift
import SwiftUI
import LatoSwift

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Lato Regular")
                .font(Lato.font(ofSize: 16))
            Text("Lato Bold")
                .font(Lato.font(ofSize: 16, weight: .bold))
            Text("Lato Light Italic")
                .font(Lato.font(ofSize: 16, weight: .light, style: .italic))
        }
    }
}
```

## Requirements
- Xcode 13
- iOS 14

## License
- Lato font is licensed under the [SIL Open Font License, Version 1.1](/Sources/LatoSwift/Fonts/LICENSE)
- LatoSwift is licensed under the [MIT](LICENSE)

### License tips
If you publish an application that uses this library, you must notate the Lato font license (SIL Open Font License) and the LatoSwift license (MIT).

If you are using [LicensePlist](https://github.com/mono0926/LicensePlist), only the LatoSwift license will be processed, so please add the Lato font license manually using `license_plist.yml`.
