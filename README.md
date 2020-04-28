# AboutScreen

A simple static about screen.

## Instructions
- In a storyboard, create a `UITableViewController` 
- Create a new File/Class for the table
- Add content as follows:

```
import UIKit
import AboutScreen

class ViewController: AboutScreen {

    override func viewDidLoad() {
        super.viewDidLoad()

        let content = Content(header: Header(imageName: "clock", title: "Analog", version: "v2020.1 TF"),
                              sections: [
                                Section(items: [
                                Item(imageName: "pencil", // this will look for an SF Symbol, if it doesn't find one it will look for an `imagedNamed:`  
                                    title: "Pencil", callback: {
                                        print("pencil tapped")
                                    })
                                ])
        ])

        self.content = content
    }
}
```
