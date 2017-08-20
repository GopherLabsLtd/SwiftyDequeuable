public protocol ReusableCollectionViewCell {
    // Empty
}

public extension ReusableCollectionViewCell where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: NibLoadableView, ReusableCollectionViewCell {

}

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableCollectionViewCell, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T where T: ReusableCollectionViewCell, T: NibLoadableView{
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
