import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = [
    Book(title: "Harry Potter", author: "Joan Roling", genre: "fantastic", length: "355")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)

        let book = books[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = book.title
        content.secondaryText = book.description
        cell.contentConfiguration = content

        return cell
    }

    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        print("start prepareForUnwind")
        guard let source = segue.source as? NewBookFormTVC,
              let book = source.newBook else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            books.remove(at: indexPath.row)
            books.insert(book, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            books.append(book)
            print("after books array append")
            print(books)
            print("-force table reload-")
            tableView.reloadData() // строка в этом месте оперативно обновляет экраны
        }
    }
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> NewBookFormTVC? {
        let elementToEdit: Book?
        
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
         elementToEdit = books[indexPath.row]
        return NewBookFormTVC(coder: coder, newBook: elementToEdit)
    }
    
  
    
    
    
} // ViewController end
