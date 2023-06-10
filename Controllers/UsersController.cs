using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using practicabackend.Data;
using practicabackend.Models;

namespace practicabackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController
    {
        
        [HttpGet("usersReserves")]
        public async Task<ActionResult<string>> GetUsersWithReserves()
        {
            var function = new Dusers();
            var result = await function.GetUsersWithReserves();
            return result;
        }

        [HttpGet("booksReserves")]
        public async Task<ActionResult<string>> GetBooksWithReserves()
        {
            var function = new Dusers();
            var result = await function.GetBooksAndReserves();
            return result;
        }
    }

}
