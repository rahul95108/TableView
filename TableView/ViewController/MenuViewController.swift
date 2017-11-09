
import UIKit

class MenuViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tbView:UITableView?
    var items: NSMutableDictionary = [:]
    var arrSectionTitle:NSArray = []
    
    let arr : NSMutableArray = ["One","Two","Three","Four"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        items = ["  SHOP  ": ["Supplements"], "  KNOWLEDGE  ": ["Articles", "Courses"],"  TRAINING  ": ["Training Plans", "My Orders", "Settings", "GAP"]]
        arrSectionTitle = items.allKeys as NSArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableView Delegate Methods -
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSectionTitle.count
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if type(of: view) === UITableViewHeaderFooterView.self {
            let tableViewHeaderFooterView = view as? UITableViewHeaderFooterView
            tableViewHeaderFooterView?.textLabel?.text = tableViewHeaderFooterView?.textLabel?.text?.uppercased()
            tableViewHeaderFooterView?.textLabel?.font = UIFont.boldSystemFont(ofSize: 23)
            tableViewHeaderFooterView?.textLabel?.textColor = UIColor(red: 197.0 / 255.0, green: 219.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0)
//            tableViewHeaderFooterView?.backgroundColor = UIColor.red
            tableViewHeaderFooterView?.textLabel?.layer.borderColor = UIColor(red: 197.0 / 255.0, green: 219.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0).cgColor
            tableViewHeaderFooterView?.textLabel?.textAlignment = .left
            tableViewHeaderFooterView?.textLabel?.layer.borderWidth = 2.0
            tableViewHeaderFooterView?.layoutMargins = UIEdgeInsetsMake(20, 0, 20, 0)
//            tableViewHeaderFooterView?.bounds = CGRectInset(view.frame, 10.0, 10.0);
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let strTitle: String = arrSectionTitle[section] as! String
        return strTitle
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle: String = arrSectionTitle[section] as! String
        let sectionAnimals = items[sectionTitle] as? [Any]
        return (sectionAnimals?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        
        let sectionTitle: String = arrSectionTitle[indexPath.section] as! String
        let sectionAnimals = items[sectionTitle] as? [Any]
        let animal = sectionAnimals?[indexPath.row] as? String
        
        cell.lblTitle?.text = animal
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let oneVC = self.storyboard?.instantiateViewController(withIdentifier: "OneViewController")
        let twoVC = self.storyboard?.instantiateViewController(withIdentifier: "TwoViewController")
        let threeVC = self.storyboard?.instantiateViewController(withIdentifier: "ThreeViewController")
        let fourVC = self.storyboard?.instantiateViewController(withIdentifier: "FourViewController")
        if indexPath.row == 0 {
            self.slideMenuController?.setMain(viewController: oneVC)
        }
        else if indexPath.row == 1{
            self.slideMenuController?.setMain(viewController: twoVC)
        }
        else if indexPath.row == 2{
            self.slideMenuController?.setMain(viewController: threeVC)
        }
        else if indexPath.row == 3{
            self.slideMenuController?.setMain(viewController: fourVC)
        }
    }
}
