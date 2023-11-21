=begin
#Kinde Management API

#Provides endpoints to manage your Kinde Businesses

The version of the OpenAPI document: 1
Contact: support@kinde.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.4.0

=end

require 'spec_helper'
require 'json'

# Unit tests for KindeApi::SubscribersApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'SubscribersApi' do
  before do
    # run before each test
    @api_instance = KindeApi::SubscribersApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SubscribersApi' do
    it 'should create an instance of SubscribersApi' do
      expect(@api_instance).to be_instance_of(KindeApi::SubscribersApi)
    end
  end

  # unit tests for create_subscriber
  # Create Subscriber
  # Create subscriber.
  # @param first_name Subscriber&#39;s first name.
  # @param last_name Subscriber&#39;s last name.
  # @param email The email address of the subscriber.
  # @param [Hash] opts the optional parameters
  # @return [CreateSubscriberSuccessResponse]
  describe 'create_subscriber test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscriber
  # Get Subscriber
  # Retrieve a subscriber record. 
  # @param subscriber_id The subscriber&#39;s id.
  # @param [Hash] opts the optional parameters
  # @return [GetSubscriberResponse]
  describe 'get_subscriber test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_subscribers
  # List Subscribers
  # The returned list can be sorted by full name or email address in ascending or descending order. The number of records to return at a time can also be controlled using the &#x60;page_size&#x60; query string parameter. 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :sort Field and order to sort the result by.
  # @option opts [Integer] :page_size Number of results per page. Defaults to 10 if parameter not sent.
  # @option opts [String] :next_token A string to get the next page of results if there are more results.
  # @return [GetSubscribersResponse]
  describe 'get_subscribers test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end