//  NewBookFormTVC.swift
//  FavoriteBooks
//  Created by Denis Azarkov on 9/25/23.

import UIKit

class NewBookFormTVC: UITableViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var authorField: UITextField!
    @IBOutlet var genreField: UITextField!
    @IBOutlet var lengthField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var newBook: Book?
    
    init?(coder: NSCoder, newBook: Book?) {
        self.newBook = newBook
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        self.newBook = nil
        super.init(coder: coder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    
    func updateView() {
        guard let unwrappedBook = newBook else {return}
        titleField.text = unwrappedBook.title
        authorField.text = unwrappedBook.author
        genreField.text = unwrappedBook.genre
        lengthField.text = unwrappedBook.length
    }

    
    @IBAction func pressedSaveButton(_ sender: UIButton) {
        //print("-before gard")
        guard let title = titleField.text, let author = authorField.text, let genre = genreField.text, let length = lengthField.text  else {return}
        guard title != "", author != "", genre != "", length != "" else {return}  // второй гард, тк получается можно создавать экземпляры с пустыми полями
        
        newBook = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: "manualUnwindSeg", sender: self)
    }
    
    
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        titleField.resignFirstResponder()
        authorField.resignFirstResponder()
        genreField.resignFirstResponder()
        lengthField.resignFirstResponder()
    }
    
  
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
