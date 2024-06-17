using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace WebhooksBCTechDays
{
    public class WebhookBCTechDays
    {
        private readonly ILogger<WebhookBCTechDays> _logger;

        public WebhookBCTechDays(ILogger<WebhookBCTechDays> logger)
        {
            _logger = logger;
        }

        [Function("WebhookBCTechDays")]
        public async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Function, "get", "post")] HttpRequest req)
        {
            string? validationToken = req.Query["validationToken"];

            if (!string.IsNullOrEmpty(validationToken))
            {
                _logger.LogInformation("Subscription request with validation token: " + validationToken);
                return new OkObjectResult(validationToken);
            }

            StreamReader streamReader = new StreamReader(req.Body);
            string body = await streamReader.ReadToEndAsync();


            _logger.LogInformation("Webhook notified: " + body);
            return new OkObjectResult(body);
        }
    }
}
