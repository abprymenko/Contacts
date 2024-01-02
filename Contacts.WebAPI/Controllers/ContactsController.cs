namespace Contacts.WebAPI.Controllers
{
    #region Usings
    using Contacts.Contracts.BusinessObjects.DTO;
    using Contacts.Contracts.Managers.Builders;
    using Contacts.Contracts.Services.Repositories;
    using Dapper;
    using Microsoft.AspNetCore.Mvc;
    using System.Data;
    #endregion

    #region ContactsController
    [ApiController]
    public class ContactsController : ControllerBase
    {
        #region Private : Fields
        private readonly IRepository _repository;
        private readonly ISqlParameters _sqlParameters;
        #endregion

        #region Public : Constructor
        public ContactsController(IRepository repository, ISqlParameters sqlParameters)
        {
            _repository = repository;
            _sqlParameters = sqlParameters;
        }
        #endregion

        #region Api methods
        [HttpGet]
        [Route("get-contacts")]
        public async Task<IActionResult> GetContacts()
        {
            try
            {
                var contacts = await _repository.QueryAsync<IContact>("[dbo].[GetContacts]");
                return contacts.Any()
                            ? Ok(contacts)
                            : Ok("No contacts found");
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpGet]
        [Route("get-contact-by-id")]
        public async Task<IActionResult> GetContactById(Guid contactId)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@id", contactId, DbType.Guid, ParameterDirection.Input);
                var contacts = await _repository.QueryAsync<IContact>("[dbo].[GetContactById]", param);
                return !contacts.Any()
                            ? NotFound()
                            : Ok(contacts.FirstOrDefault());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        [Route("post-contact")]
        public async Task<IActionResult> PostContact(IContact contact)
        {
            try
            {
                var param = _sqlParameters.GetContactParameters(contact, false);
                await _repository.ExecuteAsync("[dbo].[InsertContact]", param);
                contact.Id = param.Get<Guid>("@insertedId");
                return contact.Id.Equals(Guid.Empty)
                            ? Conflict("Failed to insert contact!")
                            : new CreatedAtActionResult(nameof(GetContactById), "Contacts", new { contactId = contact.Id }, contact);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPut]
        [Route("put-contact")]
        public async Task<IActionResult> PutContact(IContact contact)
        {
            try
            {
                var param = _sqlParameters.GetContactParameters(contact);
                await _repository.ExecuteAsync("[dbo].[UpdateContact]", param);
                contact.Id = param.Get<Guid>("@updatedId");
                return contact.Id.Equals(Guid.Empty)
                            ? Conflict($"Failed to update contact!")
                            : new CreatedAtActionResult(nameof(GetContactById), "Contacts", new { contactId = contact.Id }, contact);
            }
            catch (Exception)
            {
                throw;
            }

        }
        [HttpDelete]
        [Route("delete-contact")]
        public async Task<IActionResult> DeleteContact(Guid contactId)
        {
            try
            {
                var param = new DynamicParameters();
                param.Add("@id", contactId, DbType.Guid, ParameterDirection.Input);
                param.Add("@rowcount", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await _repository.ExecuteAsync("[dbo].[DeleteContact]", param);
                var count =  param.Get<int>("@rowcount");
                return count < 1 
                            ? NotFound("No contact found for deletion!")
                            : NoContent();
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
    }
    #endregion
}