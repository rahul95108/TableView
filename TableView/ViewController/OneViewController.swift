
import UIKit

class OneViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txtName:UITextField!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtPhone:UITextField!
    
    @IBOutlet weak var txtAddress:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTextView()
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
    
    // MARK: - UITextField Delegate Method -
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - UITextview Delegate Method -
    
    func setTextView(){
        txtAddress.layer.cornerRadius = 5.0
        txtAddress.layer.borderWidth = 0.5
        txtAddress.layer.borderColor = UIColor.lightGray.cgColor
        
        txtAddress.text = "Address"
        txtAddress.textColor = UIColor.lightGray
    }
    
    private func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    private func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Address"
            textView.textColor = UIColor.lightGray
        }
    }
}
