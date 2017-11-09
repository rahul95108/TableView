
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SlideMenuController

class LoginViewController: UIViewController{
    
    // MARK: - UIView Life Cycle Methods -

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "abc"
        if !str.isEmpty{
            print("Yes")
        }
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as! UIGestureRecognizerDelegate Date;
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnSubmit(_ sender: AnyObject){
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        
        let vc = SlideMenuController(mainViewController: mainVC!, leftViewController: menuVC!, rightViewController: nil)
        vc.allowedRightSwipe = false
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
    }
    
    @IBAction func btnFB(_ sender: AnyObject){
        let login = FBSDKLoginManager()
        login.loginBehavior = FBSDKLoginBehavior.systemAccount
        login.logIn(withReadPermissions: ["public_profile", "email"], from: self, handler: {(result, error) in
            if error != nil {
            }
            else if (result?.isCancelled)! {
            }
            else {
                FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "first_name, last_name, picture.type(large), email, name, id, gender"]).start(completionHandler: {(connection, result, error) -> Void in
                    if error != nil{
                    }
                    else{
                        let data:[NSString:AnyObject] = result as! [NSString : AnyObject]
                        let dict: NSDictionary = data as NSDictionary
                        print(dict.value(forKey: "name")!)
                    }
                })
            }
        })
    }
    
    @IBAction func btnGplus(_ sender: AnyObject){
        
    }
}
