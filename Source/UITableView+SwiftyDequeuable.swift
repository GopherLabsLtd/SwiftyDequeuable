public protocol ReusableTableViewCell {
    // Empty
}

public extension ReusableTableViewCell where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView, ReusableTableViewCell {

}

public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableTableViewCell, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T where T: ReusableTableViewCell, T: NibLoadableView{
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
