# frozen_string_literal: true

require_relative "http"

module OrbitMembers
  class Request
    attr_reader :api_key, :workspace_id, :user_agent, :action, :body, :filters, :member_id

    def initialize(params = {})
      @action = params.fetch(:action)
      @api_key = params.fetch(:api_key)
      @workspace_id = params.fetch(:workspace_id)
      @user_agent = params.fetch(:user_agent, "ruby-orbit-members/#{OrbitMembers::VERSION}")
      @body = params.fetch(:body, nil)
      @filters = params.fetch(:filters, nil)
      @member_id = params.fetch(:member_id, nil)
      @activity_id = params.fetch(:activity_id, nil)

      after_initialize!
    end

    def after_initialize!
      case @action
      when "create_member"
        create_member
      when "get_member"
        get_member
      when "list_members"
        list_members
      when "add_identity"
        add_identity
      when "remove_identity"
        remove_identity
      when "update_member"
        update_member
      when "delete_member"
        delete_member
      when "find_member_by_identity"
        find_member_by_identity
      else
        raise ArgumentError,
              "Activity type is unrecognized. Must be one of: create_member, update_member, get_member, list_members, add_identity, remove_identity, update_member, delete_member, find_member_by_identity"
      end
    end

    def create_member
      OrbitMembers::HTTP.post(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members",
        user_agent: @user_agent,
        api_key: @api_key,
        body: @body
      )
    end

    def get_member
      OrbitMembers::HTTP.get(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members/#{@member_id}",
        user_agent: @user_agent,
        api_key: @api_key
      )
    end

    def list_members
      OrbitMembers::HTTP.get(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members",
        user_agent: @user_agent,
        api_key: @api_key,
        filters: @filters
      )
    end

    def add_identity
      OrbitMembers::HTTP.post(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members/#{@member_id}/identities",
        user_agent: @user_agent,
        api_key: @api_key,
        body: @body
      )
    end

    def remove_identity
      OrbitMembers::HTTP.delete(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members/#{@member_id}/identities",
        user_agent: @user_agent,
        api_key: @api_key,
        body: @body
      )
    end

    def update_member
      OrbitMembers::HTTP.put(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members/#{@member_id}",
        user_agent: @user_agent,
        api_key: @api_key,
        body: @body
      )
    end

    def delete_member
      OrbitMembers::HTTP.delete(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members/#{@member_id}",
        user_agent: @user_agent,
        api_key: @api_key
      )
    end

    def find_member_by_identity
      OrbitMembers::HTTP.get(
        url: "https://app.orbit.love/api/v1/#{@workspace_id}/members/find",
        user_agent: @user_agent,
        api_key: @api_key,
        filters: @filters
      )
    end
  end
end
