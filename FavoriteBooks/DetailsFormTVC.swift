//  DetailsFormTVC.swift
//  FavoriteBooks
//  Created by .b[u]mpagram on 9/25/23

import UIKit

class DetailsFormTVC: UITableViewController, UITextFieldDelegate {
    // бахнул сюда UITextFieldDelegate чтобы снимать через метод нажатия на Return для перехода к след. полю
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var authorField: UITextField!
    @IBOutlet var genreField: UITextField!
    @IBOutlet var lengthField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var allFields: [UITextField]!  // чтобы кода меньше было загнал в массив IB
    
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
        updateSaveButtonVisualState() // вызываем статус кнопки до проброса полей, ибо юзер ничего не менял ещё, по умолчанию сохранять нечего.
        updateView()
        allDelegate() // кастомный для экономии места
    }
    
    
    func updateView() {
        guard let unwrappedBook = newBook else {return}
        titleField.text = unwrappedBook.title
        authorField.text = unwrappedBook.author
        genreField.text = unwrappedBook.genre
        lengthField.text = unwrappedBook.length
    }

    
    @IBAction func pressedSaveButton(_ sender: UIButton) {
        guard let title = titleField.text, let author = authorField.text, let genre = genreField.text, let length = lengthField.text  else {return}
        guard title != "", author != "", genre != "", length != "" else {return}  // второй гард, тк получается можно создавать экземпляры с пустыми полями
        newBook = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: "saveButtonUnwind", sender: self)
    }
    
    @IBAction func pressedCloseAction(_ sender: UIButton) {
        for textField in allFields {
            textField.text = nil
        }
        performSegue(withIdentifier: "cancelUnwind", sender: self)
    }
    
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        for textField in allFields {
            textField.resignFirstResponder()
        }
    }
    
  
    @IBAction func anyTapForCheckSaveButton(_ sender: UITextField) {
        updateSaveButtonVisualState()
    }
    
    func updateSaveButtonVisualState() {
       guard let titleState = titleField.text,
             let authorState = authorField.text,
             let genreState = genreField.text,
             let lengthState = lengthField.text else {return}
                
        let result = (!titleState.isEmpty) && (!authorState.isEmpty) && (!genreState.isEmpty) && (!lengthState.isEmpty)
        saveButton.isEnabled = result //  true должно быть только в том 1 случае, когда все поля НЕ Empty
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.titleField : authorField.becomeFirstResponder()
        case self.authorField : genreField.becomeFirstResponder()
        case self.genreField : lengthField.becomeFirstResponder()
        default : print("got event: Return pressed")
        }
        return true
    }
    
    func allDelegate() {
        self.titleField.delegate = self
        self.authorField.delegate = self
        self.genreField.delegate = self
    }
    
    
    
} // TableViewController end
