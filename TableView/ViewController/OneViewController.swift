
import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate;
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UIButton Action Methods -
    
    @IBAction func btnMenu(_ sender: AnyObject){
        self.slideMenuController?.showLeft()
    }
    
    @IBAction func btnPush(_ sender: AnyObject){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OneSubViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
    }
}
