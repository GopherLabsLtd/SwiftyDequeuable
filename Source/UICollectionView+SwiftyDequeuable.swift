
extension UICollectionViewCell: NibLoadableView, ReusableView {}

extension UICollectionView {
    public func registerNib<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T where T: ReusableView, T: NibLoadableView{
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
