namespace Contacts.WebAPI.Controllers
{
    #region Usings
    using Contacts.Contracts.BusinessObjects.DTO;
    using Contacts.Contracts.Providing;
    using Dapper;
    using Microsoft.AspNetCore.Mvc;
    using Newtonsoft.Json.Linq;
    using System.Data;
    #endregion

    #region ContactsController
    [ApiController]
    public class ContactsController : ControllerBase
    {
        #region Private : Fields
        private readonly IRepository _repository;
        #endregion

        #region Public : Constructor
        public ContactsController(IRepository repository)
        {
            _repository = repository;
        }
        #endregion

        #region Api methods
        [HttpGet]
        [Route("get-contacts")]
        public async Task<IEnumerable<IContact>> GetContacts()
        {
            try
            {
                return await _repository.QueryAsync<IContact>("[dbo].[GetContacts]");
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        [Route("post-contact")]
        public async Task<int> PostContact(JObject contact)
        {
            try
            {
                var param = GetParameters(contact, false);
                await _repository.ExecuteAsync("[dbo].[InsertContact]", param);
                return param.Get<int>("@rowcount");
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPut]
        [Route("put-contact")]
        public async Task<int> PutContact(JObject contact)
        {
            try
            {
                var param = GetParameters(contact);
                await _repository.ExecuteAsync("[dbo].[UpdateContact]", param);
                var count = param.Get<int>("@rowcount");
                if (count == 0)
                {
                    param = GetParameters(contact, false);
                    await _repository.ExecuteAsync("[dbo].[InsertContact]", param);
                    count = param.Get<int>("@rowcount");
                }
                return count;
            }
            catch (Exception)
            {
                throw;
            }

        }
        [HttpDelete]
        [Route("delete-contact")]
        public async Task<int> DeleteContact(Guid id)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@id", id, DbType.Guid, ParameterDirection.Input);
                param.Add("@rowcount", 0, DbType.Int32, ParameterDirection.Output);
                await _repository.ExecuteAsync("[dbo].[DeleteContact]", param);
                return param.Get<int>("@rowcount");
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region Private : Methods
        /// <summary>
        /// Gets DynamicParameters.
        /// </summary>
        /// <param name="contact">
        /// <example>
        /// <code>
        /// {
        ///     "id": "<see cref="Guid"/>",
        ///     "firstName": "<see cref="string"/>",
        ///     "lastName": "<see cref="string"/>",
        ///     "cellNumber": "<see cref="string"/>"
        /// }
        /// </code>
        /// </example>
        /// </param>
        /// <param name="isEdit"></param>
        /// <exception cref="ArgumentException"/>
        /// <returns><see cref="DynamicParameters"/></returns>
        private DynamicParameters GetParameters(JObject contact, bool isEdit = true)
        {
            try
            {
                var param = new DynamicParameters();
                if (isEdit)
                {
                    var isId = Guid.TryParse(contact["id"]?.Value<string>(), out Guid id);
                    if (!isId)
                        throw new ArgumentException(nameof(id));
                    param.Add("@id", id, DbType.Guid, ParameterDirection.Input);
                }
                param.Add("@firstname", contact["firstName"]?.Value<string>(), DbType.String, ParameterDirection.Input);
                param.Add("@lastname", contact["lastName"]?.Value<string>(), DbType.String, ParameterDirection.Input);
                param.Add("@cellnumber", contact["cellNumber"]?.Value<string>(), DbType.String, ParameterDirection.Input);
                param.Add("@rowcount", 0, DbType.Int32, ParameterDirection.Output);
                return param;
            }
            catch (ArgumentException)
            {
                throw;
            }
        }
        #endregion
    }
    #endregion
}