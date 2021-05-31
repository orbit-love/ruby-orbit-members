# Orbit Members Helper Library for Ruby

![Build Status](https://github.com/orbit-love/ruby-orbit-members/workflows/CI/badge.svg)
[![Gem Version](https://badge.fury.io/rb/orbit_members.svg)](https://badge.fury.io/rb/orbit_members)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)](code_of_conduct.md)

> Orbit API helper library for Ruby. <br>This client can create, read, update and delete members and their identities in your Orbit workspace.

<img src="https://github.com/orbit-love/js-orbit-activities/blob/bc4ce38a34af95e40b2c3e54ba44d3df6b3d3aac/.github/logo.png" alt="Orbit" style="max-width: 300px; margin: 2em 0;">

## Package Usage

### Installation

To install this integration in a standalone app, add the gem to your `Gemfile`:

```ruby
gem "orbit_members"
```

Then, run `bundle install` from your terminal.

### Usage

#### Create a Member

To create amember:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "create_member",
    body: # The custom activity object in JSON format, see Orbit API docs for reference
)
```
#### Update a Member

To update a member:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "update_member",
    member_id: # The ID of the member,
    body: # The custom activity object in JSON format, see Orbit API docs for reference
)
```
#### Delete a Member

To delete a member:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "delete_member",
    member_id: # The ID of the member
)
```
#### List Members in a Workspace

To list members in a workspace:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "list_members",
    filters: # Any filters on the request in JSON format, see Orbit API docs for reference
)
```
#### Get Specific Member

To get a specific member:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "get_member",
    member_id: # The ID of the member
)
```
#### Get Member by an Identity

To find a member by an identity:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "find_member_by_identity",
    member_id: # The ID of the member,
    filters: # Identity filter to find by, see Orbit API docs for reference
)
```

#### Add an Identity to a Member

To add an identity to a member:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "add_identity",
    member_id: # The ID of the member,
    filters: # The new identity body in JSON format, see Orbit API docs for reference
)
```

#### Remove an Identity from a Member

To remove an identity from a member:

```ruby
OrbitMembers::Request.new(
    api_key: # Your Orbit API key,
    workspace_id: # Your Orbit workspace ID,
    action: "remove_identity",
    member_id: # The ID of the member,
    filters: # The identity to remove in JSON format, see Orbit API docs for reference
)
```


For details on the data structures the Orbit API expects, refer to the [Orbit API Documentation](https://docs.orbit.love/reference).

## Contributing

We 💜 contributions from everyone! Check out the [Contributing Guidelines](CONTRIBUTING.md) for more information.

## License

This is available as open source under the terms of the [MIT License](LICENSE).

## Code of Conduct

This project uses the [Contributor Code of Conduct](CODE_OF_CONDUCT.md). We ask everyone to please adhere by its guidelines.
