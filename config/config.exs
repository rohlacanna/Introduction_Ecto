import Config

config :ecto4noobs, Ecto4noobs.Repo,
  database: "ecto4noobs_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :ecto4noobs,
  ecto_repos: [Ecto4noobs.Repo]
