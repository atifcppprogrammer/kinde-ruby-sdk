# Kinde Ruby SDK 

The Kinde Ruby SDK gem allows developers to integrate Kinde API into any ruby-based applications, Rails or non-Rails.
The gem contains all the related oauth2 authorization, so you need only to integrate it properly.
The gem contains 3 pre-built OAuth flows: **client credentials**, **authorization code** and **authorization code with PKCE code verifier**.

## Register for Kinde

If you haven’t already got a Kinde account, register for free [here](http://app.kinde.com/register) (no credit card required).

You need a Kinde domain to get started, e.g. yourapp.kinde.com.

## Installation

Add this line into your Gemfile and run bundler:
```
gem 'kinde_api', git: 'https://github.com/kinde-oss/kinde-ruby-sdk.git', branch: 'main'
```
or install manually through gem command.

## Getting started

### Kinde configuration

On the Kinde web app navigate to `Settings` in the left menu, then select `App keys` and find the `Callbacks` input field.

Here you want to put in the callback URLs for your application, which should look something like this:

- **Allowed callback URLs** - `http://localhost:3000/api/auth/kinde_callback`
- **Allowed logout redirect URLs** - `http://localhost:3000`

Make sure you press the Save button at the bottom of the page!

_Note_: The `http://localhost:3000` is used as an example of local address, don't forget to add all the required addresses that you are going to use in any environments.

### Environments

If you would like to use our Environments feature as part of your development process. You will need to create them first within your Kinde account, see the guide here. 
In this case you would use the Environment subdomain in the code block above.

### Configuring your app

In a basic scenario it requires several steps to be made:
1. proper configuring of client credentials and domain
2. external service authorization
3. callback processing
4. bearer token receiving
5. Usage

#### Integration
The gem contains simple configurator which you can use whenever you want. For example, in a typical Rails-app it can be
configured through initializer file:

```ruby
# domain, client_id/secret and callback defined somewhere in your settings

KindeApi.configure do |c|
 c.domain = domain
 c.client_id = client_id
 c.client_secret = client_secret
 c.callback_url = callback_url
 c.logout_url = logout_url
 # c.scope = 'openid offline email profile' # default value
 # c.pkce_enabled = true                    # default value
 # c.authorize_url = '/oauth2/auth'         # default value
 # c.token_url = '/oauth2/token'            # default value
 # c.debugging = false                      # default value
 # c.business_name = nil                    # default value
 c.logger = Rails.logger
end
```
Snippet above contains all the possible configuration values.
Here is detailed explanation on them:

- `Domain` refers to your organization - for example, `your-biz.kinde.com`.
- `Client id` and `Client secret` can be fetched from your Kinde application credentials in a setting section.
- `Callback url` refers to your callback processing controller action. Remember that 
the url must be defined in allowed callback urls of your kinde organization's [application config](#Kinde-configuration).
- `Logout url` will be triggered after successful logout on kinde. Same as callback url, it should be 
defined in allowed logout urls of your kinde organization's application config
- `Scope` is an oauth special parameter which is used to limit some rights. Probably, you don't need to change in.
- `PKCE enabled` is a flag that can turn off PKCE auth flow. By default it is activated to improve your security.
- `Authorize url` and `Token url` are paths to oauth2 methods in kinde. You don't need to change it.
- `Debugging` set to true start writing verbose request logs. Might be useful while developing your application.
- `Business name` is a parameter which is used in requests building. By default it is extracted from your
`domain` endpoint. For example, if your domain is `your-biz.kinde.com`, then business name will be set to`your-biz`.
You don't need to change it in general.
- `Logger` might be set to any kind of loggers you are using. By default it is set to `Rails.logger` if gem is used in
rails application or `Logger.new(STDOUT)` if it is not a rails app.

These variables can be handled with any system you want: .env files, settings.yml or any type of config files.
For example, .env file (you can name variables by yourself):
```
KINDE_DOMAIN=https://example.kinde.com
KINDE_CLIENT_ID=qwe
KINDE_CLIENT_SECRET=wert
KINDE_CALLBACK_URL=http://localhost:3000/callback
KINDE_LOGOUT_URL=http://localhost:3000/logout_callback
```

can be used as:
```ruby
KindeApi.configure do |c|
 c.domain = ENV['KINDE_DOMAIN']
 c.client_id = ENV['KINDE_CLIENT_ID']
 # ....
end
```

#### Login / Register
The next step is to authorize you in the Kinde.
For this, you need to acquire auth url by calling:
```ruby
KindeApi.auth_url
# => 
{
 url: "https://<domain>/oauth2/auth?client_id=<client_id>&code_challenge=<generated code>&code_challenge_method=S256&redirect_uri=<redirect_uri>&response_type=code&scope=openid+offline+email+profile&state=<random string>",
 code_verifier: "<challenge verifier>"
}
```
By default, gem uses PKCE verification flow - this means that in your auth url will be added special `code challenge` 
param and the method returns verification string for the code, which should be used later in token acquiring request.
You are free to disable PKCE by setting `pkce_enabled` to false in your configuration. 
In this case, `KindeApi.auth_url` will return only url itself:
```ruby
KindeApi.auth_url
# => {url: ......}
```
If you are about to use PCKE, our recommendation to save code verifier output somewhere near your later tokens output.

You can put the link right in your web-application page or you can use it under the hood through redirection.
After visiting the link you'll be redirected to Kinde's sign in/sign up form.
And after authorizing in Kinde, you'll be redirected to callback url.

#### Handle redirect
Next step is to extract code from the callback redirection. Your callback endpoint should contain logic to call exchange method.
Callback will be triggered with body, where will be code present. You are free to use the whole `params` object or to extract code from `params["code"]`.

Next, it needs to be exchanged for the access and refresh tokens.
`code` is the parameter which received in the callback endpoint, `code_verifier` (if PKCE enabled) should be used from previous step:  
```ruby
KindeApi.fetch_tokens(code, code_verifier)
# => 
{"access_token"=>"eyJhbGciOiJSUzI1NiIsIm...",                                
 "expires_in"=>86399,                             
 "id_token"=>"eyJhbGciOiJSUz",
 "refresh_token"=>"eyJhbGciOiJSUz",
 "scope"=>"openid offline email profile",                               
 "token_type"=>"bearer"}
```

This is your tokens - save the whole hash in your session, redis or any other storage and use it to build your client:
```ruby
# In case of preventing cookie overflow, you need to limit what exactly your are saving.
# Here is the required minimum of params. But in general you are able save it wherever you want to. 
# For example, in database, without any limiting.
session[:kinde_auth] = KindeApi.fetch_tokens(code).slice(:access_token, :refresh_token, :expires_at)
# ...
client = KindeApi.client(session[:kinde_auth]["access_token"]) # => #<KindeApi::Client:0x00007faf31e5ecb8> 
```

#### Token expiration and refreshing
For proper refreshing you'll need to use `access_token`, `refresh_token` and probably `expires_in` if you want to know is your access token still actual.
Use these two methods to work with refreshing:
```ruby
KindeApi.token_expired?(session[:kinde_auth]) # => false
KindeApi.refresh_token(session[:kinde_auth]) # => {"access_token" => "qwe...", "refresh_token" => "fqw...", .....}
```
`KindeApi#refresh_token` returns new token hash, so it needs to be updated in your storage.

#### Client usage
SDK part for API usage is mounted in the `KindeApi::Client` instance, so the short usage is just simple as:
```ruby
client.oauth.get_user
client.users.create_user(args)
client.organizations.get_orgainzations
```
The method name will be the same as API module from sdk without `-Api` part in the end.
Alternatively, you can initialize each API module by yourself:
```ruby
# use initialized and configured api client
api_client = KindeApi.api_client(access_token)
instance_client = KindeSdk::UsersApi.new(api_client)
instance_client.create_user(args)
```

#### Logout
For logout you need to call:
```ruby
instance_client.logout
# or
KindeApi.logout(access_token)
```
then clear your session or storage (delete your token) and redirect wherever you want to.
If you configured logout redirect url correct (e.g. added in the admin panel allowed logout redirect), you can receive 
a logout callback. Use it if it needs to perform some clean-ups or any other jobs.


### API reference
Detailed API reference described in [KindeSDK README](kinde-sdk/README.md) and underlying description docs.
Here are some selected examples of usage.

#### Getting user info

```ruby
KindeApi.client(session[:kinde_auth]["access_token"]).oauth.get_user
# => {id: ..., preferred_email: ..., provided_id: ..., last_name: ..., first_name: ...}
```

#### Handling with organizations
This is a part of management API. It should be configured first at your Kinde account
[Here is detailed note about it](https://kinde.notion.site/Management-API-via-client_credentials-240e6fa548c144828d4981ddbaa0f6b2),
you need to add `Machine to Machine` (M2M) application and use another grant type for authorization:
```ruby
result = KindeApi.client_credentials_access(
  client_id: ENV["KINDE_MANAGEMENT_CLIENT_ID"],
  client_secret: ENV["KINDE_MANAGEMENT_CLIENT_SECRET"]
)
# as an example of usage redis to save access token:
$redis.set("kinde_m2m_token", result["access_token"], ex: result["expires_in"].to_i)

# .......

client = KindeApi.client($redis.get("kinde_m2m_token"))
# get organizations list:
client.organizations.get_orgainzations
# => {"code": "OK", "message": "Success", "next_token": "qweqweqwe", "organizations": [{"code": "org_casda123c", "name": "Default Organization", "is_default": true}]}

# create new organization:
client.organizations.create_organization(create_organization_request: KindeSdk::CreateOrganizationRequest.new(name: new_org_name))
```
