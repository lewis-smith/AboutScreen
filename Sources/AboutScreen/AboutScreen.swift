import UIKit

@IBDesignable
open class AboutScreen: UITableViewController {

    public var content: Content? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    open override func viewDidLoad() {
        
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.cellId)
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        guard let content = content else {
            return 0
        }
        
        return content.sections.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let content = content else {
            return 0
        }
        
        return content.sections[section].rows
    }

    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = content?.header else {
            return nil
        }

        if section != 0 {
            return nil
        }

        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4

        let spacer = UIView()
        stack.addArrangedSubview(spacer)
        spacer.addConstraint(NSLayoutConstraint(item: spacer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 8))


        if let image = UIImage.from(symbolOrName: header.imageName) {
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(imageView)
            imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 80))
            imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1, constant: 0))

        }

        let title = UILabel()
        title.text = header.title
        title.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * 1.6, weight: .black)
        stack.addArrangedSubview(title)

        let version = UILabel()
        version.text = header.version
        version.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize, weight: .light)
        stack.addArrangedSubview(version)

        let spacer2 = UIView()
        stack.addArrangedSubview(spacer2)
        spacer2.addConstraint(NSLayoutConstraint(item: spacer2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 8))


        return stack
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = content?.sections[indexPath.section].items[indexPath.row], let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.cellId, for: indexPath) as? AboutCell else {
            return UITableViewCell()
        }

        if let image = UIImage.from(symbolOrName: item.imageName) {
            cell.imageView?.image = image

            cell.imageView?.image = cell.imageView?.image?.withRenderingMode(.alwaysTemplate)
            cell.imageView?.tintColor = view.tintColor
        }

        cell.textLabel?.text = item.title

        if item.callback != nil {
            cell.accessoryType = .disclosureIndicator
        }
        
        cell.selectionStyle = .none

        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let callback = content?.sections[indexPath.section].items[indexPath.row].callback else {
            return
        }

        callback()
    }
}

class AboutCell: UITableViewCell {
    static let cellId = "AboutCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
    class func from(symbolOrName: String) -> UIImage? {
        if #available(iOS 13.0, *) {
            if let image = UIImage(systemName: symbolOrName) {
                return image
            }
        }

        return UIImage(named: symbolOrName)
    }
}
