
extension UITableViewCell: NibLoadableView, ReusableView {}

extension UITableView {
    public func registerNib<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(_: T.Type, forIndexPath indexPath: IndexPath) -> T where T: ReusableView, T: NibLoadableView{
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
