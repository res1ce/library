using Dapper;
using Library.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Services
{
    public static class BookService
    {
        // Получение списка всех книг
        public static List<Book> GetAvailableBooks()
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                string query = "SELECT * FROM Books WHERE IsAvailable = TRUE";
                return connection.Query<Book>(query).ToList();
            }
        }

        // Аренда книги
        public static bool RentBook(int bookId, int userId)
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                using (var transaction = connection.BeginTransaction())
                {
                    try
                    {
                        // Обновить статус книги
                        string updateBookQuery = "UPDATE Books SET IsAvailable = FALSE WHERE Id = @Id";
                        connection.Execute(updateBookQuery, new { Id = bookId }, transaction);

                        // Добавить запись о прокате
                        string insertRentalQuery = "INSERT INTO Rentals (UserId, BookId, RentalDate) VALUES (@UserId, @BookId, NOW())";
                        connection.Execute(insertRentalQuery, new { UserId = userId, BookId = bookId }, transaction);

                        transaction.Commit();
                        return true;
                    }
                    catch
                    {
                        transaction.Rollback();
                        return false;
                    }
                }
            }
        }

        // Добавление книги
        public static bool AddBook(string title, string author)
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                string query = "INSERT INTO Books (Title, Author, IsAvailable) VALUES (@Title, @Author, TRUE)";
                int result = connection.Execute(query, new { Title = title, Author = author });
                return result > 0;
            }
        }

        // Удаление книги
        public static bool DeleteBook(int bookId)
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                string query = "DELETE FROM Books WHERE Id = @Id";
                int result = connection.Execute(query, new { Id = bookId });
                return result > 0;
            }
        }

        // Получение списка арендованных книг
        public static List<(Rental, Book, User)> GetRentedBooks()
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                string query = @"
            SELECT r.*, b.*, u.*
            FROM Rentals r
            JOIN Books b ON r.BookId = b.Id
            JOIN Users u ON r.UserId = u.Id
            WHERE r.ReturnDate IS NULL";
                return connection.Query<Rental, Book, User, (Rental, Book, User)>(query,
                    (rental, book, user) => (rental, book, user)).ToList();
            }
        }

        public static bool UpdateBook(Book book)
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                var query = "UPDATE books SET title = @Title, author = @Author, isAvailable = @IsAvailable WHERE id = @Id";
                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Title", book.Title);
                    command.Parameters.AddWithValue("@Author", book.Author);
                    command.Parameters.AddWithValue("@IsAvailable", book.IsAvailable);
                    command.Parameters.AddWithValue("@Id", book.Id);

                    return command.ExecuteNonQuery() > 0;
                }
            }
        }

    }
}
