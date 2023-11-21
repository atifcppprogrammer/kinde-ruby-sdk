=begin
#Kinde Management API

#Provides endpoints to manage your Kinde Businesses

The version of the OpenAPI document: 1
Contact: support@kinde.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.4.0

=end

require 'cgi'

module KindeApi
  class APIsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Add APIs
    # Add APIs. 
    # @param add_apis_request [AddAPIsRequest] API details.
    # @param [Hash] opts the optional parameters
    # @return [SuccessResponse]
    def add_apis(add_apis_request, opts = {})
      data, _status_code, _headers = add_apis_with_http_info(add_apis_request, opts)
      data
    end

    # Add APIs
    # Add APIs. 
    # @param add_apis_request [AddAPIsRequest] API details.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SuccessResponse, Integer, Hash)>] SuccessResponse data, response status code and response headers
    def add_apis_with_http_info(add_apis_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: APIsApi.add_apis ...'
      end
      # verify the required parameter 'add_apis_request' is set
      if @api_client.config.client_side_validation && add_apis_request.nil?
        fail ArgumentError, "Missing the required parameter 'add_apis_request' when calling APIsApi.add_apis"
      end
      # resource path
      local_var_path = '/api/v1/apis'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8', 'application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(add_apis_request)

      # return_type
      return_type = opts[:debug_return_type] || 'SuccessResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['kindeBearerAuth']

      new_options = opts.merge(
        :operation => :"APIsApi.add_apis",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: APIsApi#add_apis\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete API
    # Deletes API. 
    # @param api_id [String] The API&#39;s id.
    # @param [Hash] opts the optional parameters
    # @return [SuccessResponse]
    def delete_api(api_id, opts = {})
      data, _status_code, _headers = delete_api_with_http_info(api_id, opts)
      data
    end

    # Delete API
    # Deletes API. 
    # @param api_id [String] The API&#39;s id.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SuccessResponse, Integer, Hash)>] SuccessResponse data, response status code and response headers
    def delete_api_with_http_info(api_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: APIsApi.delete_api ...'
      end
      # verify the required parameter 'api_id' is set
      if @api_client.config.client_side_validation && api_id.nil?
        fail ArgumentError, "Missing the required parameter 'api_id' when calling APIsApi.delete_api"
      end
      # resource path
      local_var_path = '/api/v1/apis/{api_id}'.sub('{' + 'api_id' + '}', CGI.escape(api_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8', 'application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'SuccessResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['kindeBearerAuth']

      new_options = opts.merge(
        :operation => :"APIsApi.delete_api",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: APIsApi#delete_api\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List API details
    # Returns the details of the API. 
    # @param api_id [String] The API&#39;s id.
    # @param [Hash] opts the optional parameters
    # @return [Api]
    def get_api(api_id, opts = {})
      data, _status_code, _headers = get_api_with_http_info(api_id, opts)
      data
    end

    # List API details
    # Returns the details of the API. 
    # @param api_id [String] The API&#39;s id.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Api, Integer, Hash)>] Api data, response status code and response headers
    def get_api_with_http_info(api_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: APIsApi.get_api ...'
      end
      # verify the required parameter 'api_id' is set
      if @api_client.config.client_side_validation && api_id.nil?
        fail ArgumentError, "Missing the required parameter 'api_id' when calling APIsApi.get_api"
      end
      # resource path
      local_var_path = '/api/v1/apis/{api_id}'.sub('{' + 'api_id' + '}', CGI.escape(api_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8', 'application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Api'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['kindeBearerAuth']

      new_options = opts.merge(
        :operation => :"APIsApi.get_api",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: APIsApi#get_api\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List APIs
    # Returns a list of APIs. 
    # @param [Hash] opts the optional parameters
    # @return [Apis]
    def get_apis(opts = {})
      data, _status_code, _headers = get_apis_with_http_info(opts)
      data
    end

    # List APIs
    # Returns a list of APIs. 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Apis, Integer, Hash)>] Apis data, response status code and response headers
    def get_apis_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: APIsApi.get_apis ...'
      end
      # resource path
      local_var_path = '/api/v1/apis'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8', 'application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Apis'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['kindeBearerAuth']

      new_options = opts.merge(
        :operation => :"APIsApi.get_apis",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: APIsApi#get_apis\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update API Applications
    # Update the applications under that API. 
    # @param api_id [String] The identifier for the API.
    # @param update_api_applications_request [UpdateAPIApplicationsRequest] The applications you want to connect or disconnect.
    # @param [Hash] opts the optional parameters
    # @return [SuccessResponse]
    def update_api_applications(api_id, update_api_applications_request, opts = {})
      data, _status_code, _headers = update_api_applications_with_http_info(api_id, update_api_applications_request, opts)
      data
    end

    # Update API Applications
    # Update the applications under that API. 
    # @param api_id [String] The identifier for the API.
    # @param update_api_applications_request [UpdateAPIApplicationsRequest] The applications you want to connect or disconnect.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SuccessResponse, Integer, Hash)>] SuccessResponse data, response status code and response headers
    def update_api_applications_with_http_info(api_id, update_api_applications_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: APIsApi.update_api_applications ...'
      end
      # verify the required parameter 'api_id' is set
      if @api_client.config.client_side_validation && api_id.nil?
        fail ArgumentError, "Missing the required parameter 'api_id' when calling APIsApi.update_api_applications"
      end
      # verify the required parameter 'update_api_applications_request' is set
      if @api_client.config.client_side_validation && update_api_applications_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_api_applications_request' when calling APIsApi.update_api_applications"
      end
      # resource path
      local_var_path = '/api/v1/apis/{api_id}/applications'.sub('{' + 'api_id' + '}', CGI.escape(api_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json; charset=utf-8', 'application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(update_api_applications_request)

      # return_type
      return_type = opts[:debug_return_type] || 'SuccessResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['kindeBearerAuth']

      new_options = opts.merge(
        :operation => :"APIsApi.update_api_applications",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: APIsApi#update_api_applications\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end