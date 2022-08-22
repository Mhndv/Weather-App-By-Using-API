//
//  ViewController.swift
//  Learning API
//
//  Created by Mohanned Alsahaf on 22/01/1444 AH.
//

import UIKit
import Alamofire

struct Comment:Decodable {
    var postId:Int
    var email:String
    var name:String
    var body:String
}

struct Cat:Decodable{
   var message:String
    
}
class ViewController: UIViewController {
    
    
    @IBOutlet weak var TableViewTodo: UITableView!
    var arr:[Comment] = []
    var todosArray:[Cat] = []
    var params = ["id":"108410","appid":"44f30cb3840ddffb8c4dbe379884957a"] as [String : String]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewTodo.dataSource = self
//        AF.request("https://jsonplaceholder.typicode.com/comments").responseDecodable(of:[Comment].self) { respsone in
//            guard let comments = respsone.value else {return}
//            self.arr = comments
//            print(self.arr[2].email)
//            self.TableViewTodo.reloadData()
//        }
//
//
//
        
        
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { res in
            print(res.value)
        }
        
        
        
//        AF.request("https://catfact.ninja/fact").responseDecodable(of:[Cat].self) { res in//عشان بيرجع قيم كثير
//
//            guard let todos = res.value else {return}
//            self.todosArray = todos
//            self.TableViewTodo.reloadData()
//        }
//        let params = ["title" : "My first todo"]
//        AF.request("https://jsonplaceholder.typicode.com/posts", method: .post, parameters: params, encoder: JSONParameterEncoder.default).responseJSON { respons in
//            print(respons.value)
//        }
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arr[indexPath.row].email
      
//        cell.textLabel?.text = String(todosArray[indexPath.row].id)
        
        return cell
    }
    
    
    
    
}
