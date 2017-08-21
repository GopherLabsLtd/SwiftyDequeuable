[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Chamber.svg)](https://img.shields.io/cocoapods/v/SwiftyDequeuable.svg)
[![Platform](https://img.shields.io/cocoapods/p/Chamber.svg?style=flat)](http://cocoadocs.org/docsets/SwiftyDequeuable)

# SwiftyDequeuable

SwiftyDequeuable is a a more Elegant way to dequeue cells with a UITableView or a UICollectionView.

With Swift, we have the power of Protocol Oriented Programming +  Protocol Extensions and with using Generics we can simplify these redundant processes.

We go from...

```

override func viewDidLoad() {
     super.viewDidLoad()

     let nibName = UINib(nibName: "SimpleLabelCell", bundle:nil)
     tableView.registerNib(nibName, forCellReuseIdentifier: "SimpleLabelCell")
 }

```

To something a little more Elegant...

```

override func viewDidLoad() {
    super.viewDidLoad()

    tableView.registerNib(SimpleLabelCell.self)
}

```

No more strings!

## Installation

### Cocoapods

```

  pod 'SwiftyDequeuable'
```

## Usage
Create a new cell with the corresponding .xib

```
import UIKit

class SimpleLabelCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}

```

In your ```viewDidLoad``` register your cell (or where ever you usually register your cells)

```

override func viewDidLoad() {
    super.viewDidLoad()

    tableView.registerNib(SimpleLabelCell.self)
}

```

In your ```cellForRowAt``` of your ```UITableViewDatasource``` you can dequeue the cell by...

```

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  // If we cannot dequeue cell, a fatal error would be thrown.
  let cell = tableView.dequeueReusableCell(SimpleLabelCell.self, forIndexPath: indexPath)
  return cell
}
```

SwiftyDequeuable also supports ```UICollectionView```, the steps are very to the ones above. Have a look at the [Example](/SwiftyDequeuableExample).

## License

SwiftyDequeuable is released under an MIT license. See [License.md](License.md) for more information.
