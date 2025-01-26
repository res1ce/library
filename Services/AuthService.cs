using Org.BouncyCastle.Crypto.Generators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using BCrypt.Net;
using Library.Models;
using Org.BouncyCastle.Crypto.Generators;

namespace Library.Services
{
    public static class AuthService
    {
        public static bool Register(string username, string password)
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);
                string query = "INSERT INTO Users (Username, PasswordHash, Role) VALUES (@Username, @PasswordHash, 'User')";
                int result = connection.Execute(query, new { Username = username, PasswordHash = hashedPassword });
                return result > 0;
            }
        }

        public static User Login(string username, string password)
        {
            using (var connection = Database.GetConnection())
            {
                connection.Open();
                string query = "SELECT * FROM Users WHERE Username = @Username";
                var user = connection.QuerySingleOrDefault<User>(query, new { Username = username });

                if (user != null && BCrypt.Net.BCrypt.Verify(password, user.PasswordHash))
                {
                    return user;
                }
                return null;
            }
        }
    }

}
