
import UIKit

class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPush(_ sender: AnyObject){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FourSubViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
