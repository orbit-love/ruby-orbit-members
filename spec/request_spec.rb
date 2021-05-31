require "spec_helper"

RSpec.describe OrbitMembers::Request do
    describe "request" do
        context "for a new member" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "create_member",
                    body: {
                        member: {
                            name: "Jean-Luc Picard",
                            github: "picard",
                            twitter: "picard"
                        }
                    }.to_json
                )
            end

            before(:each) do
                stub_request(:post, "https://app.orbit.love/api/v1/1234/members")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Content-Type' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' },
                body: "{\"member\":{\"name\":\"Jean-Luc Picard\",\"github\":\"picard\",\"twitter\":\"picard\"}}"
                )
                .to_return(
                    status: 200,
                    body: {
                        response: {
                            code: 'SUCCESS'
                        }
                    }.to_json.to_s,
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a HTTP 200 status for a successful request" do
                response = subject.create_member
    
                expect(response["response"]["code"]).to eq("SUCCESS")
            end
        end

        context "for listing members with filters" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "list_members",
                    filters: {
                        identity: "github"
                    }
                )
            end

            before(:each) do
                stub_request(:get, "https://app.orbit.love/api/v1/1234/members?identity=github")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Accept' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' }
                )
                .to_return(
                    status: 200,
                    body: {
                        data: [
                            {
                                id: "6",
                                type: "member",
                                attributes: {
                                    activities_count: 1,
                                    avatar_url: "http://github.com/avatar.png",
                                    bio: nil,
                                    birthday: nil,
                                    company: nil,
                                    created_at: "2021-04-01T16:03:02.052Z",
                                    deleted_at: nil,
                                    first_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    id: "6",
                                    last_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    location: nil,
                                    name: "Picard",
                                    orbit_level: "3",
                                    pronouns: nil,
                                    reach: 0,
                                    shipping_address: nil,
                                    slug: "picard",
                                    source: "installation",
                                    tag_list: "[\"spec-tag-1\"]",
                                    tags: "[\"spec-tag-1\"]",
                                    teammate: false,
                                    tshirt: nil,
                                    updated_at: "2021-04-01T16:03:02.052Z",
                                    merged_at: nil,
                                    url: nil,
                                    orbit_url: "http://localhost:3000/germaineoberbrunner/members/picard",
                                    created: false,
                                    love: "1",
                                    twitter: nil,
                                    github: "picard",
                                    discourse: nil,
                                    email: nil,
                                    devto: nil,
                                    linkedin: nil,
                                    github_followers: "4",
                                    twitter_followers: nil,
                                    topics: nil,
                                    languages: nil
                                },
                                relationships: {
                                    identities: {
                                        data: [
                                            {
                                                id: "15",
                                                type: "spec_identity"
                                            }
                                        ]
                                    }
                                }
                            }
                        ]
                    }.to_json.to_s,
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a successful response for a successful request" do
                response = subject.list_members
    
                expect(response["data"]).to be_truthy
            end
        end

        context "for listing members without filters" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "list_members"
                )
            end

            before(:each) do
                stub_request(:get, "https://app.orbit.love/api/v1/1234/members")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Accept' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' }
                )
                .to_return(
                    status: 200,
                    body: {
                        data: [
                            {
                                id: "6",
                                type: "member",
                                attributes: {
                                    activities_count: 1,
                                    avatar_url: "http://github.com/avatar.png",
                                    bio: nil,
                                    birthday: nil,
                                    company: nil,
                                    created_at: "2021-04-01T16:03:02.052Z",
                                    deleted_at: nil,
                                    first_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    id: "6",
                                    last_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    location: nil,
                                    name: "Picard",
                                    orbit_level: "3",
                                    pronouns: nil,
                                    reach: 0,
                                    shipping_address: nil,
                                    slug: "picard",
                                    source: "installation",
                                    tag_list: "[\"spec-tag-1\"]",
                                    tags: "[\"spec-tag-1\"]",
                                    teammate: false,
                                    tshirt: nil,
                                    updated_at: "2021-04-01T16:03:02.052Z",
                                    merged_at: nil,
                                    url: nil,
                                    orbit_url: "http://localhost:3000/germaineoberbrunner/members/picard",
                                    created: false,
                                    love: "1",
                                    twitter: nil,
                                    github: "picard",
                                    discourse: nil,
                                    email: nil,
                                    devto: nil,
                                    linkedin: nil,
                                    github_followers: "4",
                                    twitter_followers: nil,
                                    topics: nil,
                                    languages: nil
                                },
                                relationships: {
                                    identities: {
                                        data: [
                                            {
                                                id: "15",
                                                type: "spec_identity"
                                            }
                                        ]
                                    }
                                }
                            }
                        ]
                    }.to_json.to_s,
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a successful response for a successful request" do
                response = subject.list_members
    
                expect(response["data"]).to be_truthy
            end
        end

        context "for fetching a single activity" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "get_member",
                    member_id: "123"
                )
            end

            before(:each) do
                stub_request(:get, "https://app.orbit.love/api/v1/1234/members/123")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Accept' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' }
                )
                .to_return(
                    status: 200,
                    body: {
                        data: [
                            {
                                id: "6",
                                type: "member",
                                attributes: {
                                    activities_count: 1,
                                    avatar_url: "http://github.com/avatar.png",
                                    bio: nil,
                                    birthday: nil,
                                    company: nil,
                                    created_at: "2021-04-01T16:03:02.052Z",
                                    deleted_at: nil,
                                    first_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    id: "6",
                                    last_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    location: nil,
                                    name: "Picard",
                                    orbit_level: "3",
                                    pronouns: nil,
                                    reach: 0,
                                    shipping_address: nil,
                                    slug: "picard",
                                    source: "installation",
                                    tag_list: "[\"spec-tag-1\"]",
                                    tags: "[\"spec-tag-1\"]",
                                    teammate: false,
                                    tshirt: nil,
                                    updated_at: "2021-04-01T16:03:02.052Z",
                                    merged_at: nil,
                                    url: nil,
                                    orbit_url: "http://localhost:3000/germaineoberbrunner/members/picard",
                                    created: false,
                                    love: "1",
                                    twitter: nil,
                                    github: "picard",
                                    discourse: nil,
                                    email: nil,
                                    devto: nil,
                                    linkedin: nil,
                                    github_followers: "4",
                                    twitter_followers: nil,
                                    topics: nil,
                                    languages: nil
                                },
                                relationships: {
                                    identities: {
                                        data: [
                                            {
                                                id: "15",
                                                type: "spec_identity"
                                            }
                                        ]
                                    }
                                }
                            }
                        ]
                    }.to_json.to_s,
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a successful response for a successful request" do
                response = subject.get_member
    
                expect(response["data"]).to be_truthy
            end
        end

        context "for fetching members by identity" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "find_member_by_identity",
                    filters: {
                        source: "devto",
                        username: "picard"
                    }
                )
            end

            before(:each) do
                stub_request(:get, "https://app.orbit.love/api/v1/1234/members/find?source=devto&username=picard")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Accept' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' }
                )
                .to_return(
                    status: 200,
                    body: {
                        data: [
                            {
                                id: "6",
                                type: "member",
                                attributes: {
                                    activities_count: 1,
                                    avatar_url: "http://github.com/avatar.png",
                                    bio: nil,
                                    birthday: nil,
                                    company: nil,
                                    created_at: "2021-04-01T16:03:02.052Z",
                                    deleted_at: nil,
                                    first_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    id: "6",
                                    last_activity_occurred_at: "2021-04-01T16:03:02.052Z",
                                    location: nil,
                                    name: "Picard",
                                    orbit_level: "3",
                                    pronouns: nil,
                                    reach: 0,
                                    shipping_address: nil,
                                    slug: "picard",
                                    source: "installation",
                                    tag_list: "[\"spec-tag-1\"]",
                                    tags: "[\"spec-tag-1\"]",
                                    teammate: false,
                                    tshirt: nil,
                                    updated_at: "2021-04-01T16:03:02.052Z",
                                    merged_at: nil,
                                    url: nil,
                                    orbit_url: "http://localhost:3000/germaineoberbrunner/members/picard",
                                    created: false,
                                    love: "1",
                                    twitter: nil,
                                    github: "picard",
                                    discourse: nil,
                                    email: nil,
                                    devto: "picard",
                                    linkedin: nil,
                                    github_followers: "4",
                                    twitter_followers: nil,
                                    topics: nil,
                                    languages: nil
                                },
                                relationships: {
                                    identities: {
                                        data: [
                                            {
                                                id: "15",
                                                type: "devto"
                                            }
                                        ]
                                    }
                                }
                            }
                        ]
                    }.to_json.to_s,
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a successful response for a successful request" do
                response = subject.find_member_by_identity
    
                expect(response["data"]).to be_truthy
            end
        end

        context "for adding a new identity to a member" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "add_identity",
                    member_id: "123",
                    body: {
                        source: "linkedin",
                        name: "Jean-Luc Picard"
                    }.to_json
                )
            end

            before(:each) do
                stub_request(:post, "https://app.orbit.love/api/v1/1234/members/123/identities")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Content-Type' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' },
                body: "{\"source\":\"linkedin\",\"name\":\"Jean-Luc Picard\"}"
                )
                .to_return(
                    status: 200,
                    body: {
                        response: {
                            code: 'SUCCESS'
                        }
                    }.to_json.to_s,
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a HTTP 200 status for a successful create post request" do
                response = subject.add_identity
    
                expect(response["response"]["code"]).to eq("SUCCESS")
            end
    
            it "raises an exception if the API response cannot be parsed" do
                stub_request(:post, "https://app.orbit.love/api/v1/1234/members/123/identities")
                .with(
                  headers: { 'Authorization' => "Bearer 12345", 'Content-Type' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' },
                  body: "{\"source\":\"linkedin\",\"name\":\"Jean-Luc Picard\"}"
                )
                .to_return(
                    status: 500,
                    headers: {}
                )
    
                expect { subject.add_identity }.to raise_error(ArgumentError, "Expected confirmation from the Orbit API, but received nothing. Please check your logs and try again.")
            end
        end

        context "for removing an identity from a member" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "remove_identity",
                    member_id: "123",
                    body: {
                        source: "linkedin",
                        name: "Jean-Luc Picard"
                    }.to_json
                )
            end

            before(:each) do
                stub_request(:delete, "https://app.orbit.love/api/v1/1234/members/123/identities")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Accept' => '*/*', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' },
                body: "{\"source\":\"linkedin\",\"name\":\"Jean-Luc Picard\"}"
                )
                .to_return(
                    status: 204,
                    body: "",
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a successful response for a successful request" do
                response = subject.remove_identity

                expect(response).to eq("Deletion successful")
            end
        end

        context "for updating a member" do
            let(:subject) do
                OrbitMembers::Request.new(
                    api_key: "12345",
                    workspace_id: "1234",
                    user_agent: "community-ruby-starfleet-orbit/1.0",
                    action: "update_member",
                    member_id: "123",
                    body: {
                        company: "Starfleet"
                    }.to_json
                )
            end

            before(:each) do
                stub_request(:put, "https://app.orbit.love/api/v1/1234/members/123")
                .with(
                headers: { 'Authorization' => "Bearer 12345", 'Content-Type' => 'application/json', 'User-Agent'=>'community-ruby-starfleet-orbit/1.0' },
                body: "{\"company\":\"Starfleet\"}"
                )
                .to_return(
                    status: 200,
                    body: {
                        response: {
                            code: 'SUCCESS'
                        }
                    }.to_json.to_s,
                    headers: {}
                )
            end

            it "includes the custom user agent" do
                expect(subject.user_agent).to eq("community-ruby-starfleet-orbit/1.0")
            end

            it "returns a HTTP 200 status for a successful request" do
                response = subject.update_member
    
                expect(response).to eq("Update successful")
            end
        end
    end
end