import Config

config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

config :logger, level: :debug

config :paddy,
  ecto_repos: [Paddy.Repo]

config :paddy, Paddy.Repo, url: "ecto://postgres:postgres@localhost/paddy"

config :paddy, Oban,
  engine: Oban.Pro.Queue.SmartEngine,
  repo: Paddy.Repo,
  name: :paddy,
  plugins: [
    Oban.Plugins.Gossip,
    {Oban.Pro.Plugins.DynamicCron, timezone: "America/Los_Angeles"},
    Oban.Pro.Plugins.Lifeline,
    {Oban.Pro.Plugins.DynamicPruner,
     state_overrides: [
       cancelled: {:max_age, {48, :months}},
       discarded: {:max_age, {48, :months}}
     ]}
  ],
  queues: [default: 10]
