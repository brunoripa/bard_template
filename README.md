# How to define a new service

## Elixir application creation

```elixir
mix phx.new --app <application> --module ApplicationModule --no-assets --no-dashboard --no-html --no-live --no-tailwind app
```

Note: in the above command, the final parameter `app` is hardcoded, as it's used to generate the docker image.

## Database keys

We want qualified string ids for the database keys; for example, if the entity is called `Todo`, a valid key is something like `todo-<UUID>`, like: `todo-f4e5ca69-cb4a-4587-aa96-550f50476f5c`

ADD: in ecto, you can define a specific primary key with ##EXAMPLE

## Application id

Each docker image must get provisioned with an `APPLICATION_ID` string id, which must be validated
by the following regex:

```
INSERT HERE
```

## Test coverage

The application must be correctly configured with the following QA dependencies (as of 5/21/2023 - in case never relevant version are available please notify to the Enry's Island Product team):

```elixir
...
# QA
{:dialyxir, "~> 1.3.0", runtime: false, only: [:dev, :test]},
{:credo, "~> 1.7.0", runtime: false, only: [:dev, :test]},
{:excoveralls, "~> 0.16.1", runtime: false, only: [:dev, :test]},
{:ex_doc, "~> 0.29.4", runtime: false, only: [:dev]}
```

For the coverage, add the following to the `project/1` function in `mix.exs`:

```elixir
...
test_coverage: [tool: ExCoveralls],
preferred_cli_env: [
    coveralls: :test,
    "coveralls.detail": :test,
    "coveralls.post": :test,
    "coveralls.html": :test
]
```

TODO: add coverage requirements.

For the docs generation, add:

```elixir
# Docs
name: "<App name>",
source_url: "<project_url>",
homepage_url: "<ask for info, if any>",
docs: [
    main: "<App name>", # The main page in the docs
    logo: "logo path, if any",
    extras: ["README.md"],
    formatters: ["html"]
]
```

## Devops

Each build must create two artifacts:

- docker container for application
- docker container for the application openapi specs

The file `DockerfielOpenapiSpecs` contains everything to generate the docker image with `swagger-ui` publishing the specs for the api.

For point 2 another option could be to generate a static version of the api specs (can be done using swagger-ui) and publish it as a cloud function (serverless).