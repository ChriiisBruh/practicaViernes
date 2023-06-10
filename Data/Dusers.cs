using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using practicabackend.Connection;
using practicabackend.Models;
using System.Data;
using System.Data.SqlClient;
using System.Xml;

namespace practicabackend.Data
{
    public class Dusers
    {
        ConnectionDB cn = new ConnectionDB();

        public async Task<string> GetUsersWithReserves()
        {
            using (var sql = new SqlConnection(cn.stringSQL()))
            {
                using (var cmd = new SqlCommand("GetUsersWithReservessss", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            var result = reader[0].ToString();
                            var formattedResult = FormatJson(result);
                            return formattedResult;
                        }
                    }
                }
            }
            return string.Empty;
        }

        public async Task<string> GetBooksAndReserves()
        {
            using (var sql = new SqlConnection(cn.stringSQL()))
            {
                using (var cmd = new SqlCommand("GetBooksAndReserves", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            var result = reader[0].ToString();
                            var formattedResult = FormatJson(result);
                            return formattedResult;
                        }
                    }
                }
            }
            return string.Empty;
        }

        private string FormatJson(string json)
        {
            if (string.IsNullOrEmpty(json))
                return string.Empty;

            try
            {
                var jToken = JToken.Parse(json);
                return jToken.ToString(Newtonsoft.Json.Formatting.Indented);
            }
            catch (JsonReaderException)
            {
                return json;
            }
        }

    }
}
