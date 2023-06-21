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

# Unit tests for KindeApi::OrganizationsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'OrganizationsApi' do
  before do
    # run before each test
    @api_instance = KindeApi::OrganizationsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of OrganizationsApi' do
    it 'should create an instance of OrganizationsApi' do
      expect(@api_instance).to be_instance_of(KindeApi::OrganizationsApi)
    end
  end

  # unit tests for add_organization_users
  # Add Organization Users
  # Add existing users to an organization.
  # @param org_code The organization&#39;s code.
  # @param [Hash] opts the optional parameters
  # @option opts [AddOrganizationUsersRequest] :add_organization_users_request 
  # @return [AddOrganizationUsersResponse]
  describe 'add_organization_users test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_organization
  # Create Organization
  # Create an organization.
  # @param [Hash] opts the optional parameters
  # @option opts [CreateOrganizationRequest] :create_organization_request Organization details.
  # @return [CreateOrganizationResponse]
  describe 'create_organization test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_organization_user_role
  # Add Organization User Role
  # Add role to an organization user.
  # @param org_code The organization&#39;s code.
  # @param user_id The user&#39;s id.
  # @param create_organization_user_role_request Role details.
  # @param [Hash] opts the optional parameters
  # @return [SuccessResponse]
  describe 'create_organization_user_role test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_organization_feature_flag_override
  # Delete organization feature flag override
  # Delete organization feature flag override.
  # @param org_code The identifier for the organization.
  # @param feature_flag_key The identifier for the feature flag.
  # @param [Hash] opts the optional parameters
  # @return [SuccessResponse]
  describe 'delete_organization_feature_flag_override test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_organization_feature_flag_overrides
  # Delete all organization feature flag overrides
  # Delete all organization feature flag overrides.
  # @param org_code The identifier for the organization.
  # @param [Hash] opts the optional parameters
  # @return [SuccessResponse]
  describe 'delete_organization_feature_flag_overrides test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_organization_user_role
  # Delete Organization User Role
  # Delete role for an organization user.
  # @param org_code The organization&#39;s code.
  # @param user_id The user&#39;s id.
  # @param role_id The role id.
  # @param [Hash] opts the optional parameters
  # @return [SuccessResponse]
  describe 'delete_organization_user_role test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_organization
  # Get Organization
  # Gets an organization given the organization&#39;s code. 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :code The organization&#39;s code.
  # @return [Organization]
  describe 'get_organization test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_organization_feature_flags
  # List organization feature flags
  # Get all organization feature flags.
  # @param org_code The identifier for the organization.
  # @param [Hash] opts the optional parameters
  # @return [GetOrganizationFeatureFlagsResponse]
  describe 'get_organization_feature_flags test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_organization_user_roles
  # List Organization User Roles
  # Get roles for an organization user.
  # @param org_code The organization&#39;s code.
  # @param user_id The user&#39;s id.
  # @param [Hash] opts the optional parameters
  # @return [GetOrganizationsUserRolesResponse]
  describe 'get_organization_user_roles test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_organization_users
  # List Organization Users
  # Get users in an organization.
  # @param org_code The organization&#39;s code.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :sort Field and order to sort the result by.
  # @option opts [Integer] :page_size Number of results per page. Defaults to 10 if parameter not sent.
  # @option opts [String] :next_token A string to get the next page of results if there are more results.
  # @option opts [String] :permissions Filter by user permissions
  # @return [GetOrganizationsUsersResponse]
  describe 'get_organization_users test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_organizations
  # List Organizations
  # Get a list of organizations. 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :sort Field and order to sort the result by.
  # @option opts [Integer] :page_size Number of results per page. Defaults to 10 if parameter not sent.
  # @option opts [String] :next_token A string to get the next page of results if there are more results.
  # @return [GetOrganizationsResponse]
  describe 'get_organizations test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for remove_organization_user
  # Remove Organization User
  # Remove user from an organization.
  # @param org_code The organization&#39;s code.
  # @param user_id The user&#39;s id.
  # @param [Hash] opts the optional parameters
  # @return [SuccessResponse]
  describe 'remove_organization_user test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_organization
  # Update Organization
  # Update an organization.
  # @param org_code The identifier for the organization.
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateOrganizationRequest] :update_organization_request Organization details.
  # @return [nil]
  describe 'update_organization test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_organization_feature_flag_override
  # Update organization feature flag override
  # Update organization feature flag override.
  # @param org_code The identifier for the organization
  # @param feature_flag_key The identifier for the feature flag
  # @param value Override value
  # @param [Hash] opts the optional parameters
  # @return [SuccessResponse]
  describe 'update_organization_feature_flag_override test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_organization_users
  # Update organization users
  # Update users that belong to an organization.
  # @param org_code The organization&#39;s code.
  # @param [Hash] opts the optional parameters
  # @option opts [UpdateOrganizationUsersRequest] :update_organization_users_request 
  # @return [UpdateOrganizationUsersResponse]
  describe 'update_organization_users test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
