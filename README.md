# ![Ruby on Rails GraphQL Example App](logo.png)

[![Build Status](https://travis-ci.com/dostu/rails-graphql-realworld-example-app.svg?branch=master)](https://travis-ci.com/dostu/rails-graphql-realworld-example-app)

> ### Example Ruby on Rails GraphQL codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld GraphQL API spec](https://github.com/dostu/rails-graphql-realworld-example-app/blob/master/GRAPHQL_API_SPEC.md).

This repo is functionality complete — PRs and issues welcome!

You can also query the schema using [GraphiQL](https://realworld-graphql.herokuapp.com/graphiql).

There is [React + Apollo frontend](https://github.com/dostu/react-apollo-realworld-example-app) implementation which can be used with this backend.

## Installation

Make sure you have PostgreSQL installed.

1. Clone this repo
3. `bundle install` to install required dependencies
4. `rails db:reset` to create database, load schema and seed data
5. `rails s` to start the local server
