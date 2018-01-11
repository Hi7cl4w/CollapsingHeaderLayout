# CollapsingHeaderLayout

Parallax, Collasing Headers, Growing image heading, done right in one UICollectionViewLayout.

## Usage

* Create a custom `UICollectionViewCell` class with xib

* Register that nib file to your collection view controller in code:

```Swift
import CollapsingHeaderLayout

  let collaspsingHeader = UINib(nibName: "CustomUICollectionViewCell", bundle: Bundle.main)
  
  override func viewDidLoad() {
      super.viewDidLoad()
        
      self.collectionView.register(self.collaspsingHeader, forSupplementaryViewOfKind: CollapsingHeaderLayoutParallax, withReuseIdentifier: "header")
      
  }
```
* Setup collection view header layout

```Swift
func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        if let layout: CollapsingHeaderLayout = self.collectionView.collectionViewLayout as? CollapsingHeaderLayout {
            layout.parallaxHeaderReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 274)
            layout.parallaxHeaderMinimumReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 160)
            layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView.collectionViewLayout = layout
        }
        
        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    }
```

Implement `func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView`

```Swift
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(kind)
        switch kind {
        case CollapsingHeaderLayoutParallax:
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CustomUICollectionViewCell
            return cell
        default:
            assert(false, "Unexpected element kind")
            
        }
    }
```

## Requirements

- Xcode 9
- Swift 4.0
- iOS 11

## Installation

To use this in to your project 

run 
`git submodule add https://github.com/manukn/CollapsingHeaderLayout.git`

Add framework into your project

## Author

Manu K

## License

CollapsingHeaderLayout is available under the MIT license. See the LICENSE file for more info.
 
## Thanks

- [CSStickyHeaderFlowLayout](https://github.com/jamztang/CSStickyHeaderFlowLayout)


## About me
 
 If you get any problems when using this library, please feel free to [email me](mailto:me@manuknarayanan.com). :smiley:
