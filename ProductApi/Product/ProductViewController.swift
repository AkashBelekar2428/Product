//
//  ProductViewController.swift
//  ProductApi
//
//  Created by Akash Belekar on 16/03/23.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SDWebImage

class ProductViewController: UIViewController {
    @IBOutlet weak var productTbl:UITableView!
    
    var productModel:[ProductResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        productTbl.register(UINib(nibName: "ProductTVC", bundle: nil), forCellReuseIdentifier: "ProductTVC")
        productTbl.dataSource = self
        productTbl.delegate = self
        
        //getProductApi()
        loadLocalData()
    }
    func loadLocalData(){
        
        if let file = Bundle.main.url(forResource: "Product", withExtension: "json")
        {
            let data = try? Data(contentsOf: file)
            let bodyString = String.init(data: data!, encoding: String.Encoding.utf8)!
            let listResp = Mapper<productResponseData>().map(JSONString: bodyString)
            self.productModel = (listResp?.product)!
            DispatchQueue.main.async {
                self.productTbl.reloadData()
            }
        }
        
        
        
        
    }
    private func getProductApi(){
        let url = "https://dummyjson.com/products"
        Alamofire.request(url).responseJSON { response in
            print("response",response)
            switch response.result{
            case .success(_):
                if let result = response.result.value{
                    print("result",result)
                    
                    let jSON = result as! NSDictionary
                    print("jSON",jSON)
                    
                    let str = String.init(data: response.data!, encoding: String.Encoding.utf8)!
                    print("str",str)
                    
                    let objData = Mapper<productResponseData>().map(JSONString: str)
                    print("objData",objData!.toJSON())
                    
                    self.productModel = (objData?.product)!
                    DispatchQueue.main.async {
                        self.productTbl.reloadData()
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
        
    }
}

extension ProductViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVC", for: indexPath) as! ProductTVC
        cell.titleLbl.text = productModel[indexPath.row].title ?? ""
        cell.descriptionLbl.text = productModel[indexPath.row].description ?? ""
        cell.priceLbl.text = "Price: \(String(productModel[indexPath.row].price ?? 0.0))"
        cell.ratingLbl.text = "Rate: \(String(productModel[indexPath.row].rating ?? 0.0))"
        cell.stockLbl.text = "In Stock: \(String(productModel[indexPath.row].stock ?? 0))"
        cell.brandLBl.text = "Brand: \(productModel[indexPath.row].brand ?? "")"
        cell.categoriLbl.text = "Categori: \(productModel[indexPath.row].categori ?? "")"
        cell.productImg.sd_setImage(with: URL(string: "\(productModel[indexPath.row].thumbnail ?? "")"), placeholderImage: UIImage(systemName: "homekit"))
        
        return cell
    }
    
    
}
